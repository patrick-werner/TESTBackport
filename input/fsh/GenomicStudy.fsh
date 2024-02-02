Extension:   GenomicStudyReasonExtension
Id:          genomic-study-reason-extension
Title:       "GenomicStudy Reason Extension"
Description: "GenomicStudy Reason Extension - Needed some CodeableReference does not exist in R4"
* extension contains reason 0..1 // simulate CodeableReference as best we can for now
* extension[reason]
  * ^short = "GenomicStudy.reason"
  * value[x] only CodeableConcept or Reference(Condition or Observation)

// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: GenomicStudyBackportTest
Parent: Basic
Description: "Genomic Study profile based on Basic, trying out R5 extensions from GenomicStudy resource"
* identifier ^short = "GenomicStudy.identifier"
* code = #GenomicStudy
* subject ^short = "GenomicStudy.subject"
* subject only Reference(Patient or Group or Substance or BiologicallyDerivedProduct)
* created ^short = "GenomicStudy.startDate"
* modifierExtension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.status named status 1..1
* extension contains
    http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.type named type 0..*
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.subject named subject 0..*
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.encounter named encounter 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.startDate named startDate 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.basedOn named basedOn 0..*
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.referrer named referrer 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.interpreter named interpreter 0..*
// and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.reason named reason 0..*
and GenomicStudyReasonExtension named reason 0..*
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.instantiatesCanonical named instantiatesCanonical 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.instantiatesUri named instantiatesUri 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.note named note 0..*
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.description named description 0..1
and http://hl7.org/fhir/5.0/StructureDefinition/extension-GenomicStudy.analysis named analysis 0..*
* extension[analysis] ^short = "GenomicStudy.analysis"
  * extension[title] ^short = "GenomicStudy.analysis.title"
  // doing something to profile a subelement triggers the Snapshot Table to show ALL elements of 'analysis' .., without this, snapshot table does not display any of them
  // this worked, so do MS -- seems like we have to profile something for snapshot table to work
  // however, if we don't do this, the elements are still defined (the example below still works) -- this is just about triggering snapshot table to work as we expect


Instance: GenomicStudyBackportTestInstance
InstanceOf: GenomicStudyBackportTest
Description: "Example of GenomicStudyBackportTest"
Usage: #example
* modifierExtension[status].valueCode = #available
* extension[description].valueMarkdown = "Here is a great description in *markdown*"
* extension[analysis][+]
  * extension[methodType].valueCodeableConcept = http://hl7.org/fhir/ValueSet/genomicstudy-methodtype#mutation-scanning-of-the-entire-coding-region
  * extension[title].valueString = "Exome sequencing"
  * extension[output]
    * extension[type].valueCodeableConcept = http://hl7.org/fhir/ValueSet/genomicstudy-dataformat#vcf
    * extension[file].valueReference = Reference(genomicVCFfile-cnv)
* extension[analysis][+]
  * extension[title].valueString = "Some kind of analysis on a VCF"
  * extension[input]
    * extension[type].valueCodeableConcept = http://hl7.org/fhir/ValueSet/genomicstudy-dataformat#vcf
    * extension[file].valueReference = Reference(genomicVCFfile-cnv)
// generates an error   * extension[generatedBy].valueReference = Reference(GenomicStudyBackportTestInstance)
  * extension[output]
    * extension[type].valueCodeableConcept = http://hl7.org/fhir/ValueSet/genomicstudy-dataformat#vcf
    * extension[file].valueReference = Reference(genomicVCFfile-annotated)

Instance: genomicVCFfile-cnv
InstanceOf: DocumentReference
Description: "genomicVCFfile_cnv: A sample Document Reference instance representing a VCF file that may be used as input or output of a genomic analysis pipeline."
Usage: #example
* identifier.system = "http://www.somesystemabc.net/identifiers/files"
* identifier.value = "11121"
* status = #current
* docStatus = #preliminary
* description = "genomicVCFfile_cnv: A sample Document Reference instance representing a VCF file that may be used as input or output of a genomic analysis pipeline."
* content.attachment.url = "https://chat.fhir.org/user_uploads/10155/dxn3s6R1Y-Cv0h-1bTCu-JvY/genomicVCFFile_cnv.vcf"
* content.attachment.title = "genomicVCFfile_cnv"
* content.attachment.creation = "2019-03-01T01:02:01+01:00"

Instance: genomicVCFfile-annotated
InstanceOf: DocumentReference
Description: "genomicVCFfile-annotated"
Usage: #example
* identifier.system = "http://www.somesystemabc.net/identifiers/files"
* identifier.value = "11135"
* status = #current
* docStatus = #preliminary
* description = "Additional annotations applied to a VCF"
* content.attachment.url = "https://chat.fhir.org/user_uploads/10155/dxn3s6R1Y-Cv0h-1bTCu-JvY/genomicVCFFile_cnv.vcf"
* content.attachment.title = "genomicVCFfile-annotated"
* content.attachment.creation = "2019-03-01T12:02:01+01:00"
