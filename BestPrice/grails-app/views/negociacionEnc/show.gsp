
<%@ page import="bestprice.NegociacionEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'negociacionEnc.label', default: 'NegociacionEnc')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-negociacionEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-negociacionEnc" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list negociacionEnc">
			
				<g:if test="${negociacionEncInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="negociacionEnc.comentarios.label" default="Comentarios Vendedor" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${negociacionEncInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label">
						<g:message code="negociacionEnc.dateCreated.label" default="Fecha Creacion" /></span>
					<span class="property-value" aria-labelledby="dateCreated-label">
					<g:formatDate date="${negociacionEncInstance?.dateCreated}" format="dd/MM/yyyy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label"><g:message code="negociacionEnc.estatus.label" default="Estatus" /></span>
					
						<span class="property-value" aria-labelledby="estatus-label"><g:link controller="estatus" action="show" id="${negociacionEncInstance?.estatus?.id}">${negociacionEncInstance?.estatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.imagen1}">
				<li class="fieldcontain">
					<span id="imagen1-label" class="property-label"><g:message code="negociacionEnc.imagen1.label" default="Imagen1" /></span>
					
						<span class="property-value" aria-labelledby="imagen1-label"><g:fieldValue bean="${negociacionEncInstance}" field="imagen1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.imagen2}">
				<li class="fieldcontain">
					<span id="imagen2-label" class="property-label"><g:message code="negociacionEnc.imagen2.label" default="Imagen2" /></span>
					
						<span class="property-value" aria-labelledby="imagen2-label"><g:fieldValue bean="${negociacionEncInstance}" field="imagen2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.imagen3}">
				<li class="fieldcontain">
					<span id="imagen3-label" class="property-label"><g:message code="negociacionEnc.imagen3.label" default="Imagen3" /></span>
					
						<span class="property-value" aria-labelledby="imagen3-label"><g:fieldValue bean="${negociacionEncInstance}" field="imagen3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.imagen4}">
				<li class="fieldcontain">
					<span id="imagen4-label" class="property-label"><g:message code="negociacionEnc.imagen4.label" default="Imagen4" /></span>
					
						<span class="property-value" aria-labelledby="imagen4-label"><g:fieldValue bean="${negociacionEncInstance}" field="imagen4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="negociacionEnc.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${negociacionEncInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.necesidadEnc}">
				<li class="fieldcontain">
					<span id="necesidadEnc-label" class="property-label"><g:message code="negociacionEnc.necesidadEnc.label" default="Necesidad Enc" /></span>
					
						<span class="property-value" aria-labelledby="necesidadEnc-label"><g:link controller="necesidadEnc" action="show" id="${negociacionEncInstance?.necesidadEnc?.id}">${negociacionEncInstance?.necesidadEnc?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${negociacionEncInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="negociacionEnc.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${negociacionEncInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.vendedor}">
				<li class="fieldcontain">
					<span id="vendedor-label" class="property-label"><g:message code="negociacionEnc.vendedor.label" default="Vendedor" /></span>
					
						<span class="property-value" aria-labelledby="vendedor-label">
							<g:fieldValue bean="${negociacionEncInstance}" field="vendedor.usuario"/>							
						</span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
			<sec:ifLoggedIn>			
				<g:include controller="negociacionDet" action="list" params="[negociacionEnc:negociacionEncInstance]"/>				
			</sec:ifLoggedIn>		
		
	</body>
</html>
