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
    var botui = new BotUI('hello-world');

    botui.message.add({
        photo: 'https://moin.im/face.svg',
        loading: true
    }).then(function (index) {
        setTimeout(function () {
            botui.message.update(index, {
                content: 'Hello World from bot!',
                loading: false
            }).then(function () {
                botui.message.add({
                    delay: 2000,
                    //loading: true,
                    photo: true,
                    photo: 'https://moin.im/face.svg',
                    content: 'Delayed Hello World'
                });
            });
        }, 5000);
    });

    botui.message.add({
        human: true,
        photo: false,
        content: 'Hello World from human!'
    }).then(function () {
        botui.action.select({
            action: {
                placeholder : "Select Language",
                value: 'TR,EN', // Selected value or Selected Array object. Example: [{value: "TR", text : "Türkçe" },{value: "EN", text : "English" }]
                multipleselect : true, // Default: false
                options : [
                    {value: "EN", text : "English" },
                    {value: "ES", text : "Español" },
                    {value: "TR", text : "Türkçe" },
                    {value: "DE", text : "Deutsch" },
                    {value: "FR", text : "Français" },
                    {value: "IT", text : "Italiano" },
                ],
                button: {
                    icon: 'check',
                    label: 'OK'
                }
            }
        }).then(function (res) {
            console.log(res.value);
        });
    });
</script>

</body>
</html>

