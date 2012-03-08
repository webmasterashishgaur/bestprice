
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
				<li><g:link class="create" action="create" params="[negociacionEnc:negociacionEncInstance]">Comentar</g:link></li>
			</ul>
		</div>
		<div id="list-negociacionDet" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="comentarios" title="${message(code: 'negociacionDet.comentarios.label', default: 'Conversación')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${negociacionDetInstanceList}" status="i" var="negociacionDetInstance">
					<tr>
						<spacer width="70"></spacer>					
						<td><b>${fieldValue(bean: negociacionDetInstance, field: "usuario")}</b> | <g:formatDate date="${negociacionDetInstance.dateCreated}" format="dd/MM/yyyy hh:mm:ss"/></td>						
					</tr>
					<tr>
						<td>
						${fieldValue(bean: negociacionDetInstance, field: "comentarios")}
						</td>
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
