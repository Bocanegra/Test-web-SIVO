<div class="fila">
  <div class="col_tituloM"><g:message code="machine.name.label" default="Nombre"/></div>
  <div class="col_tituloM"><g:message code="machine.so.label" default="Sistema operativo"/></div>
  <div class="col_tituloM"><g:message code="machine.ip.label" default="Dirección"/></div>
</div>
<div class="fila">
  <g:formRemote name="formCreateUser" update="content" url="[controller:'administrator',action:'addMachineToUser']">
  %{--saveAndAssociate--}%
    <g:hiddenField name="id" value="${userInstance?.id}"/>
    <div class="coloddM"><g:textField name="name" maxlength="100" size="18"/></div>
    <div class="coloddM"><g:textField name="so" maxlength="100" size="18"/></div>
    <div class="coloddM"><g:textField name="ip" maxlength="100" size="18"/></div>
    <div class="coloddMSave">
      <g:submitButton name="create" class="save" value="Crear"/>
    </div>
  </g:formRemote>
</div>
