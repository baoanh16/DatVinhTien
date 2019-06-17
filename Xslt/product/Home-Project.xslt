<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="container home-tab">
			<h2 class="main-title center">
				<xsl:value-of select="/ZoneList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<div class="mobile-nav-toggle">
				<h4><xsl:value-of select="/ZoneList/CategoryText" disable-output-escaping="yes"></xsl:value-of></h4>
				<span class="mdi mdi-menu"></span>
			</div>
			<nav tab-for="home-project">
				<xsl:apply-templates select="/ZoneList/Zone" mode="Nav"></xsl:apply-templates>
			</nav>
		</div>
		<div class="container projects-list" tab-content="home-project">
			<xsl:apply-templates select="/ZoneList/Zone" mode="Content"></xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template match="Zone" mode="Nav">
		<a class="tab-item">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">tab-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="href">
				<xsl:text disable-output-escaping="yes">#tab-content-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</a>
	</xsl:template>

	<xsl:template match="Zone" mode="Content">
		<div class="tab-content" style="display: none">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">tab-content show</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="position()=1">
				<xsl:attribute name="style">
					<xsl:text disable-output-escaping="yes">display: block</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">tab-content-</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
			<div class="row">
				<xsl:apply-templates select="Product"></xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="Product">
		<xsl:if test="position() &lt; 7">
			<xsl:if test="position()=1">
				<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-8 block-1 clearfix"&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="position()=5">
				<xsl:text disable-output-escaping="yes">&lt;div class="col-lg-4 block-2 clearfix"&gt;</xsl:text>
			</xsl:if>
			<div class="project-item-col">
				<div class="project-item">
					<div class="imgbox">
						<xsl:attribute name="style">
							<xsl:text disable-output-escaping="yes">background-image: url('</xsl:text>
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
							<xsl:text disable-output-escaping="yes">')</xsl:text>
						</xsl:attribute>
					</div>
					<div class="title">
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h4>
					</div>
					<div class="info-hover">
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
						<p>
							<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
						</p>
						<a class="btn-viewmore white">
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
			<xsl:if test="position()=4">
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			</xsl:if>
			<xsl:if test="position()=6">
				<xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>