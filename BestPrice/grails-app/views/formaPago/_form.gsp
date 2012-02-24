<%@ page import="bestprice.FormaPago" %>



<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="formaPago.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${formaPagoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'valorPago', 'error')} required">
	<label for="valorPago">
		<g:message code="formaPago.valorPago.label" default="Valor Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="valorPago" maxlength="40" required="" value="${formaPagoInstance?.valorPago}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formaPagoInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="formaPago.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${formaPagoInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
</div>

