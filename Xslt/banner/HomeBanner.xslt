<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="swiper-container">
			<div class="swiper-nav">
				<span class="lnr lnr-chevron-left"></span>
				<span class="lnr lnr-chevron-right"></span>
			</div>
			<div class="swiper-wrapper">
				<xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
			</div>
			<div class="btn-down">
				<img src="/Data/Sites/1/skins/default/img/btn-down.png" alt="" />
			</div>
		</div>
	</xsl:template>
	<xsl:template match="Banner">
		<div class="swiper-slide">
			<xsl:attribute name="data-background">
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-background-mobile">
				<xsl:value-of select="ThumbnailUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<a>
				<xsl:if test="Url != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="Title !='' or Description != ''">
					<div class="container">
						<div class="caption">
							<xsl:if test="position()=1">
								<xsl:attribute name="class">
									<xsl:text disable-output-escaping="yes">caption active</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="Title != ''">
								<h3>
									<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
								</h3>
							</xsl:if>
							<xsl:if test="Description != ''">
								<p>
									<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
								</p>
							</xsl:if>
						</div>
					</div>
				</xsl:if>
			</a>
		</div>
	</xsl:template>
</xsl:stylesheet>