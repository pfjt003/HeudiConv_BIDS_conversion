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

IFS=', ' read -a subject_list <<< "$subject_list"

for subject in "${subject_list[@]}"; do
    echo 'Generating Heuristics : ' $subject
    
    # Generate and change to output folder
    mkdir -p $output_directory
    cd $output_directory


    # Generate heuristics without the actual conversion

    heudiconv   -d $dicom_directory/{subject}/*/* \
                -s $subject \
                --anon-cmd $anonimize_file \
                -f convertall \
                -c none \
                --conv-outdir $output_directory

#heudiconv -d /MRIRaw/MRIRaw10/Sounds/{subject}/*/* -s 201905071342_19900902HEFE --anon-cmd /MRIWork/MRI-Scratch/Giusi_Pollicina/code/anon_id.py -f /MRIWork/MRI-Scratch/Giusi_Pollicina/code/heuristic_Ayan.py -c dcm2niix -b --overwrite --conv-outdir /MRIWork/MRI-Scratch/Giusi_Pollicina/BIDS_output/


done




