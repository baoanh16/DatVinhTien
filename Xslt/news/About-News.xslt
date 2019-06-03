<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="Zone">
		<xsl:choose>
			<xsl:when test="position()=1">
				<section class="about-1 pd-60">
					<div class="container">
						<h2 class="main-title center">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<div class="row">
							<xsl:apply-templates select="News" mode="News-1"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=2">
				<section class="about-2 pd-60">
					<div class="container">
						<h2 class="main-title center">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<div class="row">
							<div class="col-12">
								<div class="imgbox"><img class="lazyload">
									<xsl:attribute name="data-src">
										<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
									</xsl:attribute>
									</img>
								</div>
							</div>
							<xsl:apply-templates select="News" mode="News-2"></xsl:apply-templates>
						</div>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=3">
				<section class="about-3 pd-60">
					<div class="container">
						<h2 class="main-title center">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<xsl:if test="count(News)&gt;0">
							<div class="row">
								<div class="col-lg-6">
									<div class="year">
										<div class="swiper-nav">
											<span class="lnr lnr-arrow-left"></span>
											<span class="lnr lnr-arrow-right"></span>
										</div>
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<xsl:apply-templates select="News" mode="News-3-Thumbnail">
												</xsl:apply-templates>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="year-info">
										<div class="swiper-container">
											<div class="swiper-wrapper">
												<xsl:apply-templates select="News" mode="News-3-Big">
												</xsl:apply-templates>
											</div>
										</div>
									</div>
								</div>
							</div>
						</xsl:if>
					</div>
				</section>
			</xsl:when>
			<xsl:when test="position()=4">
				<section class="about-4 pd-60">
					<div class="container">
						<h2 class="main-title center">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h2>
						<xsl:if test="count(News)&gt;0">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<xsl:apply-templates select="News" mode="News-4"></xsl:apply-templates>
								</div>
							</div>
							<div class="swiper-navigation">
								<span class="swiper-prev lnr lnr-chevron-left"></span>
								<span class="swiper-next lnr lnr-chevron-right"></span>
							</div>
						</xsl:if>
					</div>
				</section>
			</xsl:when>
			<!-- <xsl:when test="position()=5">
				<section class="about-5 pb-60">
					<div class="container">
						<div class="home-tab">
							<nav tab-for="about-coop">
								<xsl:apply-templates select="Zone" mode="Zone-Zone-5-Tab"></xsl:apply-templates>
							</nav>
						</div>
						<div class="tab-content-wrapper row" tab-content="about-coop">
							<div class="col-12">
								<xsl:apply-templates select="Zone" mode="Zone-Zone-5"></xsl:apply-templates>
							</div>
						</div>
					</div>
				</section>
			</xsl:when> -->
		</xsl:choose>
	</xsl:template>


	<xsl:template match="News" mode="News-1">
		<div class="col-lg-6">
			<div class="imgbox"><img class="lazyload">
				<xsl:attribute name="data-src">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				</img>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="textbox">
				<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
			</div>
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="News-2">
		<xsl:if test="position()&lt;3">
			<div class="col-lg-6">
				<div class="textbox">
					<div class="img"><img class="lazyload">
						<xsl:attribute name="data-src">
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<div class="content">
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
						<xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="News" mode="News-3-Thumbnail">
		<div class="swiper-slide">
			<div class="title">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</div><span class="circle"></span>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="News-3-Big">
		<div class="swiper-slide">
			<div class="year-info-item even">
				<xsl:if test="position() mod 2 = 1">
					<xsl:attribute name="class">
						<xsl:text disable-output-escaping="yes">year-info-item odd</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<div class="icon">
					<div class="img">
						<img class="swiper-lazy">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<div class="title">
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
					</div>
				</div>
				<div class="content">
					<p>
						<xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
					</p>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="News" mode="News-4">
		<div class="swiper-slide">
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="data-fancybox">
					<xsl:text disable-output-escaping="yes">chungnhan-</xsl:text>
					<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<figure>
					<div class="imgbox">
						<img class="swiper-lazy">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
					<figcaption>
						<h4>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
						</h4>
					</figcaption>
				</figure>
			</a>
		</div>
	</xsl:template>

</xsl:stylesheet>