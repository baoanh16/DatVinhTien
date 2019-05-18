<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container">
			<div class="row no-gutters service-info">
				<div class="col-lg-6">
					<xsl:apply-templates select="/NewsDetail/NewsImages"></xsl:apply-templates>
				</div>
				<div class="col-lg-6">
					<div class="textbox">
						<h1>
							<xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<div class="brief-content">
							<xsl:value-of select="/NewsDetail/BriefContent" disable-output-escaping="yes">
							</xsl:value-of>
						</div>
						<div class="full-content">
							<xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
				</div>
			</div>
		</div>
		<xsl:if test="count(/NewsDetail/NewsOther) &gt; 0">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="product-others">
							<div class="service-title">
								<h5>
									<xsl:value-of select="/NewsDetail/NewsOtherText" disable-output-escaping="yes">
									</xsl:value-of>
								</h5>
							</div>
							<div class="row">
								<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="NewsImages">
		<div class="imgbox">
			<xsl:attribute name="style">
				<xsl:text disable-output-escaping="yes">background-image: url('</xsl:text>
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				<xsl:text disable-output-escaping="yes">')</xsl:text>
			</xsl:attribute>
			<img class="lazyload">
			<xsl:attribute name="data-src">
				<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			</img>
		</div>
	</xsl:template>


	<xsl:template match="NewsOther">
		<xsl:if test="position()&lt;4">
			<div class="col-lg-4 col-sm-6">
				<div class="service-item">
					<div class="imgbox">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
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
					<div class="info">
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
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>