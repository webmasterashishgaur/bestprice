<%@ page import="bestprice.NegociacionDet" %>



<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'comentarios', 'error')} required">
	<label for="comentarios">
		<g:message code="negociacionDet.comentarios.label" default="Comentarios" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" maxlength="1000" required="" value="${negociacionDetInstance?.comentarios}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="negociacionDet.usuario.label" default="Usuario" />
		
	</label>
	<g:textField name="usuario" value="${negociacionDetInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: negociacionDetInstance, field: 'negociacionEnc', 'error')} required">
	<label for="negociacionEnc">
		<g:message code="negociacionDet.negociacionEnc.label" default="Negociacion Enc" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="negociacionEnc" name="negociacionEnc.id" from="${bestprice.NegociacionEnc.list()}" optionKey="id" required="" value="${negociacionDetInstance?.negociacionEnc?.id}" class="many-to-one"/>
</div>

