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

<sec:ifAllGranted roles="ROLE_ADMIN">
		<g:if test="${categoriaInstance?.estatus?.id}">
			<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'estatus', 'error')} required">		
				<label for="estatus">
					<g:message code="categoria.estatus.label" default="Estatus" />
					<span class="required-indicator">*</span>
				</label>		
				<g:select id="estatus" name="estatus.id" from="${bestprice.Estatus.list()}" optionKey="id" required="" value="${categoriaInstance?.estatus?.id}" class="many-to-one" optionValue="descripcion"/>
			</div>			
		</g:if>			
		<g:else>
			<g:hiddenField name="estatus.id" value="3"/>		
		</g:else>
	
</sec:ifAllGranted>
<sec:ifNotGranted roles="ROLE_ADMIN">
	<g:hiddenField name="estatus.id" value="3"/>		
</sec:ifNotGranted>