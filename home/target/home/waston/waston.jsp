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
<div class="botui-app-container" id="hello-world">
    <bot-ui></bot-ui>
</div>
<script src="../js/vue.js"></script>
<script src="../js/botui/botui.js"></script>
<script>
    var botui = new BotUI('botui-app') // id of container

    botui.message.bot({ // show first message
        delay: 200,
        content: 'hello'
    }).then(() => {
        return botui.message.bot({ // second one
            delay: 1000, // wait 1 sec.
            content: 'how are you?'
        })
    }).then(() => {
        return botui.action.button({ // let user do something
            delay: 1000,
            action: [
                {
                    text: 'Good',
                    value: 'good'
                },
                {
                    text: 'Really Good',
                    value: 'really_good'
                }
            ]
        })
    }).then(res => {
        return botui.message.bot({
            delay: 1000,
            content: `You are feeling ${res.text}!`
        })
    })
</script>

</body>
</html>

