<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>SIVO</title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'general.css')}"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'demo_table.css')}"/>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'demo_table_jui.css')}"/>
  <g:javascript library="application"/>
  <g:javascript library="jquery"/>
</head>
<body>
<div id="content">
  <g:render template="logo"/>
</div>
<div id="footer">
  <g:render template="login"/>
</div>
</body>
</html>