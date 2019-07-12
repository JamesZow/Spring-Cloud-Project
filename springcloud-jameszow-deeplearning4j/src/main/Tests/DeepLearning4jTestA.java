import org.deeplearning4j.nn.api.OptimizationAlgorithm;
import org.deeplearning4j.nn.conf.MultiLayerConfiguration;
import org.deeplearning4j.nn.conf.NeuralNetConfiguration;
import org.deeplearning4j.nn.weights.WeightInit;
import org.nd4j.linalg.learning.config.Sgd;

/**
 * 描述：
 * 测试1
 *
 * @author: James Zow
 * @create: 2019-02-22 15:27
 **/
public class DeepLearning4jTestA {

    public static void main(String [] args){
        MultiLayerConfiguration configuration = new NeuralNetConfiguration.Builder()
                .weightInit(WeightInit.XAVIER)
               // .activation("a")
                .optimizationAlgo(OptimizationAlgorithm.STOCHASTIC_GRADIENT_DESCENT)
                .updater(new Sgd(0.05))
                .list()
             //   .backpropType(true)
                .build();
    }
}
