
<%@ page import="bestprice.FormaPago" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formaPago.label', default: 'FormaPago')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-formaPago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-formaPago" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list formaPago">
			
				<g:if test="${formaPagoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="formaPago.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${formaPagoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.valorPago}">
				<li class="fieldcontain">
					<span id="valorPago-label" class="property-label"><g:message code="formaPago.valorPago.label" default="Valor Pago" /></span>
					
						<span class="property-value" aria-labelledby="valorPago-label"><g:fieldValue bean="${formaPagoInstance}" field="valorPago"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="formaPago.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${formaPagoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="formaPago.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:fieldValue bean="${formaPagoInstance}" field="estatus.descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${formaPagoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="formaPago.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${formaPagoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${formaPagoInstance?.id}" />
					<g:link class="edit" action="edit" id="${formaPagoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
