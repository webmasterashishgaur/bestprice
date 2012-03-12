
<%@ page import="bestprice.Comprador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comprador.label', default: 'Comprador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-comprador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-comprador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="usuario" title="${message(code: 'comprador.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'comprador.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'comprador.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'comprador.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'comprador.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comprador.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${compradorInstanceList}" status="i" var="compradorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${compradorInstance.id}">${fieldValue(bean: compradorInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: compradorInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: compradorInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: compradorInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: compradorInstance, field: "password")}</td>
					
						<td><g:formatDate date="${compradorInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${compradorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
