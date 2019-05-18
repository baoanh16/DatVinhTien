<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<div class="tuyendung">
			<h2 class="main-title center">
				<xsl:value-of select="/NewsList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of>
			</h2>
			<div class="content">
				<div class="responsive-table">
					<table class="table-v1">
						<thead>
							<tr>
								<th>
									<xsl:value-of disable-output-escaping="yes" select="/NewsList/JobTitleText">
									</xsl:value-of>
								</th>
								<th>
									<xsl:value-of disable-output-escaping="yes" select="/NewsList/DepartmentText">
									</xsl:value-of>
								</th>
								<th>
									<xsl:value-of disable-output-escaping="yes" select="/NewsList/RegionText">
									</xsl:value-of>
								</th>
								<th>
									<xsl:value-of disable-output-escaping="yes" select="/NewsList/StartDateText">
									</xsl:value-of>
								</th>
								<th>
									<xsl:value-of disable-output-escaping="yes" select="/NewsList/EndDateText">
									</xsl:value-of>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="News">
		<tr>
			<td class="text">
				<a style="text-decoration: none;color:#333333;transition: .25s cubic-bezier(.4,0,.2,1)">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</a>
				<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
				<xsl:if test="floor(ShowOption div 1) mod 2 = 1">
					<span class="hot">Hot</span>
				</xsl:if>
			</td>
			<td class="text">
				<xsl:value-of disable-output-escaping="yes" select="SubTitle"></xsl:value-of>
			</td>
			<td class="text">
				<xsl:value-of disable-output-escaping="yes" select="BriefContent"></xsl:value-of>
			</td>
			<td class="text">
				<xsl:value-of disable-output-escaping="yes" select="CreatedDate"></xsl:value-of>
			</td>
			<td class="text">
				<xsl:value-of disable-output-escaping="yes" select="EndDate"></xsl:value-of>
			</td>
			<!-- <td class="link">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of disable-output-escaping="yes" select="/NewsList/ApplyText"></xsl:value-of>
				</a>
			</td> -->
		</tr>
	</xsl:template>
</xsl:stylesheet>