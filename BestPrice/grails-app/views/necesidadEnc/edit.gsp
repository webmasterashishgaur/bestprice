<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
      	<r:require modules="bootstrap"/>		
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-necesidadEnc" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div class="form">
				<g:form method="post" >
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>				
					<g:hiddenField name="id" value="${necesidadEncInstance?.id}" />
					<g:hiddenField name="version" value="${necesidadEncInstance?.version}" />
					<fieldset>
						<g:render template="form"/>
					</fieldset>
					
					<g:hasErrors bean="${necesidadEncInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${necesidadEncInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					
					<fieldset class="buttons">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>			
		</div>
	</body>
</html>
