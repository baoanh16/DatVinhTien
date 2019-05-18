<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="ajaxresponse">
			<h2 class="main-title">
				<xsl:value-of select="/ProductList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<!-- <div class="select-bar">
				<div class="filter-wrapper">
				</div>
				<div class="sort-wrapper">
					<select class="ajaxsort">
						<option value="/ProductList/ClearUrl">
							<xsl:value-of select="/ProductList/DefaultText" disable-output-escaping="yes">
							</xsl:value-of>
						</option>
						<xsl:apply-templates select="/ProductList/SortBy"></xsl:apply-templates>
					</select>
				</div>
			</div> -->
			<div class="row product-list">
				<xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Product">
		<div class="col-md-4 col-6">
			<div class="product-item">
				<div class="imgbox">
					<a>
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
					<h4>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h4>
				</div>
				<div class="info-hover">
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
					<a class="btn-viewmore white">
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
	</xsl:template>

	<xsl:template match="SortBy">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

</xsl:stylesheet>