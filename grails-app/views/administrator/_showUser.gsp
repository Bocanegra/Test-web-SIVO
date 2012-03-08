<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.show.user.list"/></h1>
    <div class="tabla">
      <div class="fila">
        <div class="col_titulo"><g:message code="user.id.label" default="Id"/></div>
        <div class="col_titulo"><g:message code="user.name.label" default="Nombre"/></div>
        <div class="col_titulo"><g:message code="user.so.label" default="Contrase&ntilde;a"/></div>
      </div>
      <div class="fila">
        <div class="colodd">${fieldValue(bean: userInstance, field: "id")}</div>
        <div class="colodd">${fieldValue(bean: userInstance, field: "name")}</div>
        <div class="colodd">********</div>
      </div>
    </div>
    <div class="lista">
      <g:if test="${!userInstance.machines}">

      </g:if>
      <g:else>
        <span class="tituloLista">Máquinas</span>
      </g:else>
      <ul>
        <g:each in="${userInstance.machines}" var="m">
          <li>
            <g:remoteLink controller="administrator" action="showMachine" update="content " id="${m.id}">${m.ip}</g:remoteLink>
          </li>
        </g:each>
      </ul>
    </div>

    <div class="buttons">
      <g:if test="${!userInstance.machines}">
        <g:remoteLink action="showAddMachineDiv" controller="administrator" update="addNewMachine" id="${userInstance?.id}">
          <img class="logoImg" title="A&ntilde;adir Maquina" src="${createLinkTo(dir: 'images', file: 'addMachineMini.png')}" alt="addMachine" border="0"/>
        </g:remoteLink>
      </g:if>
      <g:remoteLink action="editUser" controller="administrator" update="content" id="${userInstance?.id}">
        <img class="logoImg" title="Editar" src="${createLinkTo(dir: 'images', file: 'edit.png')}" alt="editUser" border="0"/>
      </g:remoteLink>
      <g:remoteLink action="confirmUser" controller="administrator" update="confirm" id="${userInstance?.id}">
        <img class="logoImg" title="Eliminar" src="${createLinkTo(dir: 'images', file: 'delete.png')}" alt="deleteUser" border="0"/>
      </g:remoteLink>
      <div id="confirm"></div>
    </div>
    <div id="addNewMachine"></div>
  </div>
  <div id="footer2"></div>
</div>