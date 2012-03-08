<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.show.machine.list"/></h1>
    <div class="tabla">
      <div class="fila">
        <div class="col_tituloM"><g:message code="machine.id.label" default="Id"/></div>
        <div class="col_tituloM"><g:message code="machine.name.label" default="Nombre"/></div>
        <div class="col_tituloM"><g:message code="machine.so.label" default="Sistema operativo"/></div>
        <div class="col_tituloM"><g:message code="machine.ip.label" default="Dirección"/></div>
      </div>
      <g:each in="${machineInstanceList}" status="i" var="machineInstance">
        <div class="fila">
          <g:remoteLink action="showMachine" controller="administrator" update="content" id="${machineInstance.id}">
            <div class="${(i % 2) == 0 ? 'coloddM' : 'colevenM'}">${fieldValue(bean: machineInstance, field: "id")}</div>
            <div class="${(i % 2) == 0 ? 'coloddM' : 'colevenM'}">${fieldValue(bean: machineInstance, field: "name")}</div>
            <div class="${(i % 2) == 0 ? 'coloddM' : 'colevenM'}">${fieldValue(bean: machineInstance, field: "so")}</div>
            <div class="${(i % 2) == 0 ? 'coloddM' : 'colevenM'}">${fieldValue(bean: machineInstance, field: "ip")}</div>
          </g:remoteLink>
        </div>
      </g:each>
    </div>
  </div>
  <div id="footer2"></div>
</div>
