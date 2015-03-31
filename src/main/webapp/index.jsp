<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>ReDeFer XSD2OWL - XML Schema to OWL Web Ontology</title>
  <link href="style/rhizomik.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div id="logo"><a href="http://rhizomik.net"><img src="images/rhizomik-eye-100px.png"/></a></div>
<h1>ReDeFer XSD2OWL - XML Schema to OWL Web Ontology</h1>
<form accept-charset="UTF-8" action="xsd2owl" name="xsd2owl" method="post" target="_blank" >
    <p>Input XML for an XML Schema or URI pointing to one (e.g. http://dbpedia.org/resource/Semantic_Web):</p>
    <p><textarea cols="80" rows="10" name="rdf" id="rdf">&lt;schema targetNamespace=&quot;http://www.openarchives.org/OAI/2.0/oai_dc/&quot;
        xmlns:oai_dc=&quot;http://www.openarchives.org/OAI/2.0/oai_dc/&quot;
        xmlns:dc=&quot;http://purl.org/dc/elements/1.1/&quot;
        xmlns=&quot;http://www.w3.org/2001/XMLSchema&quot;
        elementFormDefault=&quot;qualified&quot; attributeFormDefault=&quot;unqualified&quot;&gt;
&lt;import namespace=&quot;http://purl.org/dc/elements/1.1/&quot;
        schemaLocation=&quot;http://dublincore.org/schemas/xmls/simpledc20021212.xsd&quot;/&gt;
&lt;element name=&quot;dc&quot; type=&quot;oai_dc:oai_dcType&quot;/&gt;
&lt;complexType name=&quot;oai_dcType&quot;&gt;
  &lt;choice minOccurs=&quot;0&quot; maxOccurs=&quot;unbounded&quot;&gt;
    &lt;element ref=&quot;dc:title&quot;/&gt;
    &lt;element ref=&quot;dc:creator&quot;/&gt;
    &lt;element ref=&quot;dc:subject&quot;/&gt;
    &lt;element ref=&quot;dc:description&quot;/&gt;
    &lt;element ref=&quot;dc:publisher&quot;/&gt;
    &lt;element ref=&quot;dc:contributor&quot;/&gt;
    &lt;element ref=&quot;dc:date&quot;/&gt;
    &lt;element ref=&quot;dc:type&quot;/&gt;
    &lt;element ref=&quot;dc:format&quot;/&gt;
    &lt;element ref=&quot;dc:identifier&quot;/&gt;
    &lt;element ref=&quot;dc:source&quot;/&gt;
    &lt;element ref=&quot;dc:language&quot;/&gt;
    &lt;element ref=&quot;dc:relation&quot;/&gt;
    &lt;element ref=&quot;dc:coverage&quot;/&gt;
    &lt;element ref=&quot;dc:rights&quot;/&gt;
  &lt;/choice&gt;
&lt;/complexType&gt;
&lt;/schema&gt;</textarea></p>
    <p>Action:</p>
    <p><select id="action" name="action">
      <option value="rdf2html">Generate HTML</option>
      <option value="rdf2htmlrdfa" selected="selected">Generate HTML with embedded RDFa</option>
      <option value="rdf2rdfa">Generate just RDFa, without visible HTML</option>
      <option value="rdf2microdata">Generate just Microdata, without visible HTML</option>
    </select></p>
    <p>Mode:</p>
    <p><select id="mode" name="mode">
      <option value="html" selected="selected">HTML page (with header, body and CSS applied)</option>
      <option value="snippet">Snippet (no HTML header, body and no styling)</option>
    </select></p>
    <p>Show namespaces:</p>
    <p><select id="namespaces" name="namespaces">
      <option value="false" selected="selected">Don't show, use labels for preferred language or local-names</option>
      <option value="true">Show namespaces, using CURIEs</option>
    </select></p>
    <p>Language (en, es, de, fr,...):</p>
    <p><input type="text" value="en" id="language" name="language" /> (Filters preferred language if defined in input RDF using xml:lang)</p>
    <!-- p>Input format:</p>
    <p><select name="lang" id="lang">
		<option selected="selected" value="RDF/XML">RDF/XML</option>
		<option value="N-TRIPLE">N-Triples</option>
		<option value="N3">N3</option>
	</select></p -->
    <input type="submit" name="Submit" value="Submit" />
</form>
<h1>RDF to HTML+RDFa Bookmarklet</h1>
<p>Bored about facing RDF/XML in your browser? Drag and drop this bookmarklet link <a href="javascript:self.location='<%=request.getRequestURL()%>rdf2html?namespaces=true&amp;rdf='+encodeURIComponent(window.location.href);">RDF2HTMLBookmarklet</a> to your Bookmarks Bar. Then, when you face a web page full of RDF/XML, click the bookmarklet and enjoy a more pleasant view.</p>
<h1>RDF to HTML+RDFa API</h1>
<p>The base address of the service is: <b><%=request.getRequestURL()%>rdf2html</b></p>
<p>It can called using <b>GET</b> or <b>POST</b>. The former is recommended when the RDF to be transformed is available from a URI, the latter when direct input is provided.</p>
<p>The parameters of the service are:</p>
<ul>
    <li><b>rdf=URI|RDF/XML</b>: the RDF/XML to be processed or a URI (content negotiated) where it can be retrieved from.</li>
    <li><b>mode=html|snippet</b>: defines if the output is a full XHTML page or just a snippet for inclusion in other web pages (default &quot;html&quot;).</li>
    <li><b>namespaces=true|false</b>: defines if the rendered output should show information about properties and resources namespaces or not (default &quot;false&quot;).</li>
    <li><b>language=en|es|fr...</b>: filter literals and labels based on the preferred language (default &quot;en&quot;).</li>
</ul>
<p>Example using GET:</p>
<p><a target="_blank" href="<%=request.getRequestURL()%>rdf2html?rdf=http://dbpedia.org/resource/RDFa&amp;mode=html&amp;namespaces=true&amp;language=en"><b><%=request.getRequestURL()%>rdf2html</b>?<b>rdf</b>=http://dbpedia.org/resource/RDFa&amp;<b>mode</b>=html&amp;<b>namespaces</b>=true&amp;<b>language</b>=en</a></p>
<h1>Use Cases</h1>
<p><a href="http://sindice.com/main/about" target="_blank"><img width="173" height="58" src="http://sindice.com/images/logo.png" alt="Sindice, the Semantic Web index" /></a></p>
<p><a href="http://www.ebusiness-unibw.org/tools/rdf2rdfa/" target="_blank"><img width="173" height="40" src="http://www.ebusiness-unibw.org/tools/rdf2rdfa/images/logo_ebusiness-research-group.gif" alt="E-Business + Web Science Research Group" /></a></p>