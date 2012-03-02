
<%@ page import="bestprice.Poblacion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poblacion.label', default: 'Poblacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-poblacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-poblacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'poblacion.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreCorto" title="${message(code: 'poblacion.nombreCorto.label', default: 'Nombre Corto')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'poblacion.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="poblacion.estado.label" default="Estado" /></th>
					
						<th><g:message code="poblacion.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'poblacion.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${poblacionInstanceList}" status="i" var="poblacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${poblacionInstance.id}">${fieldValue(bean: poblacionInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: poblacionInstance, field: "nombreCorto")}</td>
					
						<td><g:formatDate date="${poblacionInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: poblacionInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: poblacionInstance, field: "estatus")}</td>
					
						<td><g:formatDate date="${poblacionInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${poblacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
