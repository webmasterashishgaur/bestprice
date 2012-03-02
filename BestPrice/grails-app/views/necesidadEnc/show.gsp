
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN">				
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAllGranted>					
			</ul>
		</div>
		<div id="show-necesidadEnc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list necesidadEnc">
			
				<g:if test="${necesidadEncInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="necesidadEnc.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${necesidadEncInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="necesidadEnc.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${necesidadEncInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.comprador}">
				<li class="fieldcontain">
					<span id="comprador-label" class="property-label"><g:message code="necesidadEnc.comprador.label" default="Comprador" /></span>
					
						<span class="property-value" aria-labelledby="comprador-label">
							<g:fieldValue bean="${necesidadEncInstance}" field="comprador.usuario"/>							
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="necesidadEnc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${necesidadEncInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="necesidadEnc.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label">
							<g:fieldValue bean="${necesidadEncInstance}" field="estatus.descripcion"/>							
						</span>
					
				</li>
				</g:if>
			

				<li class="fieldcontain">
					<span id="imagen1-label" class="property-label">
						<g:message code="necesidadEnc.imagen1.label" default="Imagenes"/>
					</span>
					
					<g:if test="${necesidadEncInstance?.imagen1}">					
							<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen1)}"
           						alt="${necesidadEncInstance?.imagen1}" title="${necesidadEncInstance?.imagen1}" width="40" height="40"/>							
					</g:if>					
					<g:if test="${necesidadEncInstance?.imagen2}">					
							<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen2)}"
           						alt="${necesidadEncInstance?.imagen2}" title="${necesidadEncInstance?.imagen2}" width="40" height="40"/>
					</g:if>
					<g:if test="${necesidadEncInstance?.imagen3}">					
							<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen3)}"
           						alt="${necesidadEncInstance?.imagen3}" title="${necesidadEncInstance?.imagen3}" width="40" height="40"/>
					</g:if>
					<g:if test="${necesidadEncInstance?.imagen4}">					
							<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen4)}"
           						alt="${necesidadEncInstance?.imagen4}" title="${necesidadEncInstance?.imagen4}" width="40" height="40"/>
					</g:if>					
					<g:if test="${necesidadEncInstance?.imagen5}">					
							<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen5)}"
           						alt="${necesidadEncInstance?.imagen5}" title="${necesidadEncInstance?.imagen5}" width="40" height="40"/>
					</g:if>					
				</li>
			
				<g:if test="${necesidadEncInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="necesidadEnc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${necesidadEncInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifLoggedIn>			
				<g:include controller="negociacionEnc" action="list" params="[necesidadEnc:necesidadEncInstance]"/>				
			</sec:ifLoggedIn>					
		</div>
	</body>
</html>
