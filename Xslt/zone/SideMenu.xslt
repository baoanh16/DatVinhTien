<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="side-menu">
			<div class="side-menu-mobile-header">
				<h3>
					<span>
						<xsl:value-of select="/ZoneList/CategoryText" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="mdi mdi-menu"></span>
				</h3>
			</div>
			<div class="side-menu-list">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="side-menu-item">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">side-menu-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<h3 class="title">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</a>
				<xsl:if test="count(Zone)&gt;0">
					<span class="lnr lnr-chevron-down"></span>
				</xsl:if>
			</h3>
			<xsl:if test="count(Zone)&gt;0">
				<ul>
					<xsl:if test="IsActive='true'">
						<xsl:attribute name="style">
							<xsl:text disable-output-escaping="yes">display: block</xsl:text>
						</xsl:attribute>
					</xsl:if>
					<xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
				</ul>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Child">
		<li>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>