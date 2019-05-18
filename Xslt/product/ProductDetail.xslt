<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<section class="sanpham-wrapper pd-60">
			<div class="container product-detail">
				<h1 class="main-title">
					<xsl:value-of select="/ProductDetail/Title" disable-output-escaping="yes"></xsl:value-of>
					<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h1>
				<div class="row">
					<div class="col-lg-6">
						<xsl:if test="count(/ProductDetail/ProductImages)&gt;0">
							<div class="product-image-slider">
								<div class="product-thumbnails-nav">
									<span class="lnr lnr-chevron-up"></span><span class="lnr lnr-chevron-down"></span>
								</div>
								<div class="swiper-container product-thumbnails">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="/ProductDetail/ProductImages"
											mode="ProductImagesThumbnail"></xsl:apply-templates>
									</div>
								</div>
								<div class="swiper-container product-images">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="/ProductDetail/ProductImages"
											mode="ProductImagesBig"></xsl:apply-templates>
									</div>
								</div>
							</div>
						</xsl:if>
					</div>
					<div class="col-lg-6">
						<div class="brief-content">
							<xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes">
							</xsl:value-of>
						</div>
						<div class="product-attributes">
							<table>
								<tbody>
									<xsl:apply-templates select="/ProductDetail/ProductAttributes">
									</xsl:apply-templates>
									<tr class="contact">
										<th>Liên hệ</th>
										<td>
											<p>
												<a href="tel:02873000296">
													<span class="mdi mdi-phone"></span>
													<span>(028) 7300 0296</span></a>
											</p>
											<p>
												<a href="mailto:info@datvinhtien.vn">
													<span class="mdi mdi-email"></span>
													<span>info@datvinhtien.vn</span>
												</a>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="social"></div>
					</div>

					<xsl:if test="count(/ProductDetail/FullContent) != ''">
						<div class="col-12">
							<div class="product-info product-attributes">
								<div class="product-detail-title">
									<h5>
										<xsl:value-of select="/ProductDetail/ProductInfoText"
											disable-output-escaping="yes">
										</xsl:value-of>
									</h5>
								</div>
								<div class="full-content">
									<xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes">
									</xsl:value-of>
								</div>
								<div class="btn-wrapper">
									<a class="btn-viewmore red" href="javascript:void(0)">
										<span>
											<xsl:value-of select="/ProductDetail/ReadMoreText"
												disable-output-escaping="yes"></xsl:value-of>
										</span>
										<span class="lnr lnr-arrow-right"></span>
									</a>
								</div>
							</div>
						</div>
					</xsl:if>
					<!-- <xsl:if test="count(/ProductDetail/ProductRelated) &gt;0">
						<div class="col-12">
							<div class="product-used-by-projects">
								<div class="product-detail-title">
									<h5>
										<xsl:value-of select="/ProductDetail/ProductUsedInProjectsText"
											disable-output-escaping="yes"></xsl:value-of>
									</h5>
								</div>
								<div class="product-used-by-projects-nav"><span class="lnr lnr-arrow-left"></span><span
										class="lnr lnr-arrow-right"></span></div>
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<xsl:apply-templates select="/ProductDetail/ProductRelated">
										</xsl:apply-templates>
									</div>
								</div>
							</div>
						</div>
					</xsl:if> -->


					<xsl:if test="count(/ProductDetail/ProductOther) &gt;0">
						<div class="col-12">
							<div class="product-others">
								<div class="product-detail-title">
									<h5>
										<xsl:value-of select="/ProductDetail/ProductOtherText"
											disable-output-escaping="yes"></xsl:value-of>
									</h5>
								</div>
								<div class="product-others-nav"><span class="lnr lnr-arrow-left"></span><span
										class="lnr lnr-arrow-right"></span></div>
								<div class="swiper-container">
									<div class="swiper-wrapper">

										<xsl:apply-templates select="/ProductDetail/ProductOther">
										</xsl:apply-templates>

									</div>
								</div>
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="ProductImages" mode="ProductImagesThumbnail">
		<div class="swiper-slide">
			<div class="imgbox">
				<img class="swiper-lazy">
				<xsl:attribute name="src">
					<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="alt">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:attribute>
				</img>
				<div class="swiper-lazy-preloader"></div>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="ProductImages" mode="ProductImagesBig">
		<div class="swiper-slide">
			<div class="imgbox">
				<a data-fancybox="product-gallery">
					<xsl:attribute name="href">
						<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
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
				<div class="swiper-lazy-preloader"></div>
			</div>
		</div>
	</xsl:template>


	<xsl:template match="ProductAttributes">
		<tr>
			<th>
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</th>
			<td>
				<xsl:value-of select="Content" disable-output-escaping="yes"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="ProductRelated">
		<div class="swiper-slide">
			<div class="project-item">
				<div class="imgbox">
					<xsl:attribute name="style">
						<xsl:text disable-output-escaping="yes">background-image: url('</xsl:text>
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
						<xsl:text disable-output-escaping="yes">')</xsl:text>
					</xsl:attribute>
					<img class="swiper-lazy">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					</img>
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
					<a class="btn-viewmore white" href="#">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
						<span>
							<xsl:value-of select="/ProductDetail/ViewMoreText" disable-output-escaping="yes">
							</xsl:value-of>
						</span><span class="lnr lnr-arrow-right"></span>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="ProductOther">
		<div class="swiper-slide">
			<div class="product-item">
				<div class="imgbox">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
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
					<div class="swiper-lazy-preloader"></div>
				</div>
				<div class="title">
					<h4>
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</h4>
				</div>
				<div class="info-hover">
					<h4><a>
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
					<a class="btn-viewmore white" href="sanpham-ct.html">
							<xsl:attribute name="href">
								<xsl:value-of select="Url" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
							</xsl:attribute>
						<span>
							<xsl:value-of select="/ProductDetail/ViewMoreText" disable-output-escaping="yes">
							</xsl:value-of>
						</span><span class="lnr lnr-arrow-right"></span></a>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>