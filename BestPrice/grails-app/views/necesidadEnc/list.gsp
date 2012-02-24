
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-necesidadEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
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
					
						<g:sortableColumn property="titulo" title="${message(code: 'necesidadEnc.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'necesidadEnc.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="necesidadEnc.comprador.label" default="Comprador" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'necesidadEnc.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="necesidadEnc.estatus.label" default="Estatus" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${necesidadEncInstanceList}" status="i" var="necesidadEncInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${necesidadEncInstance.id}">${fieldValue(bean: necesidadEncInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: necesidadEncInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: necesidadEncInstance, field: "comprador.usuario")}</td>
					
						<td><g:formatDate date="${necesidadEncInstance.dateCreated}" format="dd/MM/yyyy" /></td>
					
						<td>${fieldValue(bean: necesidadEncInstance, field: "estatus.descripcion")}</td>
					
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
