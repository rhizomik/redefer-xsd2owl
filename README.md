# Introduction

The XML Schema (XSD) to OWL Web Ontology mapping service **XSD2OWL** generates an **OWL** ontology representation of the input **XSD**.

# Installation

To build the deployment **WAR** file using the source code and **Maven**:

    mvn clean package

# Use

When deployed in a local servlet container like Tomcat, the XSD2OWL service will be available at something like **http://localhost:8080/xsd2owl**

(The service is deployed at **rhizomik.net/redefer-services/xsd2owl** and it can be tested from [http://rhizomik.net/redefer/]())

It can called using **GET**. The parameter of the service is:

*   **rdf=URL**: an URL pointing to the XML source of the XML Schema to be processed.

Examples using GET and the XSD2OWL service deployed at **rhizomik.net/redefer-services/xsd2owl**:

*   **Map the W3C XML Digital Signature XML Schema** http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd:
    
    [http://rhizomik.net/redefer-services/xsd2owl?xsd=http://www.w3.org/TR/xmldsig-core/xmldsig-core-schema.xsd]()