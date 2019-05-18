<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
	<xsl:output method='html' indent='yes' />
	<xsl:template match='/'>
		<div class="tagline">
			<h2 class="main-title center">
				<xsl:value-of disable-output-escaping='yes' select='/NewsList/ZoneTitle'></xsl:value-of>
			</h2>
		</div>
		<div class="contact-map">
			<div class="items-wrapper">
				<div class="items">
					<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
				</div>
			</div>
			<div class="map" id="contactMap">
				<xsl:apply-templates select='/NewsList/News' mode="Map"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match='News'>
		<div class="item">
			<xsl:if test="position() = 1">
				<xsl:attribute name='class'>
					<xsl:text>item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<h2>
				<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
				<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
			</h2>
			<xsl:value-of disable-output-escaping='yes' select='BriefContent'></xsl:value-of>
			<div class="map-iframe hidden">
				<xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
			</div>
		</div>
	</xsl:template>

	<xsl:template match='News' mode="Map">
		<xsl:if test="position() = 1">
			<xsl:value-of disable-output-escaping='yes' select='FullContent'></xsl:value-of>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>