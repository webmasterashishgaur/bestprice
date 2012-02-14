
<%@ page import="bestprice.FormaPago" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'formaPago.label', default: 'FormaPago')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-formaPago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-formaPago" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'formaPago.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="valorPago" title="${message(code: 'formaPago.valorPago.label', default: 'Valor Pago')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'formaPago.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="formaPago.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'formaPago.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${formaPagoInstanceList}" status="i" var="formaPagoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${formaPagoInstance.id}">${fieldValue(bean: formaPagoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: formaPagoInstance, field: "valorPago")}</td>
					
						<td><g:formatDate date="${formaPagoInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: formaPagoInstance, field: "estatus")}</td>
					
						<td><g:formatDate date="${formaPagoInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${formaPagoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
