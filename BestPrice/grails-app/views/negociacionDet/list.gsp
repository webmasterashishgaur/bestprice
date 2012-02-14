
<%@ page import="bestprice.NegociacionDet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'negociacionDet.label', default: 'NegociacionDet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-negociacionDet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-negociacionDet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comentarioComprador" title="${message(code: 'negociacionDet.comentarioComprador.label', default: 'Comentario Comprador')}" />
					
						<g:sortableColumn property="comentarioVendedor" title="${message(code: 'negociacionDet.comentarioVendedor.label', default: 'Comentario Vendedor')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'negociacionDet.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${negociacionDetInstanceList}" status="i" var="negociacionDetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${negociacionDetInstance.id}">${fieldValue(bean: negociacionDetInstance, field: "comentarioComprador")}</g:link></td>
					
						<td>${fieldValue(bean: negociacionDetInstance, field: "comentarioVendedor")}</td>
					
						<td><g:formatDate date="${negociacionDetInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${negociacionDetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
