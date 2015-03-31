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
    <p>Input XML for an XML Schema or URI pointing to one. Examples:</p>
    <ul>
      <li><a href="#" onclick="document.xsd2owl.xsd.value='http://www.openarchives.org/OAI/2.0/oai_dc.xsd'">http://www.openarchives.org/OAI/2.0/oai_dc.xsd</a></li>
      <li><a href="#" onclick="document.xsd2owl.xsd.value='http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd'">http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd</a></li>
    </ul>
    <p><input type="text" size="80" name="xsd" id="xsd"/></p>
    <input type="submit" name="Submit" value="Submit"/>
</form>
<h1>XSD to OWL API</h1>
<p>The base address of the service is: <b><%=request.getRequestURL()%>xsd2owl</b></p>
<p>It can called using <b>GET</b> or <b>POST</b>. The former is recommended when the RDF to be transformed is available from a URI, the latter when direct input is provided.</p>
<p>The parameter of the service is:</p>
<ul>
    <li><b>xsd= URI | XML</b>: the XML source of the XML Schema to be processed or a URL pointing to a XSD.</li>
</ul>
<p>Example using GET:</p>
<p><a target="_blank" href="<%=request.getRequestURL()%>xsd2owl?xsd=http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd"><b><%=request.getRequestURL()%>xsd2owl</b>?<b>xsd</b>=http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd</a></p>
<h1>How does it work?</h1>
<p>XSD2OWL is based on an XSLT (XML Style Sheet Transformation) that performs a partial mapping from XML Schema to OWL. It is an implementation of the &quot;<a href="http://rhizomik.net/html/~roberto/thesis/html/Methodology.html#XMLSemanticsReuse" target="_top">XML Semantics Reuse Methodology</a>&quot; proposed in the PhD Thesis &quot;<a href="http://rhizomik.net/~roberto/thesis" target="_top">A Semantic Web Approach to Digital Rights Management</a>&quot;. It can be tested from the <a style="font-weight: bold;" href="http://rhizomik.net/redefer">ReDeFer</a> web page.</p>
<p>The XML Schema to OWL mapping is responsible for capturing the schema implicit semantics. This semantics are determined by the combination of XML Schema constructs. The XSD2OWL mapping is based on translating this constructs to the OWL ones that best capture their semantics. These translations are shown in Table 1.</p>
<p style="text-align: center;"><a><strong>Table 1</strong></a><strong>.</strong> XSD2OWL translations for the XML Schema constructs and shared semantics with OWL constructs</p>
<table cellspacing="0" cellpadding="5" bordercolor="#000000" border="1" align="center">
  <tbody>
  <tr>
    <td>
      <p align="center"><strong>XML Schema</strong></p>
    </td>
    <td>
      <p align="center"><strong>OWL</strong></p>
    </td>
    <td>
      <p align="center"><strong>Shared informal semantics</strong></p>
    </td>
  </tr>
  <tr>
    <td>
      <p>element|attribute</p>
    </td>
    <td>
      <p>rdf: Property<br />
        owl: DatatypeProperty<br />
        owl: ObjectProperty</p>
    </td>
    <td>
      <p align="left">Named relation between nodes or nodes and values</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>element@substitutionGroup</p>
    </td>
    <td>
      <p>rdfs: subPropertyOf</p>
    </td>
    <td>
      <p align="left">Relation can appear in place of a more general one</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>element@type</p>
    </td>
    <td>
      <p>rdfs: range</p>
    </td>
    <td>
      <p align="left">The relation range kind</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>complexType|group<br />
        |attributeGroup</p>
    </td>
    <td>
      <p>owl: Class</p>
    </td>
    <td>
      <p align="left">Relations and contextual restrictions package</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>complexType//element</p>
    </td>
    <td>
      <p>owl: Restriction</p>
    </td>
    <td>
      <p align="left">Contextualised restriction of a relation</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>extension@base|<br />
        restriction@base</p>
    </td>
    <td>
      <p>rdfs: subClassOf</p>
    </td>
    <td>
      <p align="left">Package concretises the base package</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>@maxOccurs<br />
        @minOccurs</p>
    </td>
    <td>
      <p>owl: maxCardinality<br />
        owl: minCardinality</p>
    </td>
    <td>
      <p align="left">Restrict the number of occurrences of a relation</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>sequence<br />
        choice</p>
    </td>
    <td>
      <p>owl: intersectionOf<br />
        owl: unionOf</p>
    </td>
    <td>
      <p align="left">Combination of relations in a context</p>
    </td>
  </tr>
  </tbody>
</table>
<p>The XSD2OWL mapping is quite transparent and captures a great part XML Schema semantics. The same names used for XML constructs are used for OWL ones, although in the new namespace defined for the ontology. Therefore, it produces OWL ontologies that make explicit the semantics of the corresponding XML Schemas. The only caveats are the implicit order conveyed by <em>xsd: sequence</em> and the exclusivity of <em>xsd: choice</em>.</p>
<p>For the first problem, <em>owl: intersectionOf</em> does not retain its operands order, there is no clear solution that retains the great level of transparency that has been achieved. The use of RDF Lists might impose order but introduces ad-hoc constructs not present in the original metadata. Moreover, as it has been demonstrated in practise, the elements' ordering does not contribute much from a semantic point of view. For the second problem, <em>owl: unionOf</em> is an inclusive union, the solution is to use the disjointness OWL construct, <em>owl: disjointWith</em>, between all union operands in order to make it exclusive.</p>
<h2>Example</h2>
<p>The first figure presents a fragment of XMLSchema that defines a &quot;grant&quot; element as a <span style="font-style: italic;">xsd: choice</span>. The first choice is a <span style="font-style: italic;">xsd: sequence</span> of the &quot;principal&quot;, &quot;resource&quot;, &quot;right&quot; and &quot;condition&quot; elements. Only &quot;right&quot; is mandatory, i.e. it must occur at least once. The other choice is an &quot;encriptedGrant&quot; element. Moreover, the is the &quot;validityInterval&quot; element that is declared to be a substitutionGroup of the &quot;condition&quot; element, i.e. it can appear wherever the &quot;condition&quot; element can appear. The &quot;validityInterval&quot; element is defined as a <span style="font-style: italic;">xsd: sequence</span> of &quot;notBefore&quot; and &quot;notAfter&quot;, both non-mandatory.</p>
<p>The second figure shows the corresponding OWL mapping produced by the XSD2OWL XSL.</p>
<p><img width="402" height="262" src="images/XSD2OWLexample1.gif" alt="XSD Model" /> <img width="476" height="511" src="images/XSD2OWLexample2.gif" alt="OWL Model" /></p>