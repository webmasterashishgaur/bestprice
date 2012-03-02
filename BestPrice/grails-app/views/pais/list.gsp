
<%@ page import="bestprice.Pais" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pais" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'pais.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreCorto" title="${message(code: 'pais.nombreCorto.label', default: 'Nombre Corto')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pais.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="pais.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pais.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paisInstanceList}" status="i" var="paisInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paisInstance.id}">${fieldValue(bean: paisInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: paisInstance, field: "nombreCorto")}</td>
					
						<td><g:formatDate date="${paisInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: paisInstance, field: "estatus")}</td>
					
						<td><g:formatDate date="${paisInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paisInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
