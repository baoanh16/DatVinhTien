<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<h2 class="main-title center">
		<xsl:value-of select="/NewsList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of></h2>
		<div class="news-list clearfix">
			<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="News">
		<div class="news-item-col">
			<div class="news-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="style">
							<xsl:text disable-output-escaping="yes">background-image: url('</xsl:text>
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
							<xsl:text disable-output-escaping="yes">')</xsl:text>
						</xsl:attribute>
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
					<time>
						<xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
					</time>
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
					<xsl:if test="position()&gt;3">
						<p><xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of></p>
					</xsl:if>
					<a class="btn-viewmore red">
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<span>
							<xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes">
							</xsl:value-of>
						</span>
						<span class="lnr lnr-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>