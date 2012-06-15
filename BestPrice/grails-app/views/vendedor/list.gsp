
<%@ page import="bestprice.Vendedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendedor.label', default: 'Vendedor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vendedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vendedor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="usuario" title="${message(code: 'vendedor.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'vendedor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'vendedor.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'vendedor.telefono.label', default: 'Telefono')}" />
					
						<th><g:message code="vendedor.estatus.label" default="Estatus" /></th>
					
						<g:sortableColumn property="password" title="${message(code: 'vendedor.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendedorInstanceList}" status="i" var="vendedorInstance">
					<tr class="${(i % 2) == 0 ? 'even1' : 'odd1'}">
					
						<td><g:link action="show" id="${vendedorInstance.id}">${fieldValue(bean: vendedorInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: vendedorInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: vendedorInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: vendedorInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: vendedorInstance, field: "estatus")}</td>
					
						<td>${fieldValue(bean: vendedorInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendedorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
