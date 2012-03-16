<%@ page import="bestprice.Pais" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>BestPrice</title>
	</head>
	<body>
		<a href="#page-body" class="skip">
			<g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
		</a>

			<div id="lytColLoguin">
				<sec:ifNotLoggedIn>			
					<g:include controller="login" action="auth" />
				</sec:ifNotLoggedIn>
						
				<div id="lytColBusqueda">
		    		<g:form action="search" controller="necesidadEnc" method="post">
						<label for="categoria">
							Filtros:
						</label> 
		        		<input type="text" name="query" placeholder="Ingrese texto a buscar">
		        		<input value="Buscar" type="submit">
		    		</g:form>
		    		
					<g:message code="necesidadEnc.categoria.label" default="Categoria" />
					<g:form controller="necesidadEnc" action="searchCategorias">
						<g:select id="categoria" name="query" from="${bestprice.Categoria.list()}" 
						optionKey="id" required="" value="${necesidadEncInstance?.categoria?.id}" class="many-to-one" optionValue="nombreCorto"
						onchange="submit()"/>
					</g:form>		    		
		    		
				</div>
				
			</div>

			<div id="page-body">
				<g:include controller="necesidadEnc" action="list" />				
			</div>
	</body>
</html>
