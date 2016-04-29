<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     markers-counted.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="html" version="5.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:variable name="style_list">
            <xsl:for-each-group select="/*/book/*" group-by="name()">
                  <xsl:sort select="name()"/>
                  <xsl:value-of select="name()"/>
                  <xsl:if test="position() ne last()">
                        <xsl:text>;</xsl:text>
                  </xsl:if>
            </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="style" select="tokenize($style_list,';')"/>
      <xsl:template match="/*">
            <xsl:element name="html">
                  <xsl:element name="head">
                        <title>
                              <xsl:value-of select="@title"/>
                        </title>
                        <meta charset='utf-8'/>
                        <style type="text/css">tr:nth-child(even) {background: #EEE}</style>
                  </xsl:element>
                  <xsl:element name="body">
                        <xsl:element name="table">
                              <xsl:attribute name="style">
                                    <xsl:text> text-align:right</xsl:text>
                              </xsl:attribute>
                              <xsl:element name="th">
                                    <xsl:for-each select="$style">
                                          <xsl:element name="td">
                                                <xsl:attribute name="style">
                                                      <xsl:text>width: 2.5em; font-weight:bold</xsl:text>
                                                </xsl:attribute>
                                                <xsl:value-of select="."/>
                                          </xsl:element>
                                    </xsl:for-each>
                              </xsl:element>
                              <xsl:apply-templates select="book" mode="table"/>
                        </xsl:element>
                        <xsl:element name="div">
                              <xsl:attribute name="style">
                                    <xsl:text>clear:left;margin-right: 2em; height:</xsl:text>
                                    <xsl:value-of select="count(//book) * 7.5"/>
                                    <xsl:text>mm</xsl:text>
                              </xsl:attribute>
                              <xsl:apply-templates select="*" mode="sum"/>
                        </xsl:element>
                        <xsl:apply-templates select="*"/>
                  </xsl:element>
            </xsl:element>
      </xsl:template>
      <xsl:template match="book" mode="sum">
            <xsl:element name="pre">
                  <!-- <xsl:attribute name="style">
                        <xsl:text>margin-right: 2em</xsl:text>
                  </xsl:attribute> -->
                  <xsl:element name="a">
                        <xsl:attribute name="href">
                              <xsl:text>#</xsl:text>
                              <xsl:value-of select="@name"/>
                        </xsl:attribute>
                        <xsl:value-of select="@name"/>
                  </xsl:element>
                  <xsl:for-each-group select="*" group-by="name()">
                        <xsl:sort/>
                        <xsl:text> </xsl:text>
                        <xsl:if test="position() = last()">
                              <xsl:value-of select="position()"/>
                        </xsl:if>
                  </xsl:for-each-group>
            </xsl:element>
      </xsl:template>
      <xsl:template match="book">
            <xsl:element name="div">
                  <xsl:attribute name="style">
                        <xsl:text>float:left; margin-right: 2em; height: 230mm</xsl:text>
                  </xsl:attribute>
                  <xsl:element name="h3">
                        <xsl:attribute name="id">
                              <xsl:value-of select="@name"/>
                        </xsl:attribute>
                        <xsl:element name="a">
                              <xsl:attribute name="href">
                                    <xsl:text>#TOP</xsl:text>
                              </xsl:attribute>
                              <xsl:value-of select="@name"/>
                        </xsl:element>
                  </xsl:element>
                  <xsl:element name="table">
                        <xsl:for-each-group select="*" group-by="name()">
                              <xsl:sort select="name()"/>
                              <xsl:element name="tr">
                                    <xsl:element name="td">
                                          <xsl:value-of select="name()"/>
                                    </xsl:element>
                                    <xsl:element name="td">
                                          <xsl:attribute name="style">
                                                <xsl:text>text-align:right</xsl:text>
                                          </xsl:attribute>
                                          <xsl:value-of select="count(current-group())"/>
                                    </xsl:element>
                              </xsl:element>
                              <xsl:if test="position() = last()">
                                    <xsl:element name="tr">
                                          <xsl:element name="td">
                                                <xsl:attribute name="style">
                                                      <xsl:text>font-weight:bold</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Markers used: </xsl:text>
                                          </xsl:element>
                                          <xsl:element name="td">
                                                <xsl:attribute name="style">
                                                      <xsl:text>text-align:right; font-weight:bold</xsl:text>
                                                </xsl:attribute>
                                                <xsl:value-of select="position()"/>
                                          </xsl:element>
                                    </xsl:element>
                              </xsl:if>
                        </xsl:for-each-group>
                  </xsl:element>
            </xsl:element>
      </xsl:template>
      <xsl:template match="book" mode="table">
            <xsl:variable name="book" select="@name"/>
            <xsl:variable name="nodes" select="*"/>
            <xsl:element name="tr">
                  <xsl:element name="td">
                        <xsl:attribute name="style">
                              <xsl:text>text-align:left</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="@name"/>
                  </xsl:element>
                  <xsl:call-template name="countnodes">
                        <xsl:with-param name="numb" select="1"/>
                  </xsl:call-template>
            </xsl:element>
      </xsl:template>
      <xsl:template name="countnodes">
            <xsl:param name="numb"/>
            <xsl:if test="$numb le count($style)">
                  <xsl:element name="td">
                        <xsl:if test="count(*[name() = $style[$numb]]) ne 0">
                              <xsl:value-of select="count(*[name() = $style[$numb]])"/>
                        </xsl:if>
                  </xsl:element>
                  <xsl:call-template name="countnodes">
                        <xsl:with-param name="numb" select="$numb + 1"/>
                  </xsl:call-template>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
