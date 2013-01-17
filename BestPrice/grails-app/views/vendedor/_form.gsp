<%@ page import="bestprice.Vendedor" %>



<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="vendedor.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="usuario" maxlength="15" required="" value="${vendedorInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="vendedor.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" maxlength="20" required="" value="${vendedorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="vendedor.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="30" required="" value="${vendedorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="vendedor.formaPago.label" default="Forma Pago" />
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${bestprice.FormaPago.list()}" optionKey="id" required="" value="${vendedorInstance?.formaPago?.id}" class="many-to-one" optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="vendedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="100" value="${vendedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="vendedor.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="15" value="${vendedorInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="vendedor.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textField name="comentarios" value="${vendedorInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'recibirEmail', 'error')} ">
	<label for="recibirEmail">
		<g:message code="vendedor.recibirEmail.label" default="Recibir Email" />
		
	</label>
	<g:checkBox name="recibirEmail" value="${vendedorInstance?.recibirEmail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'admiteDevolucion', 'error')} ">
	<label for="admiteDevolucion">
		<g:message code="vendedor.admiteDevolucion.label" default="Admite Devolucion" />
		
	</label>
	<g:checkBox name="admiteDevolucion" value="${vendedorInstance?.admiteDevolucion}" />
</div>

<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'estatus', 'error')} required">
		<label for="estatus">
			<g:message code="vendedorInstance.estatus.label" default="Estatus" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${vendedorInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
	</div>
</sec:ifAllGranted>
<sec:ifNotGranted roles="ROLE_ADMIN">
	<g:hiddenField name="estatus.id" value="3"/>		
</sec:ifNotGranted>