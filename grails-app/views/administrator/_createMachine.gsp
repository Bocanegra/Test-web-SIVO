<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.create.new.machine"/></h1>
    <g:formRemote name="formCreateUser" update="content" url="[controller:'administrator',action:'saveMachine']">
      <div class="dialog">
        <table>
          <tbody>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="name"><g:message code="machine.name.label" default="Nombre"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: machineInstance, field: 'name', 'errors')}">
              <g:textField name="name" maxlength="100" value="${machineInstance?.name}"/>
            </td>

          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="so"><g:message code="machine.so.label" default="Sistema operativo"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: machineInstance, field: 'so', 'errors')}">
              <g:textField name="so" maxlength="100" value="${machineInstance?.so}"/>
            </td>
          </tr>
          <tr class="prop">
            <td valign="top" class="name">
              <label for="ip"><g:message code="machine.ip.label" default="Dirección"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: machineInstance, field: 'ip', 'errors')}">
              <g:textField name="ip" maxlength="100" value="${machineInstance?.ip}"/>
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