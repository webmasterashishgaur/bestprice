
<%@ page import="bestprice.NegociacionEnc" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'negociacionEnc.label', default: 'NegociacionEnc')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-negociacionEnc" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create">Ofertar</g:link></li>
			</ul>
		</div>
		<div id="list-negociacionEnc" class="content scaffold-list" role="main">
			<h1>Ofertas</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comentarios" title="${message(code: 'negociacionEnc.comentarios.label', default: 'Comentarios')}" />
						<g:sortableColumn property="vendedor" title="${message(code: 'negociacionEnc.comentarios.label', default: 'Vendedor')}" />						
						<g:sortableColumn property="dateCreated" title="${message(code: 'negociacionEnc.dateCreated.label', default: 'Fecha Publicación')}" />
						<g:sortableColumn property="imagen1" title="${message(code: 'negociacionEnc.imagen1.label', default: 'Precio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${negociacionEncInstanceList}" status="i" var="negociacionEncInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${negociacionEncInstance.id}">${fieldValue(bean: negociacionEncInstance, field: "comentarios")}</g:link></td>
						<td>${fieldValue(bean: negociacionEncInstance, field: "vendedor.usuario")}</td>					
						<td><g:formatDate date="${negociacionEncInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: negociacionEncInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${negociacionEncInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
