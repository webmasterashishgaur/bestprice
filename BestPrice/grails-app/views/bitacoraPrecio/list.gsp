
<%@ page import="bestprice.BitacoraPrecio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bitacoraPrecio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bitacoraPrecio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="precio" title="${message(code: 'bitacoraPrecio.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bitacoraPrecio.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bitacoraPrecio.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bitacoraPrecioInstanceList}" status="i" var="bitacoraPrecioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bitacoraPrecioInstance.id}">${fieldValue(bean: bitacoraPrecioInstance, field: "precio")}</g:link></td>
					
						<td><g:formatDate date="${bitacoraPrecioInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${bitacoraPrecioInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bitacoraPrecioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
