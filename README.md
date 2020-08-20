
Example Nextflow workflow via git / slurm 
== 

Prerequisites: 
 - workflow hosted on github 


How to run the workflow
==

1)  create workflow in github.com
    At first, create a workflow in github; remember: a workflow requires to have a .nf file + nextflow.config file in root dir

2) *clone*  workflow + revision
Notes: 
  - we clone the workflow to write it to a specific directory. We do not want to *pull* the workflow, this would 
write the WF into our $HOME directory - let's not clutter that one up. 
  - the target directory ($HOME/runWF) has to be emtpy !

```  
   # target dir has to be empty
    rm -rf $HOME/runWF
    nextflow clone tweep/nextflow-wf-example  -r feature/v0.0.1   $HOME/runWF
```

3) get help message  
Note: The command line changes and omits the workflow repo *tweep/nextflow-wf-example* . we now simply use "." 
``` 
    cd $HOME/runWF 
    nextflow run .  --help
```

4) Run workflow 
```
    cd $HOME/runWF 
    nextflow run  .  --inputDir /tmp/data --outputDir results --string "hello text to cuppercase" -profile slurm -resume 
```


