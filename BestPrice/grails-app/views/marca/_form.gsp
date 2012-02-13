<%@ page import="bestprice.Marca" %>



<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="marca.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="40" value="${marcaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombreCorto', 'error')} ">
	<label for="nombreCorto">
		<g:message code="marca.nombreCorto.label" default="Nombre Corto" />
		
	</label>
	<g:textField name="nombreCorto" maxlength="20" value="${marcaInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="marca.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="estatus" required="" value="${fieldValue(bean: marcaInstance, field: 'estatus')}"/>
</div>

