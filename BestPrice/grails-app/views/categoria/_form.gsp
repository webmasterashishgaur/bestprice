<%@ page import="bestprice.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="categoria.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" value="${categoriaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="categoria.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" maxlength="20" required="" value="${categoriaInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="categoria.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${categoriaInstance?.estatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'necesidadEncs', 'error')} ">
	<label for="necesidadEncs">
		<g:message code="categoria.necesidadEncs.label" default="Necesidad Encs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoriaInstance?.necesidadEncs?}" var="n">
    <li><g:link controller="necesidadEnc" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="necesidadEnc" action="create" params="['categoria.id': categoriaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc')])}</g:link>
</li>
</ul>

</div>

