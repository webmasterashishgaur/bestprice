<%@ page import="bestprice.BitacoraPrecio" %>



<div class="fieldcontain ${hasErrors(bean: bitacoraPrecioInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="bitacoraPrecio.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" min="0.0" required="" value="${fieldValue(bean: bitacoraPrecioInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bitacoraPrecioInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="bitacoraPrecio.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${bitacoraPrecioInstance?.estatus?.id}" class="many-to-one"/>
</div>

