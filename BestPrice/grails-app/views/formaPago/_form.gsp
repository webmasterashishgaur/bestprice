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

<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'estatus', 'error')} required">
		<label for="estatus">
			<g:message code="necesidadEnc.estatus.label" default="Estatus" />
			<span class="required-indicator">*</span>
		</label>
		<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${necesidadEncInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
	</div>
</sec:ifAllGranted>
<sec:ifNotGranted roles="ROLE_ADMIN">
	<g:hiddenField name="estatus.id" value="3"/>		
</sec:ifNotGranted>	