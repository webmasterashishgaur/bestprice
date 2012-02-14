<%@ page import="bestprice.Estatus" %>



<div class="fieldcontain ${hasErrors(bean: estatusInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="estatus.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="15" value="${estatusInstance?.descripcion}"/>
</div>

