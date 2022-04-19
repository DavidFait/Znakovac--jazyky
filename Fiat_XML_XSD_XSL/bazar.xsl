<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>Autobazar</title>
            </head>
            <body>
            <h1>Nabídka našeho autobazaru</h1>

              <h2>Automobily podle ceny</h2>
                <table style="width:100%;" border="1">
                    <tr bgcolor="white"  style="color:#540000">
                        <th>Výrobce</th>
                        <th>Model</th>
                        <th>Palivo</th>
                        <th>Spotřeba paliva (xl/100km)</th>
                        <th>Cena</th>
                    </tr>
                    <xsl:for-each select="/bazar/automobil">
                        <xsl:sort select="cena"/>
                        <tr>
                            <td><xsl:value-of select="vyrobce"/></td>
                            <td><xsl:value-of select="model"/></td>
                            <td><xsl:value-of select="palivo"/></td>
                            <td><xsl:value-of select="spotreba_paliva"/></td>
                            <td><xsl:value-of select="cena"/></td>
                        </tr>
                    </xsl:for-each>
                </table>           

                <h3>Vozíky s užitou hmotností více než 630kg</h3>
                <table style="width:100%;" border="1">
                    <tr bgcolor="#ffd500">
                        <th>Značka</th>
                        <th>Typ</th>
                        <th>Užitečná hmotnost</th>
                        <th>Cena</th>
                    </tr>
                    <xsl:for-each select="/bazar/prives_za_automobil">
                        <xsl:if test= "uzitecna_hmotnost > 630">
                        <tr>
                            <td><xsl:value-of select="znacka"/></td>
                            <td><xsl:value-of select="typ"/></td>
                            <td><xsl:value-of select="uzitecna_hmotnost"/></td>
                            <td><xsl:value-of select="cena"/></td>
                        </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>

                <h3>Výkonná vozidla v naší nabídce (nad 100kW)</h3>
                <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Výrobce</th>
                    <th>Model vozu</th>
                </tr>
                <xsl:for-each select="bazar/automobil">
                <tr>
                    <td><xsl:value-of select="vyrobce"/></td>
                    <xsl:choose>
                    <xsl:when test="vykon_motoru&gt;'100'">
                        <td bgcolor="#ffd500">
                        <xsl:value-of select="model"/></td>   
                    </xsl:when>
                    <xsl:otherwise>
                    <td>
                        <xsl:value-of select="model"/></td>    
                    </xsl:otherwise>
                    </xsl:choose>
                </tr>
                </xsl:for-each>
                </table>
            </body>
         </html>
    </xsl:template>
</xsl:stylesheet>