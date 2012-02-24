
<%@ page import="bestprice.Marca" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'marca.label', default: 'Marca')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-marca" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-marca" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'marca.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreCorto" title="${message(code: 'marca.nombreCorto.label', default: 'Nombre Corto')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'marca.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="marca.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'marca.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${marcaInstanceList}" status="i" var="marcaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${marcaInstance.id}">${fieldValue(bean: marcaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: marcaInstance, field: "nombreCorto")}</td>
					
						<td><g:formatDate date="${marcaInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: marcaInstance, field: "estatus")}</td>
					
						<td><g:formatDate date="${marcaInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${marcaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
