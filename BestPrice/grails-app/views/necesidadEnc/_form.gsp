<%@ page import="bestprice.NecesidadEnc" %>



<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="necesidadEnc.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" maxlength="100" required="" value="${necesidadEncInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="necesidadEnc.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="300" required="" value="${necesidadEncInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="necesidadEnc.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${bestprice.Categoria.list()}" optionKey="id" required="" value="${necesidadEncInstance?.categoria?.id}" class="many-to-one" optionValue="nombreCorto"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'estatus', 'error')} required">
	<label for="estatus">
		<g:message code="necesidadEnc.estatus.label" default="Estatus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${necesidadEncInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'imagen1', 'error')} ">
	<label for="imagen1">
		<g:message code="necesidadEnc.imagen1.label" default="Imagen1" />
		
	</label>
	<input type="file" id="imagen1" name="imagen1" value="${necesidadEncInstance?.imagen1}"/>	
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'imagen2', 'error')} ">
	<label for="imagen2">
		<g:message code="necesidadEnc.imagen2.label" default="Imagen2" />
		
	</label>
	<input type="file" id="imagen2" name="imagen2" value="${necesidadEncInstance?.imagen2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'imagen3', 'error')} ">
	<label for="imagen3">
		<g:message code="necesidadEnc.imagen3.label" default="Imagen3" />
		
	</label>
	<input type="file" id="imagen3" name="imagen3" value="${necesidadEncInstance?.imagen3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'imagen4', 'error')} ">
	<label for="imagen4">
		<g:message code="necesidadEnc.imagen4.label" default="Imagen4" />
		
	</label>
	<input type="file" id="imagen4" name="imagen4" value="${necesidadEncInstance?.imagen4}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: necesidadEncInstance, field: 'imagen5', 'error')} ">
	<label for="imagen5">
		<g:message code="necesidadEnc.imagen5.label" default="Imagen5" />
		
	</label>
	<input type="file" id="imagen5" name="imagen5" value="${necesidadEncInstance?.imagen5}"/>
</div>

