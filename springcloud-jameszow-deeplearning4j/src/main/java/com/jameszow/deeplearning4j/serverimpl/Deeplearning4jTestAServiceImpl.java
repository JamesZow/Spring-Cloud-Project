package com.jameszow.deeplearning4j.serverimpl;

import com.jameszow.deeplearning4j.server.Deeplearning4jTestAService;
import org.deeplearning4j.api.storage.StatsStorage;
import org.deeplearning4j.datasets.iterator.impl.EmnistDataSetIterator;
import org.deeplearning4j.earlystopping.EarlyStoppingConfiguration;
import org.deeplearning4j.earlystopping.EarlyStoppingResult;
import org.deeplearning4j.earlystopping.saver.LocalFileModelSaver;
import org.deeplearning4j.earlystopping.scorecalc.DataSetLossCalculator;
import org.deeplearning4j.earlystopping.termination.MaxEpochsTerminationCondition;
import org.deeplearning4j.earlystopping.termination.MaxTimeIterationTerminationCondition;
import org.deeplearning4j.earlystopping.trainer.EarlyStoppingTrainer;
import org.deeplearning4j.eval.Evaluation;
import org.deeplearning4j.eval.ROCMultiClass;
import org.deeplearning4j.nn.api.OptimizationAlgorithm;
import org.deeplearning4j.nn.conf.MultiLayerConfiguration;
import org.deeplearning4j.nn.conf.NeuralNetConfiguration;
import org.deeplearning4j.nn.conf.layers.DenseLayer;
import org.deeplearning4j.nn.conf.layers.OutputLayer;
import org.deeplearning4j.nn.multilayer.MultiLayerNetwork;
import org.deeplearning4j.nn.weights.WeightInit;
import org.deeplearning4j.optimize.listeners.ScoreIterationListener;
import org.deeplearning4j.ui.api.UIServer;
import org.deeplearning4j.ui.stats.StatsListener;
import org.deeplearning4j.ui.storage.InMemoryStatsStorage;
import org.nd4j.linalg.activations.Activation;
import org.nd4j.linalg.dataset.api.iterator.DataSetIterator;
import org.nd4j.linalg.learning.config.Adam;
import org.nd4j.linalg.lossfunctions.LossFunctions;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * 描述:
 * 深度学习测试服务实现类
 *
 * @author James Zow
 * @create 2019-01-5 12:47
 */
@Service
public class Deeplearning4jTestAServiceImpl implements Deeplearning4jTestAService {
    public EmnistDataSetIterator.Set emnistSet = EmnistDataSetIterator.Set.BALANCED;

    @Override
    public void deeplearningTest() {
        EmnistDataSetIterator.Set emnistSet =  EmnistDataSetIterator.Set.BALANCED;
        int batchSize = 16; // 在网络中同时训练多个例子
        int rngSeed = 123;
        int numRows = 14;
        int numColumns = 14;
        int reportingInterval = 5;
        // 为emnist创建数据迭代器 (我这里创了两个)
        try {
            DataSetIterator emnistTrain = new EmnistDataSetIterator(emnistSet, batchSize, true);
            DataSetIterator emnistTest = new EmnistDataSetIterator(emnistSet, batchSize, false);
            int outputNum = EmnistDataSetIterator.numLabels(emnistSet);

            // 神经网络配置 (还没有初始化)
            MultiLayerConfiguration conf = new NeuralNetConfiguration.Builder()
                    .seed(rngSeed)
                    .optimizationAlgo(OptimizationAlgorithm.STOCHASTIC_GRADIENT_DESCENT)
                    .updater(new Adam())
                    .l2(1e-4)
                    .list()
                    .layer(new DenseLayer.Builder()
                            .nIn(numRows * numColumns) // 输入层的数据数量
                            .nOut(1000) // 输出层的数据数量
                            .activation(Activation.RELU) // 激活函数
                            .weightInit(WeightInit.XAVIER) // 权重初始化
                            .build())
                    .layer(new OutputLayer.Builder(LossFunctions.LossFunction.NEGATIVELOGLIKELIHOOD)
                            .nIn(1000)
                            .nOut(outputNum)
                            .activation(Activation.SOFTMAX)
                            .weightInit(WeightInit.XAVIER)
                            .build())
                    .pretrain(false).backprop(true)
                    .build();
            // 创建MLN网络
            MultiLayerNetwork network = new MultiLayerNetwork(conf);

            UIServer uiServer = UIServer.getInstance();
            StatsStorage statsStorage = new InMemoryStatsStorage();
            uiServer.attach(statsStorage);

            network.init();

            network.setListeners(new StatsListener(statsStorage),new ScoreIterationListener(1));
            // here we set up an early stopping trainer
            // early stopping is useful when your trainer runs for
            // a long time or you need to programmatically stop training
            EarlyStoppingConfiguration esConf = new EarlyStoppingConfiguration.Builder()
                    .epochTerminationConditions(new MaxEpochsTerminationCondition(5))
                    .iterationTerminationConditions(new MaxTimeIterationTerminationCondition(20, TimeUnit.MINUTES))
                    .scoreCalculator(new DataSetLossCalculator(emnistTest, true))
                    .evaluateEveryNEpochs(1)
                    .modelSaver(new LocalFileModelSaver(System.getProperty("user.dir")))
                    .build();

            // 训练
            EarlyStoppingTrainer trainer = new EarlyStoppingTrainer(esConf, network, emnistTrain);
            EarlyStoppingResult result = trainer.fit();

            // 打印训练结果
            System.out.println("Termination reason: " + result.getTerminationReason());
            System.out.println("Termination details: " + result.getTerminationDetails());
            System.out.println("Total epochs: " + result.getTotalEpochs());
            System.out.println("Best epoch number: " + result.getBestModelEpoch());
            System.out.println("Score at best epoch: " + result.getBestModelScore());

            // 评估性能
            Evaluation eval = network.evaluate(emnistTest);
            System.out.println(eval.accuracy());
            System.out.println(eval.precision());
            System.out.println(eval.recall());

            // 评估ROC并计算曲线下面积
            ROCMultiClass roc = network.evaluateROCMultiClass(emnistTest);
            System.out.println(roc.calculateAverageAUC());

            // 计算单个类别的AUC
            int classIndex = 0;
            System.out.println(roc.calculateAUC(classIndex));

            // 可以打印评估中的所有统计信息
            System.out.println(eval.stats());
            System.out.println(roc.stats());
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}