<%@ page import="bestprice.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estado.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${estadoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="estado.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" maxlength="20" required="" value="${estadoInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="estado.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${estadoInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="estado.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="pais.id" from="${bestprice.Pais.list()}" optionKey="id" required="" value="${estadoInstance?.pais?.id}" class="many-to-one" optionValue="nombreCorto"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'poblaciones', 'error')} ">
	<label for="poblaciones">
		<g:message code="estado.poblaciones.label" default="Poblaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.poblaciones?}" var="p">
    <li><g:link controller="poblacion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="poblacion" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'poblacion.label', default: 'Poblacion')])}</g:link>
</li>
</ul>

</div>

