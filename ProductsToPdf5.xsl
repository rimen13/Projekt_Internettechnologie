<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:p="http://www.electronics.com/products">

    <xsl:output method="xml" indent="yes"/>

    <!-- ROOT TEMPLATE -->
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                    page-height="29.7cm"
                    page-width="21cm"
                    margin="1.5cm"
                    font-family="DejaVu Sans"
                    font-size="12pt">
                    <fo:region-body margin="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="18pt" font-weight="bold" space-after="0.5cm">
                        Welcome on the product page
                    </fo:block>

                    <fo:block font-size="14pt" font-weight="bold" space-before="0.5cm" space-after="0.3cm">
                        You can find our products here:
                    </fo:block>

                    <xsl:apply-templates select="p:products"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- PRODUCTS TEMPLATE -->
    <xsl:template match="p:products">
        <!-- RESISTORS -->
        <fo:block font-size="14pt" font-weight="bold" space-after="6pt">Resistors</fo:block>
        <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="0.5pt solid black"><fo:block>ID</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Resistance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Tolerance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Amount</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Price</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Manufacturer</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="p:product[@type='resistor']"/>
            </fo:table-body>
        </fo:table>
        <fo:block space-after="0.7cm"/>

        <!-- INDUCTORS -->
        <fo:block font-size="14pt" font-weight="bold" space-after="6pt">Inductors</fo:block>
        <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="0.5pt solid black"><fo:block>ID</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Inductance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Tolerance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Amount</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Price</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Manufacturer</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="p:product[@type='inductor']"/>
            </fo:table-body>
        </fo:table>
        <fo:block space-after="0.7cm"/>

        <!-- CAPACITORS -->
        <fo:block font-size="14pt" font-weight="bold" space-after="6pt">Capacitors</fo:block>
        <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="0.5pt solid black"><fo:block>ID</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Capacitance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Tolerance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Amount</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Price</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Manufacturer</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="p:product[@type='capacitor']"/>
            </fo:table-body>
        </fo:table>
        <fo:block space-after="0.7cm"/>

        <!-- DIODES -->
        <fo:block font-size="14pt" font-weight="bold" space-after="6pt">Diodes</fo:block>
        <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
            <fo:table-column column-width="8%"/>
            <fo:table-column column-width="11%"/>
            <fo:table-column column-width="10%"/>
            <fo:table-column column-width="12%"/>
            <fo:table-column column-width="10%"/>
            <fo:table-column column-width="12%"/>
            <fo:table-column column-width="11%"/>
            <fo:table-column column-width="9%"/>
            <fo:table-column column-width="17%"/>
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell border="0.5pt solid black"><fo:block>ID</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Subtype</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Forward Voltage</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Forward Tolerance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Reverse Voltage</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Reverse Tolerance</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Amount</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Price</fo:block></fo:table-cell>
                    <fo:table-cell border="0.5pt solid black"><fo:block>Manufacturer</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="p:product[@type='diode']"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <!-- RESISTOR / INDUCTOR / CAPACITOR -->
    <xsl:template match="p:product[@type='resistor'] | p:product[@type='inductor'] | p:product[@type='capacitor']">
        <fo:table-row>
            <fo:table-cell border="0.5pt solid black">
                <fo:block><xsl:value-of select="@id"/></fo:block>
            </fo:table-cell>
            <fo:table-cell border="0.5pt solid black">
                <fo:block>
                    <xsl:apply-templates select="*[1]"/>
                </fo:block>
            </fo:table-cell>
            
            <fo:table-cell border="0.5pt solid black">
                <fo:block>
                	<xsl:variable name="spec" select="(p:resistance|resistance|p:inductance|inductance|p:capacitance|capacitance)[1]"/>
                    <xsl:choose>
                        <xsl:when test="$spec/*[local-name() = 'tolerance' or name() = 'p:tolerance']">
                            <!-- tolerate both text-in-element or element-with-text -->
                            <xsl:value-of select="$spec/*[local-name()='tolerance' or local-name()='tolerance']/text()"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="$spec/*[local-name()='tolerance' or local-name()='tolerance']/@unit"/>
                        </xsl:when>
                        <xsl:otherwise>-</xsl:otherwise>
                    </xsl:choose>
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

    <!-- DIODE -->
    <xsl:template match="p:product[@type='diode']">
        <fo:table-row>
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="@id"/></fo:block></fo:table-cell>
            <fo:table-cell border="0.5pt solid black">
                <fo:block>
                    <xsl:value-of select="concat(translate(substring(@subtype,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(@subtype,2))"/>
                </fo:block>
            </fo:table-cell>
            <!-- Forward Voltage -->
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:apply-templates select="p:forwardVoltage"/></fo:block></fo:table-cell>
            <fo:table-cell border="0.5pt solid black">
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="p:forwardVoltage/p:tolerance">
                            <xsl:value-of select="p:forwardVoltage/p:tolerance"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="p:forwardVoltage/p:tolerance/@unit"/>
                        </xsl:when>
                        <xsl:otherwise>-</xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <!-- Reverse Voltage -->
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:apply-templates select="p:reverseVoltage"/></fo:block></fo:table-cell>
            <fo:table-cell border="0.5pt solid black">
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="p:reverseVoltage/p:tolerance">
                            <xsl:value-of select="p:reverseVoltage/p:tolerance"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="p:reverseVoltage/p:tolerance/@unit"/>
                        </xsl:when>
                        <xsl:otherwise>-</xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="p:amount"/></fo:block></fo:table-cell>
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="p:price"/> €</fo:block></fo:table-cell>
            <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="p:manufacturer"/></fo:block></fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <!-- VALUE + UNIT -->
    <xsl:template match="p:product[@type='resistor']/p:resistance |
                           p:product[@type='inductor']/p:inductance |
                           p:product[@type='capacitor']/p:capacitance |
                           p:product[@type='diode']/p:forwardVoltage |
                           p:product[@type='diode']/p:reverseVoltage">
        <fo:inline>
            <xsl:value-of select="p:value"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="p:exponent"/>
            <fo:inline width="0.2em"/>
            <fo:block>
			    <xsl:choose>
			      <xsl:when test="*[1]/p:tolerance">
			        <xsl:value-of select="*[1]/p:tolerance/p:value"/>
			        <xsl:text> </xsl:text>
			        <xsl:value-of select="*[1]/p:tolerance/p:unit"/>
			      </xsl:when>
			      <xsl:otherwise></xsl:otherwise>
			    </xsl:choose>
			 </fo:block>
        </fo:inline>
    </xsl:template>

    <!-- EXPONENT -->
    <xsl:template match="p:exponent">
        <xsl:if test=". = -12">p</xsl:if>
        <xsl:if test=". = -9">n</xsl:if>
        <xsl:if test=". = -6">&#181;</xsl:if>
        <xsl:if test=". = -3">m</xsl:if>
        <xsl:if test=". = 0"> </xsl:if>
        <xsl:if test=". = 3">k</xsl:if>
        <xsl:if test=". = 6">k</xsl:if>
        <xsl:if test=". = 9">M</xsl:if>
    </xsl:template>

</xsl:stylesheet>
