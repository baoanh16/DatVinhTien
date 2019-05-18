<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="row video-list">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="col-lg-4 col-sm-6">
			<div class="video-item">
				<div class="imgbox">
					<img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="play-button">
					<a>
						<xsl:attribute name="data-fancybox">
							<xsl:text disable-output-escaping="yes">tt-gallery-</xsl:text>
							<xsl:value-of select="NewsId" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<img src="/Data/Sites/1/skins/default/img/icon_play.png" />
					</a>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>