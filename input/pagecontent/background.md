### Overview

This document contains a proposed scenario and initial system design to demonstrate the capability to do chronic disease surveillance using HL7 FHIR and standards-based infrastructure that minimizes clinical implementation needs. It also aligns with and utilizes common Public Health electronic Case Reporting (eCR), MedMorph, and Clinical Quality Measure (CQM) reporting infrastructure as is feasible.

Although chronic disease surveillance, public health reporting, and clinical quality measurement and reporting have different drivers and use cases, many of the underlying technical enablers are the same. From the broadest perspective, all these activities provide reporting on clinical data across populations. Data for those populations is housed in multiple clinical systems, almost always with differing data representations. Using FHIR as an interoperability standard provides clear advantages for these activities, and significant progress has been made in both the public health reporting and clinical quality measurement spaces using FHIR. This proposal explores the extension of those FHIR capabilities into the chronic disease surveillance space, using an overall architecture that enables all these activities as part of a single technical approach, depicted in the following diagram:

{% include img.html img="overview.png" caption="Overview Diagram" %}

As this diagram illustrates, there are two primary interactions:

1. Reporting Specification
2. Data Submission

In the Reporting Specification interaction, the Clinical System accesses a Knowledge Repository to retrieve the latest version of a Reporting Specification. This can be disease specific, such as Chronic Diabetes Surveillance, or it can be a _program_, or collection of specifications describing a set of targets. Conceptually, the Reporting Specification provides a detailed description of _what_ data is to be reported, _when_, or _how often_ it should be reported, and _to whom_ it should reported.

In the Data Submission interaction, the Clinical System submits data based on the Reporting Specification to the Surveillance Repository. This process can happen at regularly scheduled intervals, or it can happen in response to triggering events occurring within the Electronic Health Record (EHR). Within the Clinical System, the Reporting Services component utilizes existing open source technology to implement the reporting specification and data submission interactions, coordinating with the Trust Services component to provide deidentification, anonymization, and hashing techniques for pseudonymization of the data being submitted.

The goal of this implementation guide is to illustrate how these interactions can be achieved through minimal extensions to existing open source technical infrastructure that is already being used to support public health reporting and quality reporting use cases. By virtue of implementing on this common FHIR-based infrastructure, the chronic disease surveillance can take advantgage of existing clinical implementations and plot out a broad surveillance opportunity that is not limited by extensive EHR integration needs.

For case-level reporting, the proposal will demonstrate the use of existing (or minimally modified) electronic Clinical Quality Measure (eCQM) specifications already in use for Clinical Quality Reporting to support chronic disease surveillance at the case level. For stratified reporting, the proposal will demonstrate augmenting the eCQM specification with information for stratifying based on disease-relevant factors such as age, gender, ethnicity, location, or other factors.
