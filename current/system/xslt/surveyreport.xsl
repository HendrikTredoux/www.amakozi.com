<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" omit-xml-declaration="yes"/>
<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>
<xsl:template match="root">
	<html>
	<head><title>Survey Report</title></head>
	<body>
	<h2>Survey Report</h2>
	<table>
		<tbody>
			<tr>
				<th colspan="2" align="left">Project Information</th>
			</tr>
			<tr>
				<td>Client:</td><td><xsl:value-of select="client" /></td>
			</tr>
			<tr>
				<td>Project:</td><td><xsl:value-of select="project" /></td>
			</tr>
			<tr>
				<td>Reviewer:</td><td><xsl:value-of select="reviewer" /></td>
			</tr>
			<tr>
				<td>Consultant:</td><td><xsl:value-of select="consultant" /></td>
			</tr>	
			<tr>
				<td>Contract Period:</td><td><xsl:value-of select="contractperiod/start"/> to <xsl:value-of select="contractperiod/end"/></td>
			</tr>
			<xsl:apply-templates select="survey" />	
			<xsl:apply-templates select="comments" />	
		</tbody>
	</table>
	</body>
	</html>
</xsl:template>
<xsl:template match="survey">
	<tr>
		<td colspan="2" align="left"><xsl:value-of select="label" disable-output-escaping="yes" /><br />(Possible Answers: <xsl:apply-templates select="option" />)</td>
	</tr>
	<xsl:apply-templates select="item"/>
	<xsl:apply-templates select="comments"/>
</xsl:template>
<xsl:template match="item">
<tr>
	<td><xsl:value-of select="question"/>:</td>
	<td><xsl:value-of select="answer"/></td>
</tr>
</xsl:template>
<xsl:template match="option">
	&lt;<xsl:value-of select="@value"/>&gt;
</xsl:template>
<xsl:template match="comments">
	<xsl:if test="@show='true'">
		<tr>
			<td colspan="2" align="left"><b><xsl:value-of select="label" disable-output-escaping="yes" /></b></td>
		</tr>
		<tr>
			<td><xsl:value-of select="answer"/></td>
		</tr>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>
