<%--
  Created by IntelliJ IDEA.
  User: jameszow
  Date: 2019-07-21
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../js/botui/botui.min.css">
    <link rel="stylesheet" href="../js/botui/botui-theme-default.css">
</head>
<body>
<div class="botui-app-container" id="test">
    <bot-ui></bot-ui>
</div>
<script src="../js/vue.js"></script>
<script src="../js/botui/botui.js"></script>
<script src="../js/jquery-3.4.1.js"></script>
<script>
    var botui = new BotUI('test');

    botui.message.add({
        photo: 'https://moin.im/face.svg',
        loading: true
    }).then(function (index) {
        setTimeout(function () {
            botui.message.update(index, {
                content: '你好我是JamesZow机器人!',
                loading: false
            }).then(function () {
                botui.message.add({
                    // delay: 2000,
                    //loading: true,
                    photo: true,
                    photo: 'https://moin.im/face.svg',
                    content: '有什么问题可以询问我'
                }).then(function () {
                    return botui.action.text({
                        action: {
                            placeholder: "Enter your text here"
                        }
                    });
                }).then(function (res) {
                    var cc = res.value.toString();
                    if(cc == '启动服务'){
                        $.ajax({
                            type : "post",
                            url : "<%=request.getContextPath()%>/waston/test",
                            data : {},
                            success : function (data) {
                                console.info(data);
                                botui.message.add({
                                    photo: true,
                                    photo: 'https://moin.im/face.svg',
                                    delay: 1000,
                                    content : '已启动'
                                });
                            },
                            error :function () {
                                botui.message.add({
                                    photo: true,
                                    photo: 'https://moin.im/face.svg',
                                    delay: 1000,
                                    content : '启动失败'
                                });
                            }

                        })
                    }else {
                        botui.message.add({
                            photo: true,
                            photo: 'https://moin.im/face.svg',
                            delay: 1000,
                            content : res.value
                        });
                    }
                })
            });
        });
    });
</script>

</body>
</html>

