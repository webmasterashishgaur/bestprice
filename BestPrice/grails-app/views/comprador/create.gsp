<%@ page import="bestprice.Comprador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
      	<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'comprador.label', default: 'Comprador')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-comprador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>				
			</ul>
		</div>
		<div id="create-comprador" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<sec:ifNotLoggedIn>
				<div id="lytColLoguin">
					<g:include controller="login" action="auth" />						
				</div>
			</sec:ifNotLoggedIn>			
			
			<div class="form">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>			
				<g:form action="save">
					<fieldset>
						<g:render template="form"/>
					</fieldset>

					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>				
				</g:form>
			</div>
			
				<g:hasErrors bean="${compradorInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${compradorInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>			
							
		</div>
	</body>
</html>
