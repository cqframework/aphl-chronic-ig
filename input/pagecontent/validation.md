### The HL7 FHIR Validator

The [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) is a command-line Java tool that checks FHIR resources and bundles for conformance against a given set of Implementation Guides. It can validate individual JSON or XML files against profiles defined in this IG and its dependencies, reporting errors, warnings, and informational messages.

To learn more about the validator and download the latest version, see the official documentation:
[https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)

---

### Dependencies

When validating against this IG, the following packages must be included so the validator can resolve all referenced profiles, value sets, and code systems.

| Package ID | Version | Description |
|---|---|---|
| `hl7.fhir.us.chronic-ds` | current | This IG (APHL Chronic Disease Surveillance) |
| `hl7.fhir.r4.core` | 4.0.1 | FHIR R4 Core |
| `hl7.fhir.uv.cpg` | 1.0.0 | HL7 FHIR® Clinical Practice Guidelines (CPG) |
| `hl7.fhir.us.core` | 3.1.0 | US Core |
| `hl7.fhir.us.qicore` | 4.0.0 | QI-Core |
| `hl7.fhir.us.cqfmeasures` | 2.0.0 | Quality Measures (CQF Measures) |
| `hl7.fhir.us.davinci-deqm` | 2.0.0 | Da Vinci Data Exchange for Quality Measures (DEQM) |
| `hl7.fhir.us.ecr` | 1.1.0 | HL7 FHIR® Electronic Case Reporting (eCR) |

> **Note:** Transitive dependencies of the above packages will be resolved automatically by the validator from the FHIR package registry.

---

### Validating a File

The validator is a Java JAR file that can be run from the command line. The general pattern for validating a FHIR resource against this IG is:

```bash
java -jar validator_cli.jar <file-to-validate> \
  -version 4.0.1 \
  -ig hl7.fhir.us.chronic-ds#0.1.0 \
  -profile <profile-url>
```

#### Example: Validating a Bundle

The following command validates a file called `my-bundle.json` against the APHL Chronic Disease Surveillance IG:

```bash
java -jar validator_cli.jar my-bundle.json \
  -version 4.0.1 \
  -ig hl7.fhir.us.chronic-ds#0.1.0 \
  -profile http://hl7.org/fhir/us/ecr/StructureDefinition/eicr-measurereport-bundle
```

Replace `<ProfileName>` with the specific profile you want to validate against (e.g., a profile defined in this IG). If you want to validate against all applicable profiles declared in the resource's `meta.profile`, you can omit the `-profile` flag and the validator will use the profiles asserted in the resource itself.

The validator will automatically download required packages from the FHIR package registry. If you are working in an offline or restricted environment, pre-download the packages and provide them via the `-ig` flag using local paths.

For a full list of validator options, run:

```bash
java -jar validator_cli.jar --help
```

---

### Known Validation Issues

The following are known validation issues or expected failures that implementers may encounter when validating against this IG. These are documented here to help distinguish known/expected results from genuine conformance problems.

- *(None documented yet — add known issues here as bullet points.)*
