<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="news-detail pd-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-xl-9">
						<h1>
							<xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h1>
						<time>
							<xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
						</time>
						<div class="brief-content">
							<p><i>
									<xsl:value-of select="/NewsDetail/BriefContent" disable-output-escaping="yes">
									</xsl:value-of>
								</i></p>
							<br />
						</div>
						<div class="full-content">
							<xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
						</div>
					</div>
					<div class="col-lg-4 col-xl-3">
						<div class="side-news">
							<h2>
								<xsl:value-of select="/NewsDetail/NewsOtherText" disable-output-escaping="yes">
								</xsl:value-of>
							</h2>
							<xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="NewsOther">
		<div class="item">
			<figure>
				<div class="img">
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
				<figcaption>
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
				</figcaption>
			</figure>
		</div>
	</xsl:template>

</xsl:stylesheet>