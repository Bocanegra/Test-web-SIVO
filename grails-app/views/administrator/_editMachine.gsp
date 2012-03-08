<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <g:formRemote name="formEditMachine" update="content" url="[controller:'administrator',action:'updateMachine']">
      <g:hiddenField name="id" value="${machineInstance?.id}"/>
      <g:hiddenField name="version" value="${machineInstance?.version}"/>
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
           </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="Guardar" class="save" value="Guardar"/></span>
      </div>
    </g:formRemote>
  </div>
  <div id="footer2"></div>
</div>


