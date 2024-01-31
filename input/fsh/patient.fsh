// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: GenomicStudyBackportTest
Parent: Basic
Description: "An example profile of the Patient resource."
* code = #GenomicStudy
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.subject named subject 1..1

