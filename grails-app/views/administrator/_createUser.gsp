<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.create.new.user"/></h1>
    <g:formRemote name="formCreateUser" update="content" url="[controller:'administrator',action:'saveUser']">
      <div class="dialog">
        <table>
          <tbody>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="name"><g:message code="user.name.label" default="Nombre"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
              <g:textField name="name" maxlength="100" value="${userInstance?.name}"/>
            </td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="password"><g:message code="user.password.label" default="Contrase&ntilde;a"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
              <g:passwordField  name="password" maxlength="100" value="${userInstance?.password}"/>
            </td>
          </tr>
          <tr>
            <td></td>
            <td sytle="color:red;">${misErrores}</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="Crear"/></span>
      </div>
    </g:formRemote>
  </div>
  <div id="footer2"></div>
</div>