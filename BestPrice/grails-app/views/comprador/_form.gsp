<%@ page import="bestprice.Comprador" %>



<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="comprador.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="usuario" maxlength="15" required="" value="${compradorInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="comprador.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" maxlength="20" required="" value="${compradorInstance?.password}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="comprador.password.label" default="Confirma" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password2" maxlength="20" required="" value="${compradorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="comprador.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="30" required="" value="${compradorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="comprador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="100" value="${compradorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="comprador.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="15" value="${compradorInstance?.telefono}"/>
</div>

<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'estatus', 'error')} required">
		<label for="estatus">
			<g:message code="comprador.estatus.label" default="Estatus" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${compradorInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
	</div>
</sec:ifAllGranted>
<sec:ifNotGranted roles="ROLE_ADMIN">
	<g:hiddenField name="estatus.id" value="3"/>		
</sec:ifNotGranted>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'recibirEmail', 'error')} ">
	<label for="recibirEmail">
		<g:message code="comprador.recibirEmail.label" default="Recibir Emails" />
		
	</label>
	<g:checkBox name="recibirEmail" value="${compradorInstance?.recibirEmail}" />
</div>

