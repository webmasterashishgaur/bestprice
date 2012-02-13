<%@ page import="bestprice.NegociacionDet" %>



<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'comentarioComprador', 'error')} ">
	<label for="comentarioComprador">
		<g:message code="negociacionDet.comentarioComprador.label" default="Comentario Comprador" />
		
	</label>
	<g:textField name="comentarioComprador" value="${negociacionDetInstance?.comentarioComprador}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'comentarioVendedor', 'error')} ">
	<label for="comentarioVendedor">
		<g:message code="negociacionDet.comentarioVendedor.label" default="Comentario Vendedor" />
		
	</label>
	<g:textField name="comentarioVendedor" value="${negociacionDetInstance?.comentarioVendedor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="negociacionDet.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${negociacionDetInstance?.fecha}"  />
</div>

