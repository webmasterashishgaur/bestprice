
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-necesidadEnc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list necesidadEnc">
			
				<g:if test="${necesidadEncInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="necesidadEnc.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${necesidadEncInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="necesidadEnc.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${necesidadEncInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.comprador}">
				<li class="fieldcontain">
					<span id="comprador-label" class="property-label"><g:message code="necesidadEnc.comprador.label" default="Comprador" /></span>
					
						<span class="property-value" aria-labelledby="comprador-label"><g:link controller="comprador" action="show" id="${necesidadEncInstance?.comprador?.id}">${necesidadEncInstance?.comprador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="necesidadEnc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${necesidadEncInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="necesidadEnc.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${necesidadEncInstance?.estatus?.id}">${necesidadEncInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.imagen1}">
				<li class="fieldcontain">
					<span id="imagen1-label" class="property-label"><g:message code="necesidadEnc.imagen1.label" default="Imagen1" /></span>
					
						<span class="property-value" aria-labelledby="imagen1-label"><g:fieldValue bean="${necesidadEncInstance}" field="imagen1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.imagen2}">
				<li class="fieldcontain">
					<span id="imagen2-label" class="property-label"><g:message code="necesidadEnc.imagen2.label" default="Imagen2" /></span>
					
						<span class="property-value" aria-labelledby="imagen2-label"><g:fieldValue bean="${necesidadEncInstance}" field="imagen2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.imagen3}">
				<li class="fieldcontain">
					<span id="imagen3-label" class="property-label"><g:message code="necesidadEnc.imagen3.label" default="Imagen3" /></span>
					
						<span class="property-value" aria-labelledby="imagen3-label"><g:fieldValue bean="${necesidadEncInstance}" field="imagen3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.imagen4}">
				<li class="fieldcontain">
					<span id="imagen4-label" class="property-label"><g:message code="necesidadEnc.imagen4.label" default="Imagen4" /></span>
					
						<span class="property-value" aria-labelledby="imagen4-label"><g:fieldValue bean="${necesidadEncInstance}" field="imagen4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.imagen5}">
				<li class="fieldcontain">
					<span id="imagen5-label" class="property-label"><g:message code="necesidadEnc.imagen5.label" default="Imagen5" /></span>
					
						<span class="property-value" aria-labelledby="imagen5-label"><g:fieldValue bean="${necesidadEncInstance}" field="imagen5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="necesidadEnc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${necesidadEncInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${necesidadEncInstance?.id}" />
					<g:link class="edit" action="edit" id="${necesidadEncInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
