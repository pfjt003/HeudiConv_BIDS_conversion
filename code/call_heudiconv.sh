#! /bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Treat unset variables as an error when substituting.
set -u


### input arguments
### 1. dicom directory
### 2. output directory
### 3. subject list

dicom_directory=$1
output_directory=$2
subject_list=$3
anonimize_file=$4

IFS=', ' read -a subject_list <<< "$subject_list"
working_directory=`dirname $0`

if [ $# -eq 5 ]; then
#if test -f "$heuristic_file"; then
    heuristic_file=$5
    echo "Heuristic file provided, performing dicom to nifti conversion"
    if [ ! -f "$heuristic_file" ] ; then
        echo "No such Heuristic file exists" $heuristic_file
        exit;
    else
        
        for subject in "${subject_list[@]}"; do
            echo 'Heuristic file exists, generating BIDS dataset : ' $subject
            echo 'Create qsub submission and log directory for : ' $subject
            
            anon_subject=$(python $anonimize_file $subject);

            #remove old conversion heuristics
            heuristics_directory=$output_directory/.heudiconv/$anon_subject

            if [ -d "$heuristics_directory" ]; then rm -r $heuristics_directory; fi

            log_folder=$output_directory/logs/$anon_subject
            mkdir -p $log_folder

            qsub    -l h_rss=4G \
                    -o ${log_folder}/output_BIDS_${anon_subject}.out \
                    -e ${log_folder}/error_BIDS_${anon_subject}.err \
                    $working_directory/convert_with_heuristics.sh \
                    $dicom_directory \
                    $output_directory \
                    $subject \
                    $anonimize_file \
                    $heuristic_file
        done

    fi
else

    for subject in "${subject_list[@]}"; do
        echo 'Heuristic file does not exist, generating heuristics : ' $subject
        echo 'Create qsub submission and log directory for : ' $subject

        anon_subject=$(python $anonimize_file $subject);

        #remove old conversion heuristics
        heuristics_directory=$output_directory/.heudiconv/$anon_subject

        if [ -d "$heuristics_directory" ]; then rm -r $heuristics_directory; fi

        log_folder=$output_directory/logs/$anon_subject
        mkdir -p $log_folder

        qsub    -l h_rss=4G \
                -o ${log_folder}/output_heuristics_${anon_subject}.out \
                -e ${log_folder}/error_heuristics_${anon_subject}.err \
                $working_directory/generate_heuristics.sh \
                $dicom_directory \
                $output_directory \
                $subject \
                $anonimize_file

    done
fi
