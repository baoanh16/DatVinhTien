<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="title">
			<h2 class="main-title center">
				<xsl:value-of select="/ProductList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
		</div>
		<xsl:if test="count(/ProductList/Product) &gt; 0">

			<div class="products-list">
				<div class="swiper-nav">
					<span class="lnr lnr-chevron-left"></span>
					<span class="lnr lnr-chevron-right"></span>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>

					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="Product">
		<div class="swiper-slide">
			<div class="product-item-col">
				<div class="product-item">
					<div class="imgbox"><a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<img class="lazyload">
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							</img>
						</a>
					</div>
					<div class="title">
						<p>
							<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
						</p>
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h4>
					</div>
					<div class="info-hover">
						<p>
							<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
						</p>
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
						</h4>
						<a class="btn-viewmore white" href="sanpham-ct.html">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
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
		</div>
	</xsl:template>

</xsl:stylesheet>