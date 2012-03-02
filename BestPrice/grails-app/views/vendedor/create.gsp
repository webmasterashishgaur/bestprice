<%@ page import="bestprice.Vendedor" %>
<!doctype html>
<html>
	<head>
		<g:javascript library="prototype"/>	
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendedor.label', default: 'Vendedor')}" />
		<g:javascript>
			function updateCity(e) {
				//The response comes back as a bunch-o-JSON
				var estados = eval("(" + e.responseText + ")")	// evaluate JSON
				if (estados) {
					var rselect = document.getElementById('estado')

					// Clear all previous options
					var l = rselect.length
		
					while (l > 0) {
						l--
						rselect.remove(l)
					}
		
					// Rebuild the select
					for (var i=0; i < estados.length; i++) {
						var estado = estados[i]
						var opt = document.createElement('option');
						opt.text = estado.nombreCorto
						opt.value = estado.id
					  	try {
					    	rselect.add(opt, null) // standards compliant; doesn't work in IE
					  	}
				  		catch(ex) {
				    		rselect.add(opt) // IE only
				  		}
					}
					rselect.selectedIndex = 0
				}
				//updatePoblacion(e);
			}
			// This is called when the page loads to initialize city
			var zselect = document.getElementById('pais')
			var zopt = zselect.options[zselect.selectedIndex]
			${remoteFunction(controller:"pais", action:"ajaxGetEstados", params:"'id=' + zopt.value", onComplete:"updateCity(e)")}
		</g:javascript>	
		
		
		<g:javascript>
			function updatePoblacion(e) {
				//The response comes back as a bunch-o-JSON
				var poblaciones = eval("(" + e.responseText + ")")	// evaluate JSON
				//alert(poblaciones);
				if (poblaciones) {
					var rselect = document.getElementById('poblacion')

					// Clear all previous options
					var l = rselect.length
		
					while (l > 0) {
						l--
						rselect.remove(l)
					}
		
					// Rebuild the select
					for (var i=0; i < poblaciones.length; i++) {
						var poblacion = poblaciones[i]
						var opt = document.createElement('option');
						opt.text = poblacion.nombreCorto
						opt.value = poblacion.id
					  	try {
					    	rselect.add(opt, null) // standards compliant; doesn't work in IE
					  	}
				  		catch(ex) {
				    		rselect.add(opt) // IE only
				  		}
					}
				}
			}
			// This is called when the page loads to initialize city
			var zselect = document.getElementById('estado')
			var zopt = zselect.options[zselect.selectedIndex]
			${remoteFunction(controller:"estado", action:"ajaxGetPoblaciones", params:"'id=' + zopt.value", onComplete:"updatePoblacion(e)")}
		</g:javascript>		
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
	<body>
		<a href="#create-vendedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-vendedor" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${vendedorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${vendedorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
