<%@ page import="bestprice.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="estado.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="40" value="${estadoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombreCorto', 'error')} ">
	<label for="nombreCorto">
		<g:message code="estado.nombreCorto.label" default="Nombre Corto" />
		
	</label>
	<g:textField name="nombreCorto" maxlength="20" value="${estadoInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'estatus', 'error')} ">
	<label for="estatus">
		<g:message code="estado.estatus.label" default="Estatus" />
		
	</label>
	<g:checkBox name="estatus" value="${estadoInstance?.estatus}" />
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="estado.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="pais.id" from="${bestprice.Pais.list()}" optionKey="id" required="" value="${estadoInstance?.pais?.id}" class="many-to-one"/>
</div>

