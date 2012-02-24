<%@ page import="bestprice.Pais" %>



<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="pais.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${paisInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="pais.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" maxlength="20" required="" value="${paisInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paisInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="pais.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${paisInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
</div>

