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
				<h4><xsl:value-of disable-output-escaping="yes" select="/ZoneList/CategoryText"></xsl:value-of></h4>
				<span class="mdi mdi-menu"></span>
			</div>
			<nav tab-for="home-news">
				<xsl:apply-templates select="/ZoneList/Zone" mode="Nav"></xsl:apply-templates>
			</nav>
		</div>
		<div class="container" tab-content="home-news">
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
			<div class="news-list clearfix">
				<xsl:apply-templates select="News"></xsl:apply-templates>
			</div>
			<div class="btn-wrapper">
				<a class="btn-viewmore">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<span>
						<xsl:value-of select="/ZoneList/ViewAllText" disable-output-escaping="yes"></xsl:value-of>
					</span>
					<span class="lnr lnr-arrow-right">
					</span>
				</a>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="News">
		<xsl:if test="position() &lt; 4">
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
						<a class="btn-viewmore red">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>