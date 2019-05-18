<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="job-list">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
		<div class="btn-wrapper">
			<a class="btn-viewmore red">
				<xsl:attribute name="href">
					<xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<span>
					<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<span class="lnr lnr-arrow-right"></span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="News">

		<div class="home-job-item">
			<div class="title">
				<h4>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</a>
					<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h4>
			</div>
			<div class="quantity"><span class="mdi mdi-account"></span><span>
					<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
				</span></div>
		</div>
	</xsl:template>

</xsl:stylesheet>