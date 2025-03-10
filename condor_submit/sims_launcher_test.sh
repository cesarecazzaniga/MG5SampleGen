#!/bin/bash

set -x
#save current directory to return to it later
orig_job_dir=${PWD}
#go to home
cd /afs/cern.ch/user/c/cazzanig/private/
source setup_mg_production.sh
echo ${PWD}
job_dir=${orig_job_dir}
cd ${job_dir}
output_dir=${job_dir}/output
mkdir ${output_dir}
counter=$(($1+$2))

cd /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/

#process
process=QCD

mkdir /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}

cp /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/launcher_QCD_dijet_test.txt /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test1_${counter}.txt
cp /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/launcher_QCD_dijet_test.txt /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test2_${counter}.txt  
sed 's?OUTPUT?'${output_dir}'?' launcher_QCD_dijet_test.txt  > /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test1_${counter}.txt
sed 's?SEED?'${counter}'?' /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test1_${counter}.txt > /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test2_${counter}.txt
mkdir /afs/cern.ch/user/c/cazzanig/private/condor_submit/output/
./bin/mg5_aMC /afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7/${process}/launcher_QCD_test2_${counter}.txt 
path_to_run_dirs=${output_dir}/Events
run_dirs=$(ls ${path_to_run_dirs} | grep -E "^run_")
for path in ${run_dirs[@]}; do
  xrdcp $path_to_run_dirs/${path}/tag_1_delphes_events.root root://t3se01.psi.ch:1094//store/t3groups/ethz-susy/test_prod_mg5/QCD_part-${counter}.root    
done

