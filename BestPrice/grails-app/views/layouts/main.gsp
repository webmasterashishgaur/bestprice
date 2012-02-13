<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<nav:resources/>	
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
			<g:layoutTitle default="HTML5"/>
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
	
		<div id="grailsLogo" role="banner">
					<img src="${resource(dir: 'images', file: 'bq.gif')}" alt="Grails"/>
					<input type="text" name="usuario" width="70%" value="" id="usuario" placeholder="Busca necesidad">
					<input type="submit" name="buscar" maxlength="15" value="Buscar" id="usuario">

					<sec:ifAllGranted roles="ROLE_ADMIN">
						<nav:render group="admon"/>
					</sec:ifAllGranted>

					<sec:ifNotGranted roles="ROLE_ADMIN">
						<nav:render group="tabs"/>
					</sec:ifNotGranted>
					
					<sec:ifLoggedIn>
						<g:link controller="logout" id="linkLogout">Salir</g:link>
						<h3>Bienvenido: <sec:username/></h3>						
					</sec:ifLoggedIn>
		</div>
		
		<div id="layoutBody" role="layoutBody">		
			<g:layoutBody/>
		</div>
		
		<div class="footer" role="contentinfo">
			Copyright &copy; by Edgar Villegas.<br/>
			All Rights Reserved.<br/>
		</div><!-- footer -->		
		
		
		<div id="spinner" class="spinner" style="display:none;">
			<g:message code="spinner.alt" default="Loading&hellip;"/>
		</div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>