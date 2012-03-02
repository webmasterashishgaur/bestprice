<%@ page import="bestprice.NegociacionDet" %>



<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="negociacionDet.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textField name="comentarios" value="${negociacionDetInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'negociacionEnc', 'error')} required">
	<label for="negociacionEnc">
		<g:message code="negociacionDet.negociacionEnc.label" default="Negociacion Enc" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="negociacionEnc" name="negociacionEnc.id" from="${bestprice.NegociacionEnc.list()}" optionKey="id" required="" value="${negociacionDetInstance?.negociacionEnc?.id}" class="many-to-one"/>
</div>

