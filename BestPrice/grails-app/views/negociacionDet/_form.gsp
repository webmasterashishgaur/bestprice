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

