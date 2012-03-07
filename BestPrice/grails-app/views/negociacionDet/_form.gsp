<%@ page import="bestprice.NegociacionDet" %>



<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'comentarios', 'error')} required">
	<label for="comentarios">
		<g:message code="negociacionDet.comentarios.label" default="Comentarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="1000" required="" value="${negociacionDetInstance?.comentarios}"/>
</div>
<g:hiddenField name="negociacionEnc.id" value="${negociacionEnc}"/>