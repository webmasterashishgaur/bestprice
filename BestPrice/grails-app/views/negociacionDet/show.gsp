
<%@ page import="bestprice.NegociacionDet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'negociacionDet.label', default: 'NegociacionDet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-negociacionDet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-negociacionDet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list negociacionDet">
			
				<g:if test="${negociacionDetInstance?.comentarioComprador}">
				<li class="fieldcontain">
					<span id="comentarioComprador-label" class="property-label"><g:message code="negociacionDet.comentarioComprador.label" default="Comentario Comprador" /></span>
					
						<span class="property-value" aria-labelledby="comentarioComprador-label"><g:fieldValue bean="${negociacionDetInstance}" field="comentarioComprador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionDetInstance?.comentarioVendedor}">
				<li class="fieldcontain">
					<span id="comentarioVendedor-label" class="property-label"><g:message code="negociacionDet.comentarioVendedor.label" default="Comentario Vendedor" /></span>
					
						<span class="property-value" aria-labelledby="comentarioVendedor-label"><g:fieldValue bean="${negociacionDetInstance}" field="comentarioVendedor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionDetInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="negociacionDet.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${negociacionDetInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${negociacionDetInstance?.id}" />
					<g:link class="edit" action="edit" id="${negociacionDetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
