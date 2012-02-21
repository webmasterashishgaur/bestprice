<%@ page import="bestprice.Comprador" %>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="comprador.usuario.label" default="Usuario" />
		
	</label>
	<g:textField name="usuario" maxlength="15" value="${compradorInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="comprador.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" maxlength="20" value="${compradorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="comprador.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="40" value="${compradorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'appPaterno', 'error')} ">
	<label for="appPaterno">
		<g:message code="comprador.appPaterno.label" default="App Paterno" />
		
	</label>
	<g:textField name="appPaterno" maxlength="30" value="${compradorInstance?.appPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'appMaterno', 'error')} ">
	<label for="appMaterno">
		<g:message code="comprador.appMaterno.label" default="App Materno" />
		
	</label>
	<g:textField name="appMaterno" maxlength="30" value="${compradorInstance?.appMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="comprador.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${compradorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="comprador.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" maxlength="100" value="${compradorInstance?.direccion}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'cp', 'error')} ">
	<label for="cp">
		<g:message code="comprador.cp.label" default="Cp" />
		
	</label>
	<g:textField name="cp" maxlength="10" value="${compradorInstance?.cp}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="comprador.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="15" value="${compradorInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="comprador.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textField name="comentarios" maxlength="100" value="${compradorInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="comprador.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${bestprice.Estado.list()}" optionKey="id" required="" value="${compradorInstance?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="comprador.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${compradorInstance?.estatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="comprador.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="pais.id" from="${bestprice.Pais.list()}" optionKey="id" required="" value="${compradorInstance?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradorInstance, field: 'poblacion', 'error')} required">
	<label for="poblacion">
		<g:message code="comprador.poblacion.label" default="Poblacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="poblacion" name="poblacion.id" from="${bestprice.Poblacion.list()}" optionKey="id" required="" value="${compradorInstance?.poblacion?.id}" class="many-to-one"/>
</div>
</div>
