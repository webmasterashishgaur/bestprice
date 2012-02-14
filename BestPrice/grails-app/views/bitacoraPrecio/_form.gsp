<%@ page import="bestprice.BitacoraPrecio" %>



<div class="fieldcontain ${hasErrors(bean: bitacoraPrecioInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="bitacoraPrecio.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" min="0.0" required="" value="${fieldValue(bean: bitacoraPrecioInstance, field: 'precio')}"/>
</div>

