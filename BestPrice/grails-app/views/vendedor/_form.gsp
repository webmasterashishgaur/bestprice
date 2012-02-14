<%@ page import="bestprice.Vendedor" %>



<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="vendedor.usuario.label" default="Usuario" />
		
	</label>
	<g:textField name="usuario" maxlength="15" value="${vendedorInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="vendedor.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" maxlength="20" value="${vendedorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="vendedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="40" value="${vendedorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'appPaterno', 'error')} ">
	<label for="appPaterno">
		<g:message code="vendedor.appPaterno.label" default="App Paterno" />
		
	</label>
	<g:textField name="appPaterno" maxlength="30" value="${vendedorInstance?.appPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'appMaterno', 'error')} ">
	<label for="appMaterno">
		<g:message code="vendedor.appMaterno.label" default="App Materno" />
		
	</label>
	<g:textField name="appMaterno" maxlength="30" value="${vendedorInstance?.appMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="vendedor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${vendedorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="vendedor.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" maxlength="100" value="${vendedorInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'cp', 'error')} ">
	<label for="cp">
		<g:message code="vendedor.cp.label" default="Cp" />
		
	</label>
	<g:textField name="cp" maxlength="10" value="${vendedorInstance?.cp}"/>
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
	<g:textField name="comentarios" maxlength="100" value="${vendedorInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'admiteDevolucion', 'error')} ">
	<label for="admiteDevolucion">
		<g:message code="vendedor.admiteDevolucion.label" default="Admite Devolucion" />
		
	</label>
	<g:checkBox name="admiteDevolucion" value="${vendedorInstance?.admiteDevolucion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="vendedor.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${bestprice.Estado.list()}" optionKey="id" required="" value="${vendedorInstance?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="vendedor.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${vendedorInstance?.estatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="vendedor.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${vendedorInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="vendedor.formaPago.label" default="Forma Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${bestprice.FormaPago.list()}" optionKey="id" required="" value="${vendedorInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="vendedor.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="pais.id" from="${bestprice.Pais.list()}" optionKey="id" required="" value="${vendedorInstance?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'poblacion', 'error')} required">
	<label for="poblacion">
		<g:message code="vendedor.poblacion.label" default="Poblacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="poblacion" name="poblacion.id" from="${bestprice.Poblacion.list()}" optionKey="id" required="" value="${vendedorInstance?.poblacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendedorInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="vendedor.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${vendedorInstance?.url}"/>
</div>

