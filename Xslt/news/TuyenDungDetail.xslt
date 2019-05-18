<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
    <xsl:output method='html' indent='yes' />
    <xsl:template match='/'>
        <div class="tuyendung-ct">
            <div class="row">
                <div class="col-lg-9">
                    <h1>
                        <xsl:value-of disable-output-escaping='yes' select='/NewsDetail/Title'></xsl:value-of>
                        <xsl:value-of select='/NewsDetail/EditLink' disable-output-escaping='yes'></xsl:value-of>
                    </h1>
                    <h2>
                        <xsl:value-of disable-output-escaping='yes' select='/NewsDetail/JobInfoText'></xsl:value-of>
                    </h2>
                    <div class="brief-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <table class="table-v2">
                                    <xsl:apply-templates select='/NewsDetail/NewsAttributes' mode="Attributes1">
                                    </xsl:apply-templates>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <table class="table-v2">
                                    <xsl:apply-templates select='/NewsDetail/NewsAttributes' mode="Attributes2">
                                    </xsl:apply-templates>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="full-content">
                        <xsl:value-of disable-output-escaping='yes' select='/NewsDetail/FullContent'></xsl:value-of>
                        <div class="buttons">
                            <a class="btn-register" href="javascript:void(0)" data-fancybox="" data-src="#ungtuyen">Ứng tuyển</a>
                            <!-- <div class="or-text">Hoặc</div>
                            <a class="btn-form">
                                <xsl:attribute name='href'>
                                    <xsl:value-of select='FileUrl'></xsl:value-of>
                                </xsl:attribute>
                                <xsl:attribute name='target'>
                                    <xsl:text>_blank</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name='title'>
                                    <xsl:value-of select='Title'></xsl:value-of>
                                </xsl:attribute>
                                Tải mẫu thông tin ứng viên
                            </a> -->
                            <a class="btn-send" href="javascript:void(0)" data-fancybox="" data-src="#guicauhoi">Gửi câu hỏi</a>
                        </div>
                        <!-- <div class="tools">
                            <a class="btn-share" href="javascript:void(0)">
                                <em class="mdi mdi-share-variant"></em>
                            </a>
                            <a class="btn-print" href="javascript:void(0)">
                                <em class="mdi mdi-printer"></em>
                            </a>
                            <a class="btn-download" href="javascript:void(0)">
                                <em class="mdi mdi-cloud-download"></em>
                            </a>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="other-news-title">
                        <xsl:value-of disable-output-escaping='yes' select='/NewsDetail/OtherJobsText'></xsl:value-of>
                    </div>
                    <div class="other-news">
                        <xsl:apply-templates select='/NewsDetail/NewsOther'></xsl:apply-templates>
                    </div>
                </div>
                <div class="hidden">
                    <div id="ungtuyen">
                        <div class="popup-body">
                            <iframe src="" frameborder="0">
                                <xsl:attribute name='src'>
                                    <xsl:value-of disable-output-escaping='yes' select='/NewsDetail/ApplyUrl'></xsl:value-of>
                                </xsl:attribute>
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match='NewsAttributes' mode="Attributes1">
        <xsl:if test="position() &gt; 0 and position() &lt; 6">
            <tr>
                <td>
                    <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                </td>
                <td>
                    <xsl:value-of disable-output-escaping='yes' select='Content'></xsl:value-of>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
    <xsl:template match='NewsAttributes' mode="Attributes2">
        <xsl:if test="position() &gt; 5">
            <tr>
                <td>
                    <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
                </td>
                <td>
                    <xsl:value-of disable-output-escaping='yes' select='Content'></xsl:value-of>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <xsl:template match='NewsOther'>
        <div class="item">
            <div class="time">
                <xsl:value-of disable-output-escaping='yes' select='CreatedDate'></xsl:value-of>
                <xsl:text> </xsl:text>
                <xsl:value-of disable-output-escaping='yes' select='CreatedTime'></xsl:value-of>
            </div>
            <a class="title">
                <xsl:attribute name='href'>
                    <xsl:value-of select='Url'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='target'>
                    <xsl:value-of select='Target'></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name='title'>
                    <xsl:value-of select='Title'></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
            </a>
        </div>
    </xsl:template>
</xsl:stylesheet>