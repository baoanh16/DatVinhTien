<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="row">
			<div class="col-lg-12 block-1">
				<div class="title">
					<h3>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h3>
					<div class="swiper-nav nav-tab-1"><span class="lnr lnr-arrow-left" tabindex="0" role="button"
							aria-label="Previous slide" aria-disabled="false"></span><span class="lnr lnr-arrow-right"
							tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></span></div>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="News"></xsl:apply-templates>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="News">
		<div class="swiper-slide"><a>
				<!-- <xsl:attribute name="href">
					<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute> -->
				<xsl:attribute name="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<img class="swiper-lazy">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				</img>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>