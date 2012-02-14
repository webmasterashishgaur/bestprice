<%@ page import="bestprice.Poblacion" %>



<div class="fieldcontain ${hasErrors(bean: poblacionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="poblacion.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="40" value="${poblacionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poblacionInstance, field: 'nombreCorto', 'error')} ">
	<label for="nombreCorto">
		<g:message code="poblacion.nombreCorto.label" default="Nombre Corto" />
		
	</label>
	<g:textField name="nombreCorto" maxlength="20" value="${poblacionInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poblacionInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="poblacion.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${bestprice.Estado.list()}" optionKey="id" required="" value="${poblacionInstance?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: poblacionInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="poblacion.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${poblacionInstance?.estatus?.id}" class="many-to-one"/>
</div>

