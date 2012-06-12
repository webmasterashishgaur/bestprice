
<%@ page import="bestprice.NecesidadEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
      	<r:require modules="bootstrap"/>		
		<g:set var="entityName" value="${message(code: 'necesidadEnc.label', default: 'NecesidadEnc')}" />
		<title></title>
	</head>
	<body>
	
		<div id="list-necesidadEnc" class="content scaffold-list" role="main">
			<h1>Últimas publicaciones</h1>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="titulo" title="${message(code: 'necesidadEnc.titulo.label', default: 'Título')}" />
						<g:sortableColumn property="descripcion" title="${message(code: 'necesidadEnc.descripcion.label', default: 'Descripción')}" />
						<th><g:message code="necesidadEnc.categoria.label" default="Categoría" /></th>
						<th><g:message code="necesidadEnc.comprador.label" default="Comprador" /></th>
						<g:sortableColumn property="dateCreated" title="${message(code: 'necesidadEnc.dateCreated.label', default: 'Fecha de publicación')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${necesidadEncInstanceList}" status="i" var="necesidadEncInstance">
					<tr class="${(i % 2) == 0 ? 'even1' : 'odd1'}">
						<td><g:link action="show" id="${necesidadEncInstance.id}">${fieldValue(bean: necesidadEncInstance, field: "titulo")}</g:link></td>
						<td>${fieldValue(bean: necesidadEncInstance, field: "descripcion")}</td>
						<td>${fieldValue(bean: necesidadEncInstance, field: "categoria.nombreCorto")}</td>
						<td>${fieldValue(bean: necesidadEncInstance, field: "comprador.usuario")}</td>
						<td><g:formatDate date="${necesidadEncInstance.dateCreated}" format="dd/MM/yyyy"/></td>
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
