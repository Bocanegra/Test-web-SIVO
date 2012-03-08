<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.show.user.list"/></h1>
    <div class="tabla">
      <div class="fila">
        <div class="col_tituloM"><g:message code="machine.id.label" default="Id"/></div>
        <div class="col_tituloM"><g:message code="machine.name.label" default="Nombre"/></div>
        <div class="col_tituloM"><g:message code="machine.so.label" default="Sistema operativo"/></div>
        <div class="col_tituloM"><g:message code="machine.ip.label" default="Dirección"/></div>
      </div>
      <div class="fila">
        <div class="coloddM">${fieldValue(bean: machineInstance, field: "id")}</div>
        <div class="coloddM">${fieldValue(bean: machineInstance, field: "name")}</div>
        <div class="coloddM">${fieldValue(bean: machineInstance, field: "so")}</div>
        <div class="coloddM">${fieldValue(bean: machineInstance, field: "ip")}</div>
      </div>

    </div>
    <div class="lista">
      <span class="tituloLista">Usuarios</span>
      <ul>
        <g:each in="${machineInstance.users}" var="u">
          <li>
            <g:remoteLink controller="administrator" action="showUser" update="content " id="${u.id}">${u.name}</g:remoteLink>
          </li>
        </g:each>
      </ul>
    </div>
    <div class="buttons">
      <g:remoteLink action="editMachine" controller="administrator" update="content" id="${machineInstance?.id}">
        <img id="logoImg" title="Editar" src="${createLinkTo(dir: 'images', file: 'edit.png')}" alt="editMachine" border="0"/>
      </g:remoteLink>
      <g:remoteLink action="confirmMachine" controller="administrator" update="confirm" id="${machineInstance?.id}">
        <img id="logoImg" title="Eliminar" src="${createLinkTo(dir: 'images', file: 'delete.png')}" alt="deleteMachine" border="0"/>
      </g:remoteLink>
    </div>
    <div id="confirm"></div>
  </div>
  <div id="footer2"></div>
</div>
