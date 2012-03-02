
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
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
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
					<span id="comentarios-label" class="property-label"><g:message code="negociacionEnc.comentarios.label" default="Comentarios" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${negociacionEncInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="negociacionEnc.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${negociacionEncInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label">
						<g:message code="negociacionEnc.estatus.label" default="Estatus" />
					</span>
					<span class="property-value" aria-labelledby="estatus-label">
					<g:fieldValue bean="${negociacionEncInstance}" field="estatus.descripcion"/>					
					</span>
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.imagen2}">
				<li class="fieldcontain">
					<span id="imagen2-label" class="property-label">
						<g:message code="negociacionEnc.imagen2.label" default="Imagenes" />
					</span>
					<span class="property-value" aria-labelledby="imagen5-label">					
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
						<g:if test="${negociacionEncInstance?.imagen5}">					
	
								<img src="${createLinkTo(dir:'images/compras/'+negociacionEncInstance.vendedor.usuario, file:''+negociacionEncInstance?.imagen5)}"
	           						alt="${negociacionEncInstance?.imagen5}" title="${negociacionEncInstance?.imagen5}" width="40" height="40"/>
						
						</g:if>
					</span>
					
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label">
						<g:message code="negociacionEnc.lastUpdated.label" default="Last Updated" /></span>
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${negociacionEncInstance?.lastUpdated}" /></span>
				</li>
				</g:if>
			
				<g:if test="${negociacionEncInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="negociacionEnc.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${negociacionEncInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${negociacionEncInstance?.id}" />
					<g:link class="edit" action="edit" id="${negociacionEncInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>

			<sec:ifLoggedIn>			
				<g:include controller="negociacionDet" action="list" params="[negociacionEnc:negociacionEncInstance]"/>				
			</sec:ifLoggedIn>			
			
		</div>
	</body>
</html>
