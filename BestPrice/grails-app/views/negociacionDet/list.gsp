
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
					
						<g:sortableColumn property="comentarios" title="${message(code: 'negociacionDet.comentarios.label', default: 'Comentarios')}" />
					
						<g:sortableColumn property="usuario" title="${message(code: 'negociacionDet.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'negociacionDet.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="negociacionDet.negociacionEnc.label" default="Negociacion Enc" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${negociacionDetInstanceList}" status="i" var="negociacionDetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${negociacionDetInstance.id}">${fieldValue(bean: negociacionDetInstance, field: "comentarios")}</g:link></td>
					
						<td>${fieldValue(bean: negociacionDetInstance, field: "usuario")}</td>
					
						<td><g:formatDate date="${negociacionDetInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: negociacionDetInstance, field: "negociacionEnc")}</td>
					
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
