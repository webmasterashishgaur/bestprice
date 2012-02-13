
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: '')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li>
					<g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</li>
			</ul>
		</div>
		
		<div id="list-necesidadEnc" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="titulo" title="${message(code: 'necesidadEnc.titulo.label', default: 'Título')}" />
						<g:sortableColumn property="descripcion" title="${message(code: 'necesidadEnc.descripcion.label', default: 'Descripción')}" />
						<g:sortableColumn property="fechaCreacion" title="${message(code: 'necesidadEnc.fechaCreacion.label', default: 'Fecha Creación')}" />
						<g:sortableColumn property="imagen1" title="${message(code: 'necesidadEnc.imagen1.label', default: 'Imagenes Referencia')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${necesidadEncInstanceList}" status="i" var="necesidadEncInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${necesidadEncInstance.id}">${fieldValue(bean: necesidadEncInstance, field: "titulo")}</g:link></td>
						<td>${fieldValue(bean: necesidadEncInstance, field: "descripcion")}</td>
						<td><g:formatDate date="${necesidadEncInstance.fechaCreacion}" format="dd/MM/yyyy"/></td>
						<td>
							<g:if test="${necesidadEncInstance?.imagen1}">
								<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen1)}" alt="${necesidadEncInstance?.imagen1}"
           					 		title="${necesidadEncInstance?.imagen1}" width="50" height="50"/>
							</g:if>           					 		
							<g:if test="${necesidadEncInstance?.imagen2}">							
								<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen2)}" alt="${necesidadEncInstance?.imagen2}"
           					 		title="${necesidadEncInstance?.imagen2}" width="50" height="50"/>
							</g:if>
							<g:if test="${necesidadEncInstance?.imagen3}">							           					 		
								<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen3)}" alt="${necesidadEncInstance?.imagen3}"
           					 		title="${necesidadEncInstance?.imagen3}" width="50" height="50"/>
							</g:if>
							<g:if test="${necesidadEncInstance?.imagen4}">							           					 		
           					 	<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen4)}" alt="${necesidadEncInstance?.imagen4}"
           					 		title="${necesidadEncInstance?.imagen4}" width="50" height="50"/>
							</g:if>           					 		
							<g:if test="${necesidadEncInstance?.imagen5}">							
								<img src="${createLinkTo(dir:'images/compras/evillegas',file:''+necesidadEncInstance?.imagen5)}" alt="${necesidadEncInstance?.imagen5}"
           					 		title="${necesidadEncInstance?.imagen5}" width="50" height="50"/>
							</g:if>           					 		           					 		
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${necesidadEncInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
