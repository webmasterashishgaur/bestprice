<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<nav:resources/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'twitter-auth.css')}" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'ddpowerzoomer.js')}"></script>

		<script type="text/javascript">
		jQuery(document).ready(function($){ //fire on DOM ready
		 $('img.showcase').addpowerzoom({
			defaultpower: 2,
		 	powerrange: [2,5],
		 	largeimage: null,
		 	magnifiersize: [150,150] //<--no comma following last option!
		 })
		})
		</script>		
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
			<g:layoutTitle default="MejorCotización"/>
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
        <r:layoutResources />
        
	</head>
	<body>

		<div id="grailsHeader" role="banner">
			<div id="grailsLogo" role="banner">
				<img src="${resource(dir: 'images', file: 'cc.png')}" alt="Grails"/><!-- bq.gif -->
			</div>

			<div  id="grailsMenu" role="banner">
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<nav:render group="admon"/>
				</sec:ifAllGranted>

				<sec:ifNotGranted roles="ROLE_ADMIN">
					<nav:render group="tabs"/>
				</sec:ifNotGranted>
			</div>

			<div id="divBusqueda"  role="banner">
				<g:form action="search" controller="necesidadEnc" method="post">
	        		<input type="text" name="query" placeholder="Ingrese texto a buscar" class="texts">
	        		<input value="Buscar" type="submit" class="btn-primary">
	    		</g:form>
				
				<!--<div class="divComprar">-->
				<g:form controller="necesidadEnc" >
  						<g:actionSubmit value="Publicar Compra" action="create" class="btn-primary" id="btnPublicar"/>
				</g:form>
						
				<!--</div>-->
			</div>
			
			<sec:ifLoggedIn>	    		
				<div id="divSession">
					<div class="btn-group">
	  					<a class="btn btn-success dropdown-toggle" data-toggle="dropdown" href="#">
							<sec:username/>
	    					<span class="caret"></span>
	  					</a>
	  					<ul class="dropdown-menu">
							<g:link controller="logout" id="linkLogout">Cerrar sesión</g:link>
	  					</ul>
					</div>
				</div>
			</sec:ifLoggedIn>			
		</div>
		
		<div id="layoutBody" role="layoutBody">
			<g:layoutBody/>
		</div>
		
		<!-- 
		<div class="footer" role="contentinfo">
			Copyright &copy; by Edgar Villegas.<br/>
			All Rights Reserved.<br/>
		</div>
		-->
		<!-- footer -->		
		
		
		<div id="spinner" class="spinner" style="display:none;">
			<g:message code="spinner.alt" default="Loading&hellip;"/>
		</div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>