<g:setProvider library="jquery"/>
<div id="Bar">
<g:remoteLink action="listUsers" update="content">
  <div class="imgMenu1" title="<g:message code="tooltip.show.user.list"/>"></div>
</g:remoteLink>
<g:remoteLink action="createUser" update="content">
  <div class="imgMenu2" title="<g:message code="tooltip.create.new.user"/>"></div>
</g:remoteLink>
<g:remoteLink action="listMachines" update="content">
  <div class="imgMenu3" title="<g:message code="tooltip.show.machine.list"/>"></div>
</g:remoteLink>
<g:remoteLink action="createMachine" update="content">
  <div class="imgMenu4" title="<g:message code="tooltip.create.new.machine"/>"></div>
</g:remoteLink>
<g:remoteLink action="logout" update="footer" onComplete="${remoteFunction(action:'putLogo',update:'content')}">
  <div class="imgMenu5" title="<g:message code="tooltip.exit"/>" name="exit"/></div>
</g:remoteLink>
</div>