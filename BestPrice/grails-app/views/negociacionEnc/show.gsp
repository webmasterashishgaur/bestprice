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
			</ul>
		</div>
		<div id="show-negociacionEnc" class="content scaffold-show" role="main">
			<h1>Oferta</h1>
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
			
				<g:if test="${negociacionEncInstance?.necesidadEnc}">
				<li class="fieldcontain">
					<span id="necesidadEnc-label" class="property-label"><g:message code="negociacionEnc.necesidadEnc.label" default="Necesidad Enc" /></span>
					
						<span class="property-value" aria-labelledby="necesidadEnc-label">
						<g:fieldValue bean="${negociacionEncInstance}" field="necesidadEnc.titulo"/>						
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.precio}">
				<li class="fieldcontain">
						<span id="precio-label" class="property-label">
							<g:message code="negociacionEnc.precio.label" default="Precio" />
						</span>
						<span class="property-value" aria-labelledby="precio-label">
							<g:fieldValue bean="${negociacionEncInstance}" field="precio"/>
						</span>
					
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
				
				<li class="fieldcontain">
					<span id="imagen1-label" class="property-label">
						<g:message code="negociacionEnc.imagen1.label" default="Imagenes"/>
					</span>
					<span class="property-value" aria-labelledby="estatus-label">
						<g:if test="${negociacionEncInstance?.imagen1}">					
								<img src="${createLinkTo(dir:'images/compras/'+negociacionEncInstance.vendedor.usuario, file:''+negociacionEncInstance?.imagen1)}"
	           						alt="${negociacionEncInstance?.imagen1}" title="${negociacionEncInstance?.imagen1}" width="160" height="160"/>
	           						
						</g:if>					
						<g:if test="${negociacionEncInstance?.imagen2}">					
								<img src="${createLinkTo(dir:'images/compras/'+negociacionEncInstance.vendedor.usuario, file:''+negociacionEncInstance?.imagen2)}"
	           						alt="${negociacionEncInstance?.imagen2}" title="${negociacionEncInstance?.imagen2}" width="40" height="40"/>
						</g:if>
						<g:if test="${negociacionEncInstance?.imagen3}">					
								<img src="${createLinkTo(dir:'images/compras/'+negociacionEncInstance.vendedor.usuario, file:''+negociacionEncInstance?.imagen3)}"
	           						alt="${negociacionEncInstance?.imagen3}" title="${negociacionEncInstance?.imagen3}" width="40" height="40"/>
						</g:if>
						<g:if test="${negociacionEncInstance?.imagen4}">					
								<img src="${createLinkTo(dir:'images/compras/'+negociacionEncInstance.vendedor.usuario, file:''+negociacionEncInstance?.imagen4)}"
	           						alt="${negociacionEncInstance?.imagen4}" title="${negociacionEncInstance?.imagen4}" width="40" height="40"/>
						</g:if>					
					</span>
				</li>
				
			
			</ol>
		</div>
			<sec:ifLoggedIn>			
				<g:include controller="negociacionDet" action="list" params="[negociacionEnc:negociacionEncInstance]"/>				
			</sec:ifLoggedIn>		
		
	</body>
</html>
