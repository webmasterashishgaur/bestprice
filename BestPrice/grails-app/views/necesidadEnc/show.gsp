
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.show.label" args="['']" /></title>
	</head>
	<body>
		<a href="#show-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="['']" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="['']" /></g:link></li>
			</ul>
		</div>
		<div id="show-necesidadEnc" class="content scaffold-show" role="main">
			<!--  <h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
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
						<span class="property-value" aria-labelledby="descripcion-label">
							<g:fieldValue bean="${necesidadEncInstance}" field="descripcion"/>
						</span>
					
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
			
				<g:if test="${necesidadEncInstance?.estatus}">
				<li class="fieldcontain">
					<span id="estatus-label" class="property-label">
						<g:message code="necesidadEnc.estatus.label" default="Estatus" />
					</span>
					<span class="property-value" aria-labelledby="estatus-label">
						<g:if test="${necesidadEncInstance?.estatus == 1}">					
							ACTIVO
						</g:if>
						<g:if test="${necesidadEncInstance?.estatus == 0}">					
							CANCELADO
						</g:if>		
					</span>
					
				</li>
				</g:if>
			
				<g:if test="${necesidadEncInstance?.fechaCreacion}">
				<li class="fieldcontain">
					<span id="fechaCreacion-label" class="property-label">
						<g:message code="necesidadEnc.fechaCreacion.label" default="Fecha Creacion" /></span>
						<span class="property-value" aria-labelledby="fechaCreacion-label">
							<g:formatDate date="${necesidadEncInstance?.fechaCreacion}" format="yyyy/MM/dd"/>
						</span>
					
				</li>
				</g:if>
			
				<table>
					<tr>
				
						<g:if test="${necesidadEncInstance?.imagen1}">
						<td>
							<li class="fieldcontain">
								<span class="property-value" aria-labelledby="imagen1-label">
									<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen1)}"
			           					 alt="${necesidadEncInstance?.imagen1}"
			           					 title="${necesidadEncInstance?.imagen1}" 
			           					 width="90" height="90"/>						
								</span>
							</li>
						</td>						
						</g:if>
					
						<g:if test="${necesidadEncInstance?.imagen2}">
						<td>						
							<li class="fieldcontain">
									<span class="property-value" aria-labelledby="imagen2-label">
									<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen2)}"
			           					 alt="${necesidadEncInstance?.imagen2}"
			           					 title="${necesidadEncInstance?.imagen2}" 
			           					 width="90" height="90"/>
									</span>
								
							</li>
						</td>						
						</g:if>
					
						<g:if test="${necesidadEncInstance?.imagen3}">
						<td>						
							<li class="fieldcontain">
									<span class="property-value" aria-labelledby="imagen3-label">
									<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen3)}"
			           					 alt="${necesidadEncInstance?.imagen3}"
			           					 title="${necesidadEncInstance?.imagen3}" 
			           					 width="90" height="90"/>
									</span>
								
							</li>
						</td>						
						</g:if>
					
						<g:if test="${necesidadEncInstance?.imagen4}">
						<td>						
							<li class="fieldcontain">
									<span class="property-value" aria-labelledby="imagen4-label">
									<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen4)}"
			           					 alt="${necesidadEncInstance?.imagen4}"
			           					 title="${necesidadEncInstance?.imagen4}" 
			           					 width="90" height="90"/>
									</span>
								
							</li>
						</td>						
						</g:if>
					
						<g:if test="${necesidadEncInstance?.imagen5}">
						<td>						
							<li class="fieldcontain">
									<span class="property-value" aria-labelledby="imagen5-label">
									<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen5)}"
			           					 alt="${necesidadEncInstance?.imagen5}"
			           					 title="${necesidadEncInstance?.imagen5}" 
			           					 width="90" height="90"/>
									</span>
								
							</li>
						<td>						
						</g:if>
					<tr>				
				</table>	
			</ol>
			<g:include controller="negociacionEnc" action="list"
			 params="[necesidadEnc: necesidadEncInstance]"/>			
		</div>
		<div class="nav" role="navigation">
			<ul>
				<li>
					<g:link class="create" controller="negociacionEnc" action="create" params="[necesidadEnc: necesidadEncInstance.id]">
             			<g:message code="default.new.label" args="['']" />
             		</g:link>
             	</li>
			</ul>
		</div>		
	</body>
</html>
