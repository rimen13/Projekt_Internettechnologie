<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:p="http://www.electronics.com/products">

	<xsl:output method="html" encoding="UTF-8" />
	
	<xsl:template match="/">
        <html>
            <head>
            	<title>Product page</title>
            </head>
            <body>
                <h1>Welcome on the product page</h1>
                <p>You can find our products here:</p>
                <xsl:apply-templates select="p:products"/>
            </body>
        </html>
    </xsl:template>

	<xsl:template match="p:products">
		<details>
			<summary>Resistors</summary>
			<table border="1">
                <tr>
                    <th>ID</th>
                    <th>Resistance</th>
                    <th>Tolerance</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Manufacturer</th>
                </tr>
                <xsl:apply-templates select="p:product[@type='resistor']"/>
            </table>
            <br/>
		</details>
		<details>
			<summary>Inductors</summary>
			<table border="1">
                <tr>
                    <th>ID</th>
                    <th>Inductance</th>
                    <th>Tolerance</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Manufacturer</th>
                </tr>
                <xsl:apply-templates select="p:product[@type='inductor']"/>
            </table>
            <br/>
		</details>
		
		<details>
			<summary>Capacitors</summary>
			<table border="1">
                <tr>
                    <th>ID</th>
                    <th>Capacitance</th>
                    <th>Tolerance</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Manufacturer</th>
                </tr>
                <xsl:apply-templates select="p:product[@type='capacitor']"/>
            </table>
            <br/>
		</details>
		<details>
			<summary>Diodes</summary>
			<table border="1">
                <tr>
                    <th>ID</th>
                    <th>Subtype</th>
                    <th>Forward Voltage</th>
                    <th>Tolerance</th>
                    <th>Reverse Voltage</th>
                    <th>Tolerance</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Manufacturer</th>
                </tr>
                <xsl:apply-templates select="p:product[@type='diode']"/>
            </table>
            <br/>
		</details>
	</xsl:template>

	<xsl:template match="p:product[@type='resistor'] | p:product[@type='inductor'] | p:product[@type='capacitor']">
		<tr>
			<td><xsl:value-of select="@id"/></td>
			<td><xsl:apply-templates select="*[1]"/></td>
			<td><xsl:value-of select="p:amount"/></td>
			<td><xsl:value-of select="p:price"/> &#8364;</td>
			<td><xsl:value-of select="p:manufacturer"/></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="p:product[@type='diode']">
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
	</xsl:template>

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

