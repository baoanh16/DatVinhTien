<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="row">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="col-lg-4 col-sm-6">
			<div class="service-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">tt-gallery-</xsl:text>
							<xsl:value-of select="NewsId" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="d-none">
					<xsl:apply-templates select="NewsImages">
						<xsl:with-param select="NewsId" name="newsId"></xsl:with-param>
					</xsl:apply-templates>
				</div>
				<div class="info">
					<h4><a>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</a>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h4>
				</div>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="NewsImages">
		<xsl:param name="newsId"></xsl:param>
		<xsl:if test="position()>1">
			<a>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes">tt-gallery-</xsl:text>
					<xsl:value-of select="$newsId" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
			</a>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>