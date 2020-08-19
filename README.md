
Example Nextflow workflow via git / slurm 
== 

Prerequisites: 
 - workflow hosted on github 


How to run the workflow
==

1)  create workflow in github.com
     - requires to have a .nf file + nextflow.config file in root dir

2) pull workflow + revision
      ```
        nextflow pull tweep/nextflow-wf-example  -r feature/v0.0.1

3) get help message 
      ```
        nextflow run tweep/nextflow-wf-example --help

4) Run workflow 
    ```
       nextflow run  tweep/nextflow-wf-example  --inputDir /tmp/data --outputDir results --string "hello text to cuppercase" -profile slurm -resume 


