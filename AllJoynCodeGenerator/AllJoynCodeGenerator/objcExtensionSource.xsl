<!--
////////////////////////////////////////////////////////////////////////////////
// Copyright 2012, Qualcomm Innovation Center, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////
-->
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

<xsl:param name="fileName"/>
<xsl:param name="baseFileName"/>

<xsl:template match="/">////////////////////////////////////////////////////////////////////////////////
//
//  ALLJOYN MODELING TOOL - GENERATED CODE
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  <xsl:value-of select="$baseFileName"/>.m
//
////////////////////////////////////////////////////////////////////////////////

#import "<xsl:value-of select="$baseFileName"/>.h"

<xsl:apply-templates select=".//node" mode="objc"/>
    
</xsl:template>

<xsl:template match="node" mode="objc">////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Bus Object implementation for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
//
////////////////////////////////////////////////////////////////////////////////

@implementation <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
<xsl:text>&#13;&#10;</xsl:text>
<xsl:apply-templates select="./interface/method" mode="objc-method-definition"/>

@end

////////////////////////////////////////////////////////////////////////////////
</xsl:template>

<xsl:template match="property" mode="objc-property-dynamic">
    <xsl:text>@dynamic </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#13;&#10;</xsl:text>
</xsl:template>

<xsl:template match="property" mode="objc-property-synthesize">
    <xsl:text>@synthesize </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text> = _</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#13;&#10;</xsl:text>
</xsl:template>

<xsl:template match="method" mode="objc-method-definition">
    <xsl:text>&#13;&#10;</xsl:text>
    <xsl:apply-templates select="." mode="objc-declaration"/>
{
    // TODO: complete the implementation of this method
    //
     @throw([NSException exceptionWithName:@"NotImplementedException" reason:@"You must implement this method" userInfo:nil]);   
}
</xsl:template>

<xsl:template match="method" mode="objc-declaration">
    <xsl:text>- (</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg[@direction='out']) > 1 or count(./arg[@direction='out']) = 0">
            <xsl:text>void</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-argType"/>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg) = 0 or (count(./arg) = 1 and count(./arg[@direction='out']) = 1)">
            <xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>
        </xsl:when>
        <xsl:when test="count(./arg[@direction='out']) > 1">
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:if test="count(./arg[@direction='in']) > 1">
                <xsl:text>&#32;</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-messageParam"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-messageParam">
    <xsl:if test="position() > 1">
        <xsl:text>&#32;</xsl:text>
    </xsl:if>
    <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value" />
    <xsl:text>(</xsl:text>
        <xsl:apply-templates select="." mode="objc-argType"/>
        <xsl:if test="@direction='out'">
            <xsl:text>*</xsl:text>
        </xsl:if>
    <xsl:text>)</xsl:text>
    <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="arg" mode="objc-argType">
    <xsl:call-template name="objcArgType"/>
</xsl:template>

<xsl:template name="objcArgType">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>BOOL</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>NSString*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>NString*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='a'">
            <xsl:text>NSArray*</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>AJNMessageArgument*</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="capitalizeFirstLetterOfNameAttr">  
   <xsl:variable name="value">  
        <xsl:value-of select="@name"/>  
   </xsl:variable>  
    <xsl:variable name= "ufirstChar" select="translate(substring($value,1,1),$vLower,$vUpper)"/>  
    <xsl:value-of select="concat($ufirstChar,substring($value,2))"/>
</xsl:template>

<xsl:template name="uncapitalizeFirstLetterOfNameAttr">  
   <xsl:variable name="value">  
        <xsl:value-of select="@name"/>  
   </xsl:variable>  
    <xsl:variable name= "lfirstChar" select="translate(substring($value,1,1),$vUpper,$vLower)"/>  
    <xsl:value-of select="concat($lfirstChar,substring($value,2))"/>
</xsl:template>

</xsl:stylesheet>