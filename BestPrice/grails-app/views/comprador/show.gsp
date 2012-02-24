
<%@ page import="bestprice.Comprador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comprador.label', default: 'Comprador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comprador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>					
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comprador" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comprador">
			
				<g:if test="${compradorInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="comprador.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${compradorInstance}" field="usuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="comprador.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${compradorInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="comprador.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${compradorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.appPaterno}">
				<li class="fieldcontain">
					<span id="appPaterno-label" class="property-label"><g:message code="comprador.appPaterno.label" default="App Paterno" /></span>
					
						<span class="property-value" aria-labelledby="appPaterno-label"><g:fieldValue bean="${compradorInstance}" field="appPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.appMaterno}">
				<li class="fieldcontain">
					<span id="appMaterno-label" class="property-label"><g:message code="comprador.appMaterno.label" default="App Materno" /></span>
					
						<span class="property-value" aria-labelledby="appMaterno-label"><g:fieldValue bean="${compradorInstance}" field="appMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="comprador.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${compradorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="comprador.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${compradorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.cp}">
				<li class="fieldcontain">
					<span id="cp-label" class="property-label"><g:message code="comprador.cp.label" default="Cp" /></span>
					
						<span class="property-value" aria-labelledby="cp-label"><g:fieldValue bean="${compradorInstance}" field="cp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="comprador.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${compradorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="comprador.comentarios.label" default="Comentarios" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${compradorInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="comprador.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${compradorInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="comprador.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${compradorInstance?.estado?.id}">${compradorInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="comprador.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${compradorInstance?.estatus?.id}">${compradorInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="comprador.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${compradorInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="comprador.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${compradorInstance?.pais?.id}">${compradorInstance?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${compradorInstance?.poblacion}">
				<li class="fieldcontain">
					<span id="poblacion-label" class="property-label"><g:message code="comprador.poblacion.label" default="Poblacion" /></span>
					
						<span class="property-value" aria-labelledby="poblacion-label"><g:link controller="poblacion" action="show" id="${compradorInstance?.poblacion?.id}">${compradorInstance?.poblacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${compradorInstance?.id}" />
					<g:link class="edit" action="edit" id="${compradorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
