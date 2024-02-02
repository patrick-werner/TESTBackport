Profile: GenomicStudyBackportTest
Parent: Basic
Description: "Genomic Study profile based on Basic, trying out R5 extensions from GenomicStudy resource"
* code = #GenomicStudy
* modifierExtension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.status named status 1..1
* extension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.analysis named analysis 0..*
* extension[analysis] MS
  * extension[identifier] MS
