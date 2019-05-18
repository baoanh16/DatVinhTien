<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="row">
			<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<div class="col-12">
			<h2 class="main-title center">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<div class="cumshot-wrapper">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">cumshot-wrapper slider-</xsl:text>
					<xsl:value-of select="position()+1" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:if test="count(News)&gt;0">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select="News">
							</xsl:apply-templates>
						</div>
					</div>
					<div class="swiper-navigation">
						<span class="swiper-prev lnr lnr-chevron-left"></span>
						<span class="swiper-next lnr lnr-chevron-right"></span>
					</div>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="swiper-slide">
			<a>
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



	<!-- <div>
			<xsl:attribute name="class">
				<xsl:text disable-output-escaping="yes">col-lg-12 block-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="title">
				<h3>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</h3>
				<div>
					<xsl:attribute name="class">
						<xsl:text disable-output-escaping="yes">swiper-nav nav-tab-</xsl:text>
						<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<span class="lnr lnr-arrow-left"></span>
					<span class="lnr lnr-arrow-right"></span>
				</div>
			</div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<xsl:apply-templates select="News"></xsl:apply-templates>
				</div>
			</div>
		</div> -->
</xsl:stylesheet>