<%@ page import="bestprice.Marca" %>



<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="marca.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${marcaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="marca.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" maxlength="20" required="" value="${marcaInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: marcaInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="marca.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${marcaInstance?.estatus?.id}" class="many-to-one"/>
</div>

