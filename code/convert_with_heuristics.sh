#! /bin/bash



# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u

# Add Heudiconv to the path

source /usr/local/apps/psycapps/config/conda_bash_update heudiconv




### input arguments
### 1. dicom directory
### 2. output directory
### 3. subject list

dicom_directory=$1
output_directory=$2
subject_list=$3
anonimize_file=$4
heuristic_file=$5

IFS=', ' read -a subject_list <<< "$subject_list"

for subject in "${subject_list[@]}"; do
    echo 'Generating BIDS dataset for : ' $subject

    # Generate and change to output folder
    mkdir -p $output_directory
    cd $output_directory


    # Actual conversion

    heudiconv -d $dicom_directory/{subject}/*/* -s $subject --ses mri --anon-cmd $anonimize_file -f $heuristic_file -c dcm2niix -b notop --overwrite --conv-outdir $output_directory


done




