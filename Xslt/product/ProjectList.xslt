<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container projects-list">
			<div class="row">
				<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Product">
		<xsl:if test="position()=1">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-8 block-1 clearfix"&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()=5">
			<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-4 block-2 clearfix"&gt;</xsl:text>
		</xsl:if>
		<div class="project-item-col">
			<div class="project-item">
				<div class="imgbox">
					<xsl:attribute name="style">
						<xsl:text disable-output-escaping="yes">background-image: url('</xsl:text>
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						<xsl:text disable-output-escaping="yes">')</xsl:text>
					</xsl:attribute>
				</div>
				<div class="title">
					<h4>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h4>
				</div>
				<div class="info-hover">
					<h4>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h4>
					<p>
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</p>
					<a class="btn-viewmore white">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<span>
							<xsl:value-of select="/ProductList/ViewMoreText" disable-output-escaping="yes">
							</xsl:value-of>
						</span>
						<span class="lnr lnr-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
		<xsl:if test="position()=4">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
		<xsl:if test="position()=6">
			<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>