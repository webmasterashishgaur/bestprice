<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>

	#login {
		height: 110px;
		width: 265px;
		float: left;
		padding: 5px;
		margin-left: 0px;
		margin-bottom: 5px;
		border-radius: 5px; 
		box-shadow: 1px 1px 6px #888888;
		background-color: #ff7f50;
		border: 1px solid #aab; 
	}

	#login .inner {
		height: 110px;	
		-moz-box-shadow: 0px 0px 0px #eee;
		-webkit-box-shadow: 0px 0px 0px #eee;
		-khtml-box-shadow: 0px 0px 0px #eee;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 0px 0 0px 0;
		padding-left: 0px;
		margin-bottom: 0px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 150px;
		margin-left: 5px;
		margin-top: 2px; 
	}
	
	#login .inner .cssform input[type='password'] {
		width: 150px;
		margin-left: 5px;
		margin-top: 5px;
	}	
	
	#login .inner .cssform input[type='submit'] {
		border-bottom-style: outset;
	}	

	#login .inner .cssform label {
		font-weight: bold;
	}

	#login #remember_me_holder {
		padding-left: 0px;
	}

	#login #submit {
		margin-left: 0px;
	}

	#login #remember_me_holder label {
		float: none;
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	
	</style>
</head>

<body>
<div id='login'>
	<div class='inner'>
		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='true'>
			<p>
				<label for='username'>
					<g:message code="springSecurity.login.username.label"/>:
				</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
