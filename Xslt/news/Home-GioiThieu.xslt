<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone">
			<xsl:with-param select="/ZoneList/ModuleTitle" name="moduleTitle"></xsl:with-param>
		</xsl:apply-templates>
		<xsl:value-of select="/Root/RootUrl" disable-output-escaping="yes"></xsl:value-of>
	</xsl:template>

	<xsl:template match="Zone">
		<xsl:param name="moduleTitle"></xsl:param>
		<div class="container">
			<div class="row top">
				<div class="col-lg-4 title">
					<h2 class="main-title">
						<xsl:value-of select="$moduleTitle" disable-output-escaping="yes"></xsl:value-of>
					</h2>
				</div>
				<div class="col-lg">
					<div class="textbox">
						<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
						<div class="btn-wrapper">
							<a class="btn-viewmore white" href="#">
								<xsl:attribute name="href">
									<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
								</xsl:attribute>
								<span>
									<xsl:value-of select="/ZoneList/ViewMoreText" disable-output-escaping="yes">
									</xsl:value-of>
								</span>
								<span class="lnr lnr-arrow-right"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<xsl:if test="count(News) &gt;0">
				<div class="row bottom">
					<xsl:apply-templates select="News"></xsl:apply-templates>

				</div>
			</xsl:if>
		</div>
	</xsl:template>


	<xsl:template match="News">

		<div class="col-lg-3 col-sm-6">
			<div class="item">
				<div class="img"><img class="lazyload">
					<xsl:attribute name="data-src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="text">
					<h4 data-count="14">
						<xsl:attribute name="data-count">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						0
					</h4>
					<p>
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>