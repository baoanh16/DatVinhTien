<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/NewsList">
        <div class="container">
            <h2 class="main-title center">
                <xsl:value-of disable-output-escaping="yes" select="ModuleTitle"></xsl:value-of>
            </h2>
            <div class="news-list news-slider">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <xsl:apply-templates select="News"></xsl:apply-templates>
                    </div>
                </div>
                <div class="swiper-nav">
                    <span class="lnr lnr-chevron-left"></span>
                    <span class="lnr lnr-chevron-right"></span>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="News">
        <div class="swiper-slide">
            <div class="news-item">
                <div class="imgbox">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="title">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="ImageUrl"></xsl:value-of>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Title"></xsl:value-of>
                        </xsl:attribute>
                        </img>
                    </a>
                    <time>
                        <xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
                    </time>
                </div>
                <div class="info">
                    <h4>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="Url"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="Title"></xsl:value-of>
                            </xsl:attribute>
                            <xsl:value-of select="Title"></xsl:value-of>
                        </a>
                    </h4>
                    <p>
                        <xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
                    </p>
                    <a class="btn-viewmore red">
                        <xsl:attribute name="href">
                            <xsl:value-of select="Url"></xsl:value-of>
                        </xsl:attribute>
                        <span>
                            <xsl:value-of select="/NewsList/ViewMoreText" disable-output-escaping="yes">
                            </xsl:value-of>
                        </span>
                        <span class="lnr lnr-arrow-right">
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>