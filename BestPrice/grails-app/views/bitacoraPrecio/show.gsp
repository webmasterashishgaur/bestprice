
<%@ page import="bestprice.BitacoraPrecio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bitacoraPrecio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bitacoraPrecio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bitacoraPrecio">
			
				<g:if test="${bitacoraPrecioInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="bitacoraPrecio.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${bitacoraPrecioInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bitacoraPrecioInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bitacoraPrecio.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bitacoraPrecioInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bitacoraPrecioInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bitacoraPrecio.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bitacoraPrecioInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bitacoraPrecioInstance?.id}" />
					<g:link class="edit" action="edit" id="${bitacoraPrecioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
