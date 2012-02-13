
<%@ page import="bestprice.Vendedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendedor.label', default: 'Vendedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vendedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vendedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vendedor">
			
				<g:if test="${vendedorInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="vendedor.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${vendedorInstance}" field="usuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="vendedor.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${vendedorInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="vendedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${vendedorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.appPaterno}">
				<li class="fieldcontain">
					<span id="appPaterno-label" class="property-label"><g:message code="vendedor.appPaterno.label" default="App Paterno" /></span>
					
						<span class="property-value" aria-labelledby="appPaterno-label"><g:fieldValue bean="${vendedorInstance}" field="appPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.appMaterno}">
				<li class="fieldcontain">
					<span id="appMaterno-label" class="property-label"><g:message code="vendedor.appMaterno.label" default="App Materno" /></span>
					
						<span class="property-value" aria-labelledby="appMaterno-label"><g:fieldValue bean="${vendedorInstance}" field="appMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="vendedor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${vendedorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="vendedor.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${vendedorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.cp}">
				<li class="fieldcontain">
					<span id="cp-label" class="property-label"><g:message code="vendedor.cp.label" default="Cp" /></span>
					
						<span class="property-value" aria-labelledby="cp-label"><g:fieldValue bean="${vendedorInstance}" field="cp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="vendedor.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${vendedorInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="vendedor.comentarios.label" default="Comentarios" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${vendedorInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.admiteDevolucion}">
				<li class="fieldcontain">
					<span id="admiteDevolucion-label" class="property-label"><g:message code="vendedor.admiteDevolucion.label" default="Admite Devolucion" /></span>
					
						<span class="property-value" aria-labelledby="admiteDevolucion-label"><g:formatBoolean boolean="${vendedorInstance?.admiteDevolucion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="vendedor.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${vendedorInstance?.estado?.id}">${vendedorInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="vendedor.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:formatBoolean boolean="${vendedorInstance?.estatus}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.fechaCreacion}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label"><g:message code="vendedor.fechaCreacion.label" default="Fecha Creacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaCreacion-label"><g:formatDate date="${vendedorInstance?.fechaCreacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="vendedor.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${vendedorInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.formaPago}">
				<li class="fieldcontain">
					<span id="formaPago-label" class="property-label"><g:message code="vendedor.formaPago.label" default="Forma Pago" /></span>
					
						<span class="property-value" aria-labelledby="formaPago-label"><g:link controller="formaPago" action="show" id="${vendedorInstance?.formaPago?.id}">${vendedorInstance?.formaPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="vendedor.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${vendedorInstance?.pais?.id}">${vendedorInstance?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.poblacion}">
				<li class="fieldcontain">
					<span id="poblacion-label" class="property-label"><g:message code="vendedor.poblacion.label" default="Poblacion" /></span>
					
						<span class="property-value" aria-labelledby="poblacion-label"><g:link controller="poblacion" action="show" id="${vendedorInstance?.poblacion?.id}">${vendedorInstance?.poblacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendedorInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="vendedor.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${vendedorInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vendedorInstance?.id}" />
					<g:link class="edit" action="edit" id="${vendedorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
