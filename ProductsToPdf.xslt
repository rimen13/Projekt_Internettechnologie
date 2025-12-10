<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:p="http://www.electronics.com/products">

	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">

		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4"
                                   page-height="29.7cm"
                                   page-width="21cm"
                                   margin="1.5cm">
                <fo:region-body margin="1cm"/>
            </fo:simple-page-master>
			</fo:layout-master-set>
		
			<fo:page-sequence master-reference="A4">
	            <fo:flow flow-name="xsl-region-body">
	                <xsl:apply-templates select="p:products"/>
	            </fo:flow>
	        </fo:page-sequence>
	        
		</fo:root>
	</xsl:template>
	
	
	<xsl:template match="p:products">
		
<fo:block font-size="14pt" font-weight="bold" space-after="6pt">
	   		Resistors
		</fo:block>
		
		<fo:table table-layout="fixed" width="100%" border-collapse="collapse">
		    <fo:table-header>
		        <fo:table-row>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>ID</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		            	<fo:block>Resistance</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Tolerance</fo:block>
		            </fo:table-cell>    
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Amount</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Price</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Manufacturer</fo:block>
		            </fo:table-cell>
		        </fo:table-row>
		    </fo:table-header>
		
		    <fo:table-body>
		        <xsl:apply-templates select="p:product[@type='resistor']"/>
		    </fo:table-body>
		</fo:table>
		
		
		
<fo:block font-size="14pt" font-weight="bold" space-after="6pt">
	   		Inductors
		</fo:block>
		
		<fo:table table-layout="fixed" width="100%" border-collapse="collapse">
		    <fo:table-header>
		        <fo:table-row>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>ID</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		            	<fo:block>Inductance</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Tolerance</fo:block>
		            </fo:table-cell>    
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Amount</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Price</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Manufacturer</fo:block>
		            </fo:table-cell>
		        </fo:table-row>
		    </fo:table-header>
		
		    <fo:table-body>
		        <xsl:apply-templates select="p:product[@type='inductor']"/>
		    </fo:table-body>
		</fo:table>
		
		
		
<fo:block font-size="14pt" font-weight="bold" space-after="6pt">
	   		Capacitors
		</fo:block>
		
		<fo:table table-layout="fixed" width="100%" border-collapse="collapse">
		    <fo:table-header>
		        <fo:table-row>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>ID</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		            	<fo:block>Capacitance</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Tolerance</fo:block>
		            </fo:table-cell>    
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Amount</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Price</fo:block>
		            </fo:table-cell>
		            <fo:table-cell border="0.5pt solid black">
		                <fo:block>Manufacturer</fo:block>
		            </fo:table-cell>
		        </fo:table-row>
		    </fo:table-header>
		
		    <fo:table-body>
		        <xsl:apply-templates select="p:product[@type='capacitor']"/>
		    </fo:table-body>
		</fo:table>
	</xsl:template>

    <xsl:template match="p:product[@type='resistor'] | p:product[@type='inductor'] | p:product[@type='capacitor']">
	    <fo:table-row>
	
	        <fo:table-cell border="0.5pt solid black">
	            <fo:block>
	                <xsl:value-of select="@id"/>
	            </fo:block>
	        </fo:table-cell>
	
	        <fo:table-cell border="0.5pt solid black">
	            <fo:block>
	                <xsl:apply-templates select="*[1]"/>
	            </fo:block>
	        </fo:table-cell>
	
	        <fo:table-cell border="0.5pt solid black">
	            <fo:block>
	                <xsl:value-of select="p:amount"/>
	            </fo:block>
	        </fo:table-cell>
	
	        <fo:table-cell border="0.5pt solid black">
	            <fo:block>
	                <xsl:value-of select="p:price"/> €
	            </fo:block>
	        </fo:table-cell>
	
	        <fo:table-cell border="0.5pt solid black">
	            <fo:block>
	                <xsl:value-of select="p:manufacturer"/>
	            </fo:block>
	        </fo:table-cell>
	
	    </fo:table-row>
	</xsl:template>
	
	<!--xsl:template match="p:product[@type='diode']">
		<tr>
			<td><xsl:value-of select="@id"/></td>
			<td><xsl:value-of select="concat(translate(substring(@subtype,1,1),
                                 'abcdefghijklmnopqrstuvwxyz',
                                 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),
                       substring(@subtype,2))"/></td>
			<td><xsl:apply-templates select="p:forwardVoltage"/></td>
			<td><xsl:apply-templates select="p:reverseVoltage"/></td>
			<td><xsl:value-of select="p:amount"/></td>
			<td><xsl:value-of select="p:price"/> &#8364;</td>
			<td><xsl:value-of select="p:manufacturer"/></td>
		</tr>
	</xsl:template-->

	<xsl:template match="p:product[@type='resistor']/p:resistance|p:product[@type='inductor']/p:inductance|p:product[@type='capacitor']/p:capacitance | 
	p:product[@type='diode']/p:forwardVoltage | p:product[@type='diode']/p:reverseVoltage">
			<xsl:value-of select="p:value"/>
			<xsl:apply-templates select="p:exponent"></xsl:apply-templates>
			<xsl:value-of select="p:unit"/>

		<td><xsl:value-of select="p:tolerance"/><xsl:text> </xsl:text><xsl:value-of select="p:tolerance/@unit"/></td>
	</xsl:template>

	<xsl:template match="p:exponent">
		<xsl:if test=". = -12"> p</xsl:if>
		<xsl:if test=". = -9"> n</xsl:if>
		<xsl:if test=". = -6"> &#181;</xsl:if>
		<xsl:if test=". = -3"> m</xsl:if>
		<xsl:if test=". = 0"> </xsl:if>
		<xsl:if test=". = 3"> k</xsl:if>
		<xsl:if test=". = 6"> k</xsl:if>
		<xsl:if test=". = 9"> M</xsl:if>
	</xsl:template>

</xsl:stylesheet>
