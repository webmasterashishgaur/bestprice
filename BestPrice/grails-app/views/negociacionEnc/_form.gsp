<%@ page import="bestprice.NegociacionEnc" %>



<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="negociacionEnc.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estatus" required="" value="${fieldValue(bean: negociacionEncInstance, field: 'estatus')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen2', 'error')} ">
	<label for="imagen2">
		<g:message code="negociacionEnc.imagen2.label" default="Imagen2" />
		
	</label>
	<g:textField name="imagen2" value="${negociacionEncInstance?.imagen2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen3', 'error')} ">
	<label for="imagen3">
		<g:message code="negociacionEnc.imagen3.label" default="Imagen3" />
		
	</label>
	<g:textField name="imagen3" value="${negociacionEncInstance?.imagen3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen4', 'error')} ">
	<label for="imagen4">
		<g:message code="negociacionEnc.imagen4.label" default="Imagen4" />
		
	</label>
	<g:textField name="imagen4" value="${negociacionEncInstance?.imagen4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen5', 'error')} ">
	<label for="imagen5">
		<g:message code="negociacionEnc.imagen5.label" default="Imagen5" />
		
	</label>
	<g:textField name="imagen5" value="${negociacionEncInstance?.imagen5}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'necesidadEnc', 'error')} required">
	<label for="necesidadEnc">
		<g:message code="negociacionEnc.necesidadEnc.label" default="Necesidad Enc" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="necesidadEnc" name="necesidadEnc.id" from="${bestprice.NecesidadEnc.list()}" optionKey="id" required="" value="${necesidadEnc}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="negociacionEnc.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: negociacionEncInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'vendedor', 'error')} required">
	<label for="vendedor">
		<g:message code="negociacionEnc.vendedor.label" default="Vendedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendedor" name="vendedor.id" from="${bestprice.Vendedor.list()}" optionKey="id" required="" value="${negociacionEncInstance?.vendedor?.id}" class="many-to-one"/>
</div>

