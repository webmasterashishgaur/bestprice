
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
      	<r:require modules="bootstrap"/>		
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
		
		<!-- <div class="form"> -->
		
			<div id="show-necesidadEnc" class="content scaffold-show" role="main">
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
						<span id="dateCreated-label" class="property-label"><g:message code="necesidadEnc.dateCreated.label" default="Fecha de publicación" /></span>
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${necesidadEncInstance?.dateCreated}" format="dd/MM/yyyy"/></span>
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
							<g:message code="necesidadEnc.imagen1.label" default="Imagenes de referencia"/>
						</span>
						<span class="property-value" aria-labelledby="estatus-label">
							<g:if test="${necesidadEncInstance?.imagen1}">					
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen1)}"
		           						alt="${necesidadEncInstance?.imagen1}" title="${necesidadEncInstance?.imagen1}" class="showcase"/>
							</g:if>	           						
		           						
							<g:if test="${necesidadEncInstance?.imagen2}">	           						
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen2)}"
		           						alt="${necesidadEncInstance?.imagen2}" title="${necesidadEncInstance?.imagen2}" class="showcase"/>	           						
							</g:if>
	
							<g:if test="${necesidadEncInstance?.imagen3}">	           						
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen3)}"
		           						alt="${necesidadEncInstance?.imagen3}" title="${necesidadEncInstance?.imagen3}" class="showcase"/>	           						
							</g:if>
						</span>
						<span class="property-value" aria-labelledby="estatus-label">					
							<g:if test="${necesidadEncInstance?.imagen4}">					
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen4)}"
		           						alt="${necesidadEncInstance?.imagen4}" title="${necesidadEncInstance?.imagen4}" class="showcase"/>
							</g:if>
								           			
							<g:if test="${necesidadEncInstance?.imagen5}">			
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen5)}"
		           						alt="${necesidadEncInstance?.imagen5}" title="${necesidadEncInstance?.imagen5}" class="showcase"/>	           						
							</g:if>	           			
		           						
							<g:if test="${necesidadEncInstance?.imagen6}">	           						
									<img src="${createLinkTo(dir:'images/compras/'+necesidadEncInstance.comprador.usuario, file:''+necesidadEncInstance?.imagen6)}"
		           						alt="${necesidadEncInstance?.imagen6}" title="${necesidadEncInstance?.imagen6}" class="showcase"/>	           						
							</g:if>
						</span>											
					</li>
				
				</ol>
				
				<g:if test="${puedeEditar}">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${necesidadEncInstance?.id}" />
							<g:link class="edit" action="edit" id="${necesidadEncInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>			
				</g:if>
				
				<sec:ifLoggedIn>			
					<g:include controller="negociacionEnc" action="list" params="[necesidadEnc:necesidadEncInstance]"/>				
				</sec:ifLoggedIn>
								
				<sec:ifNotLoggedIn>
					<h1>Necesita iniciar sesion como Vendedor para ofertar</h1>
				</sec:ifNotLoggedIn>					
			</div>
		<!-- </div> -->		
		
	</body>
</html>
