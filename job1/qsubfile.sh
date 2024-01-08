#!/bin/bash

#####Set Scheduler Configuration Directives#####
#Set the name of the job. This will be the first part of the error/output filename.
#$ -N natedl

#Set the current working directory as the location for the error and output files.
#(Will show up as .e and .o files)
#$ -cwd


#$ -e ./output/argonerror.txt
#$ -o ./output/argonoutput.txt
##$ -j 

#Send e-mail at beginning/end/suspension of job
##$ -m besa
#$ -m be

#E-mail address to send to
#$ -M ndnewcomb@uiowa.edu


#####End Set Scheduler Configuration Directives#####


#####Resource Selection Directives#####
#See the HPC wiki for complete resource information: https://wiki.uiowa.edu/display/hpcdocs/Argon+Cluster
#Select the queue to run in
##$ -q COE,CCOM,UI,all.q
#$ -q all.q   

#Select the number of slots the job will use
#$ -pe smp 70
##$ -pe 56cpn 56

#Indicate that the job requires a GPU
#$ -l gpu=true

#Sets the number of requested GPUs to 1
##$ -l ngpus=4

#Indicate that the job requires a mid-memory (currently 256GB node)
##$ -l mem_256G=true

#Indicate the CPU architecture the job requires
##$ -l cpu_arch=broadwell

#Specify a data center for to run the job in
##$ -l datacenter=LC

#Specify the high speed network fabric required to run the job
##$ -l fabric=infiniband
#####End Resource Selection Directives#####


#####Begin Compute Work#####
#Print information from the job into the output file
/bin/echo Running on compute node: `hostname`.
/bin/echo In directory: `pwd`
/bin/echo Starting on: `date`
rm -f ./visualization.md
# touch ./visualization.md

#Sleep (wait and do nothing) for 60 seconds
##sleep 180

#module load stack/2021.1
#module load gcc/9.3.0

####lsdtopotools-actual-script-or-binary


##freesurfer brainmri$SGE_TASK_ID




#module load python/3.8.5_gcc-8.4.0

python monainet.py > ./output/monaiprintedoutput.txt 2> ./output/monaiprintederror.txt

#mpirun -np 112 /Users/sramadug/hande-1.4/bin/hande.x myinput.in > myoutput.out

#Print the end date of the job before exiting
/bin/echo Now it is: `date`
#####End Compute Work#####

