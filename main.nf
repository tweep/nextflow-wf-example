#!/usr/bin/env nextflow

/* 
    Some comments 
*/ 

def helpMessage() {
    log.info"""
    ================================================================
    nextflow-wf-example
    ================================================================
    DESCRIPTION
    Usage:
    
    Pull branch or tag v0.01 and print help message: 
    
          nextflow pull  tweep/nextflow-wf-example -r feature/v0.0.1

          nextflow run tweep/nextflow-wf-example --help   
    
    Run Workflow:
      mkdir run
      cd  run 
      nextflow pull  tweep/nextflow-wf-example
      nextflow clone tweep/nextflow-wf-example
      nextflow run   tweep/nextflow-wf-example  --inputDir /tmp/data --outputDir results --string "hello jan" --username vogelj4 -profile slurm
    
    Options:
        --inputDir            Input directory of fastq files.
        --outputDir           Output folder for salmon quantification files.
        --string              Text to uppercase in Worfklow (string)
        --username            user name (used for naming SLURM jobs) 

    Profiles:
        standard            local execution
        slurm               SLURM execution with singularity on ROSALIND
        aws                 SLURM execution with Docker on AWS
    Docker:
    N/A
    Author:
    Jan Vogel
    """.stripIndent()
}

params.help = false

if (params.help) {
    helpMessage()
    exit 0
}






log.info ""
log.info " Worfklow parameters "
log.info " ======================"
log.info " input directory          : ${params.inputDir}"
log.info " output directory         : ${params.outputDir}"
log.info " input string             : ${params.string}"
log.info " username                 : ${params.username}"
log.info " ======================"
log.info ""





params.string = 'Hello world!'

process splitLetters {
  label 'short_queue'

    output:
    file 'chunk_*' into letters

    """
    printf '${params.string}' | split -b 6 - chunk_
    """
}


process convertToUpper {
  label 'short_queue'

    input:
    file x from letters.flatten()

    output:
    stdout result

    """
    cat $x | tr '[a-z]' '[A-Z]'
    """
}

result.view { it.trim() } 




workflow.onComplete {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m'

    log.info "\tweep/wf has finished."
    log.info "Status:   " + (workflow.success ? "${GREEN}SUCCESS${NC}" : "${RED}ERROR${NC}")
    log.info "Time:     ${workflow.complete}"
    log.info "Duration: ${workflow.duration}\n" 
    log.info "Reports are in current working directory\n"
 
    println "Project : $workflow.projectDir"
    println "Git info: $workflow.repository - $workflow.revision [$workflow.commitId]"
    println "Cmd line: $workflow.commandLine"
    println "Manifest's pipeline version: $workflow.manifest.version" 
}


