<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:variable name="projectpath"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-usx-variety-check\trunk'"/>
   <xsl:variable name="cd"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-usx-variety-check\trunk'"/>
   <xsl:variable name="pubpath"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\vimod-pub-solo-usx-variety-check\trunk\pub'"/>
   <xsl:variable name="true" select="tokenize('true yes on 1','\s+')"/>
   <xsl:variable name="comment1"
                 select="'# edit the usx export path to suit you machine'"/>
   <xsl:variable name="comment2">folder name fo usx collection           </xsl:variable>
   <xsl:param name="usxfolder" select="'GMTelSR'"/>
   <xsl:variable name="comment3">usx export path                         </xsl:variable>
   <xsl:param name="usxexportpath" select="'D:\usx\*.usx'"/>
   <xsl:variable name="comment4">usx project path                        </xsl:variable>
   <xsl:param name="usxpath" select="concat('D:\usx-collection\',$usxfolder)"/>
   <xsl:variable name="comment7" select="'# the following should not need editing'"/>
   <xsl:variable name="comment8">files for collection                    </xsl:variable>
   <xsl:param name="collectionfile" select="'*.usx'"/>
   <xsl:variable name="comment9">group node                              </xsl:variable>
   <xsl:param name="groupnodelist" select="'book chapter'"/>
   <xsl:variable name="comment10">book order                             </xsl:variable>
   <xsl:param name="bookorderfile"
              select="concat($pubpath,'\resources\book-chaps.txt')"/>
   <xsl:variable name="comment11"
                 select="'# remove elements                         ;var remove-element-content_list &#34;bookGroup note chapter figure&#34;'"/>
   <xsl:variable name="comment12"
                 select="'# remove elements                         ;var remove-element_list &#34;char&#34;'"/>
   <xsl:variable name="comment13"
                 select="'#                                         ;var del-ec-attrib-name &#34;style&#34;'"/>
   <xsl:variable name="comment15"
                 select="'#                                         ;var del-ec-attrib-value_list &#34;s s1 s2 s3 sp ms r mt mt1 mt2 mt3 restore d periph d bk&#34;'"/>
   <xsl:variable name="comment16"
                 select="'#                                         ;var del-e-attrib-name &#34;style&#34;'"/>
   <xsl:variable name="comment17" select="'# css'"/>
   <xsl:variable name="comment18"
                 select="'#                                         ;var conccss &#34;../css/conc1.css&#34;'"/>
   <xsl:variable name="comment19"
                 select="'#                                         ;var concfrontmattercss &#34;../css/concfront.css&#34;'"/>
   <xsl:variable name="comment20"
                 select="'#                                         ;var min-word-length 3'"/>
   <xsl:variable name="comment21"
                 select="'                                        ;projectxslt'"/>
</xsl:stylesheet>
