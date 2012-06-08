<%@ page import="bestprice.Pais" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
      	<r:require modules="bootstrap"/>		
		<title>BestPrice</title>
	</head>
	<body>
		<a href="#page-body" class="skip">
			<g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
		</a>
		<div>
			<sec:ifNotLoggedIn>
				<div id="lytColLoguin">
						<g:include controller="login" action="auth" />
					<!-- 	
					<div class="messageBox">
						<div class="msg_box_title">
							<label>Lo mas pedido</label>
						</div>
						<div class="msg_box_body">
						    <atac:bodyTagCloud values="[Electronica:1000,Zapatos:500,Carros:2000,Ropa:700,Telefonos:1500]" calc="linear">
						        <div class="${it.value.class}${it.value.range}">
						            <a href="${it.value.controller}/${it.value.action}/${it.key}">${it.key}</a>
						        </div>
						    </atac:bodyTagCloud>
						</div>
					</div>				
		 			-->				
				</div>
			</sec:ifNotLoggedIn>			
			
			<div id="lytColFiltros">			
				<div id="lytColBusqueda">
					<g:form controller="necesidadEnc" action="searchCategorias">
						<g:message code="necesidadEnc.categoria.label" default="Categoria" />					
						<g:select id="categoria" name="query" from="${bestprice.Categoria.list()}" 
									optionKey="id" required="" value="${necesidadEncInstance?.categoria?.id}" class="many-to-one" optionValue="nombreCorto"
									onchange="submit()"/>
					</g:form>
				</div>			
			</div>	
		</div>
		<div id="page-body">
				<g:include controller="necesidadEnc" action="list" />				
		</div>
	</body>
</html>
