<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<h2 class="main-title center"><xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h2>
		<div class="mobile-nav-toggle">
			<h4><xsl:value-of disable-output-escaping="yes" select="/ZoneList/CategoryText"></xsl:value-of></h4>
			<span class="mdi mdi-menu"></span>
		</div>
		<nav>
			<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
		</nav>
	</xsl:template>

	<xsl:template match="Zone">
			<xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Zone" mode="Child">
		<a class="tab-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">tab-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</a>
	</xsl:template>

</xsl:stylesheet>