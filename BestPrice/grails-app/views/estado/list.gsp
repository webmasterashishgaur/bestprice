
<%@ page import="bestprice.Estado" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estado" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'estado.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreCorto" title="${message(code: 'estado.nombreCorto.label', default: 'Nombre Corto')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'estado.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="estado.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'estado.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="estado.pais.label" default="Pais" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
					<tr class="${(i % 2) == 0 ? 'even1' : 'odd1'}">
					
						<td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: estadoInstance, field: "nombreCorto")}</td>
					
						<td><g:formatDate date="${estadoInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: estadoInstance, field: "estatus")}</td>
					
						<td><g:formatDate date="${estadoInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: estadoInstance, field: "pais")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estadoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
