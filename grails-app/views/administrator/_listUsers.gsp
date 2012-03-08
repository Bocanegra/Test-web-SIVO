%{--<g:setProvider library="jquery"/>--}%
<div id="container">
  <div id="header2"></div>
  <div id="principal">
    <h1><g:message code="title.show.user.list"/></h1>
    <div class="tabla">
      <div class="fila">
        <div class="col_titulo"><g:message code="user.id.label" default="Id"/></div>
        <div class="col_titulo"><g:message code="user.name.label" default="Nombre"/></div>
        <div class="col_titulo"><g:message code="user.password.label" default="Contrase&ntilde;a"/></div>
      </div>
      <g:each in="${userInstanceList}" status="i" var="userInstance">
        <g:remoteLink action="showUser" update="content" controller="administrator" id="${userInstance.id}">
          <div class="fila">
            <div class="${(i % 2) == 0 ? 'colodd' : 'coleven'}">
              ${fieldValue(bean: userInstance, field: "id")}</div>
            <div class="${(i % 2) == 0 ? 'colodd' : 'coleven'}">${fieldValue(bean: userInstance, field: "name")}</div>
            <div class="${(i % 2) == 0 ? 'colodd' : 'coleven'}">********</div>
          </div>
        </g:remoteLink>
      </g:each>
    </div>
  </div>
  <div id="footer2"></div>
</div>
