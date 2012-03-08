<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <g:formRemote name="formEditUser" update="content" url="[controller:'administrator', action:'updateUser']">
      <g:hiddenField name="id" value="${userInstance?.id}"/>
      <g:hiddenField name="version" value="${userInstance?.version}"/>
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
              <g:passwordField name="password" maxlength="100" value="${userInstance?.password}"/>
            </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="machines"><g:message code="user.machines.label" default="Máquinas"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'machines', 'errors')}">
              <g:select name="machines" from="${sivo_web.Machine.list()}" multiple="yes" optionKey="id" size="5" value="${userInstance?.machines*.id}"/>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button">
          <g:submitButton name="Guardar" class="save" value="Guardar"/>
        </span>
      </div>
    </g:formRemote>
  </div>
  <div id="footer2"></div>
</div>
