<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     marker-inventory-by-book.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:template match="/*">
            <xsl:element name="results">
                  <xsl:attribute name="title">
                        <xsl:value-of select="*[1]/*/book"/>
                  </xsl:attribute>
                  <xsl:apply-templates select="*"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="usx">
            <xsl:element name="book">
                  <xsl:attribute name="name">
                        <xsl:value-of select="@book"/>
                  </xsl:attribute>
                  <xsl:for-each select="descendant::*/@style">
                        <xsl:element name="{f:nopunc(.)}"/>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:function name="f:nopunc">
            <xsl:param name="string"/>
            <xsl:value-of select="replace($string,'[;:\.,\?]','-punc')"/>
      </xsl:function>
</xsl:stylesheet>
