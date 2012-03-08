<g:setProvider library="jquery"/>
<g:javascript>
  function changeBackground() {
    $('#password').css('background-color', 'white');
  }
</g:javascript>
<div style="margin-top:20px;">
  <g:if test="${flash.login == 'fail'}">
    <g:javascript>
      $("#password").css("background-color", "red");
    </g:javascript>
  </g:if>
  <g:formRemote id="form" name="login" update="footer" url="[controller:'administrator',action:'login']">
    <label for="name"><g:message code="administrator.name.label" default="Name"/></label>
    <g:textField name="name" value="${admin?.name}"/>
    <label for="password"><g:message code="administrator.password.label" default="Password"/></label>
    <g:passwordField id="password" name="password" value="" onclick="changeBackground()"/>
    <g:submitButton name="login" value="Login"/>
    <g:if test="${flash.login == 'fail'}">
      <p style="color:red;">Contrase&ntilde;a incorrecta</p>
      <g:set var="login" value="" scope="flash" />
    </g:if>
  </g:formRemote>
</div>