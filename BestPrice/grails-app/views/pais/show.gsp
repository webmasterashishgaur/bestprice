
<%@ page import="bestprice.Pais" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pais" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pais">
			
				<g:if test="${paisInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="pais.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${paisInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.nombreCorto}">
				<li class="fieldcontain">
					<span id="nombreCorto-label" class="property-label"><g:message code="pais.nombreCorto.label" default="Nombre Corto" /></span>
					
						<span class="property-value" aria-labelledby="nombreCorto-label"><g:fieldValue bean="${paisInstance}" field="nombreCorto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pais.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${paisInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.estados}">
				<li class="fieldcontain">
					<span id="estados-label" class="property-label"><g:message code="pais.estados.label" default="Estados" /></span>
					
						<g:each in="${paisInstance.estados}" var="e">
						<span class="property-value" aria-labelledby="estados-label"><g:link controller="estado" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="pais.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${paisInstance?.estatus?.id}">${paisInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pais.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${paisInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paisInstance?.id}" />
					<g:link class="edit" action="edit" id="${paisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
