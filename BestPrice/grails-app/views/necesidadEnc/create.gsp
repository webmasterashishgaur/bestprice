<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
      	<r:require modules="bootstrap"/>		
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.create.label" args="['Compra']" default="Compra" /></title>
	</head>
	<body>
		<a href="#create-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>	
			</ul>
		</div>
		<div id="create-necesidadEnc" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<div class="form">
				<h1><g:message code="default.create.label" args="['Compra']" /></h1>			
				<g:uploadForm action="save"  method="post">
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
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:uploadForm>
			</div>	
		</div>
	</body>
</html>
