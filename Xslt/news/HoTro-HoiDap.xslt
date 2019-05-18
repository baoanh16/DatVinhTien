<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
	<xsl:output method='html' indent='yes' />
	<xsl:template match='/'>
		<div class="faqs">
			<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match='News'>
		<div class="faq">
			<div class="question">
				<p>
					<xsl:value-of disable-output-escaping='yes' select='position()'></xsl:value-of>
					<xsl:text>. </xsl:text>
					<strong>
						<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
					</strong>
					<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
				</p>
				<em class="lnr lnr-chevron-down"></em>
			</div>
			<div class="answer">
				<xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>