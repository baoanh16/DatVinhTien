<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:msxsl='urn:schemas-microsoft-com:xslt' exclude-result-prefixes='msxsl'>
	<xsl:output method='html' indent='yes' />

	<xsl:template match='/'>
		<div class="content">
			<div class="responsive-table">
				<table class="table-v1">
					<thead>
						<tr>
							<th>
								<xsl:value-of disable-output-escaping='yes' select='/NewsList/DocumentTitleText'>
								</xsl:value-of>
							</th>
							<th>
								<xsl:value-of disable-output-escaping='yes' select='/NewsList/CreatedDateText'>
								</xsl:value-of>
							</th>
							<th>
								<xsl:value-of disable-output-escaping='yes' select='/NewsList/ViewText'>
								</xsl:value-of>
							</th>
							<th>
								<xsl:value-of disable-output-escaping='yes' select='/NewsList/DownloadText'>
								</xsl:value-of>
							</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select='/NewsList/News'></xsl:apply-templates>
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>

	<xsl:template match='News'>
		<tr>
			<td class="title">
				<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
				<xsl:value-of select='EditLink' disable-output-escaping='yes'></xsl:value-of>
			</td>
			<td class="text">
				<xsl:value-of disable-output-escaping='yes' select='CreatedDate'></xsl:value-of>
			</td>
			<td class="btn-view">
				<a>
			<xsl:attribute name="data-fancybox">
				<xsl:text disable-output-escaping="yes">file_</xsl:text>
				<xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>
			</xsl:attribute>
					<xsl:attribute name='href'>
						<xsl:value-of select='FileUrl'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<em class="mdi mdi-file-outline"></em>
				</a>
			</td>
			<td class="btn-download">
				<a class="download_document" download="">
					<xsl:attribute name='href'>
						<xsl:value-of select='FileUrl'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='data-filename'>
						<xsl:value-of disable-output-escaping='yes' select='Title'></xsl:value-of>
					</xsl:attribute>
					<span class="lnr lnr-download"></span>
				</a>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>