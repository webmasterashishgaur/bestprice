<%@ page import="bestprice.BitacoraPrecio" %>



<div class="fieldcontain ${hasErrors(bean: bitacoraPrecioInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="bitacoraPrecio.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${bitacoraPrecioInstance?.fechaCreacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bitacoraPrecioInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="bitacoraPrecio.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: bitacoraPrecioInstance, field: 'precio')}"/>
</div>

