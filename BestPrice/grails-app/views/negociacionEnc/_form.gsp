<%@ page import="bestprice.NegociacionEnc" %>



<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'comentarios', 'error')} required">
	<label for="comentarios">
		<g:message code="negociacionEnc.comentarios.label" default="Comentarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comentarios" maxlength="200" required="" value="${negociacionEncInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="negociacionEnc.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${negociacionEncInstance?.estatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen1', 'error')} ">
	<label for="imagen1">
		<g:message code="negociacionEnc.imagen1.label" default="Imagen1" />
		
	</label>
	<input type="file" id="imagen1" name="imagen1" value="${negociacionEncInstance?.imagen1}"/>		
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen2', 'error')} ">
	<label for="imagen2">
		<g:message code="negociacionEnc.imagen2.label" default="Imagen2" />
		
	</label>
	<input type="file" id="imagen2" name="imagen2" value="${negociacionEncInstance?.imagen2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen3', 'error')} ">
	<label for="imagen3">
		<g:message code="negociacionEnc.imagen3.label" default="Imagen3" />
		
	</label>
	<input type="file" id="imagen3" name="imagen3" value="${negociacionEncInstance?.imagen3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'imagen4', 'error')} ">
	<label for="imagen4">
		<g:message code="negociacionEnc.imagen4.label" default="Imagen4" />
		
	</label>
	<input type="file" id="imagen4" name="imagen4" value="${negociacionEncInstance?.imagen4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'necesidadEnc', 'error')} required">
	<label for="necesidadEnc">
		<g:message code="negociacionEnc.necesidadEnc.label" default="Necesidad Enc" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="necesidadEnc" name="necesidadEnc.id" from="${bestprice.NecesidadEnc.list()}" optionKey="id" required="" value="${negociacionEncInstance?.necesidadEnc?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'negociacionDets', 'error')} ">
	<label for="negociacionDets">
		<g:message code="negociacionEnc.negociacionDets.label" default="Negociacion Dets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${negociacionEncInstance?.negociacionDets?}" var="n">
    <li><g:link controller="negociacionDet" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="negociacionDet" action="create" params="['negociacionEnc.id': negociacionEncInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="negociacionEnc.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: negociacionEncInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionEncInstance, field: 'vendedor', 'error')} required">
	<label for="vendedor">
		<g:message code="negociacionEnc.vendedor.label" default="Vendedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendedor" name="vendedor.id" from="${bestprice.Vendedor.list()}" optionKey="id" required="" value="${negociacionEncInstance?.vendedor?.id}" class="many-to-one"/>
</div>

