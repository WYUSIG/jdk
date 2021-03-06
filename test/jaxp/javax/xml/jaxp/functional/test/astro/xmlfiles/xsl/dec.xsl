<xsl:transform
  xmlns:astro="http://www.astro.com/astro"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml"/>
	
	<!-- dec between 00:00:00 and 01:00:00 --> 
	<xsl:param name="dec_min_deg" select="0.0"/>
	<xsl:param name="dec_max_deg" select="1.0"/>
	
	<xsl:template match="astro:stardb">
	   <stardb xmlns="http://www.astro.com/astro"
	      xsi:schemaLocation="http://www.astro.com/astro catalog.xsd"
	      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	          <xsl:apply-templates/>
	   </stardb>
	</xsl:template>
	
	<xsl:template match="astro:star">
	   <xsl:if test="(
	                  (number(astro:dec/astro:dv) &gt;= $dec_min_deg) and
	                  (number(astro:dec/astro:dv) &lt;= $dec_max_deg))" >
	          <xsl:copy-of select="."/>
	   </xsl:if>
	</xsl:template>
	
	<xsl:template match="astro:_test-04">
	    <!-- discard text contents -->
	</xsl:template>

</xsl:transform>

