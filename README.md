
Example Nextflow workflow via git / slurm 
== 

How to run
==

   - create workflow in github.com

   - pull workflow :

     nextflow pull tweep/nextflow-wf-example  
     nextflow run  tweep/nextflow-wf-example  --inputDir /tmp/data --outputDir results -profile slurm -resume 

tweep/nextflow-wf-example has finished.
Status:   SUCCESS
Time:     Sun Aug 25 23:35:49 CEST 2019
Duration: 2m



  - Nextflow runs the workflow
  - afer successful run we got this :




    report.html  results  timeline.html

