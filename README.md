# HeudiConv_BIDS_conversion
Repository having codes written using heudiconv for conversion of dicoms to BIDS 


# Update Python for using heudiconv and git on the cluster

```bash
source /usr/local/apps/psycapps/config/conda_bash_update heudiconv
```

# Open another new terminal and run the following command templates:

# Generate Heuristics

- Template

```bash
bash <code_folder>/call_heudiconv.sh <Dicom_Folder> <Output_Folder> <Subject_list> <Anonymization_script> 

```
- Example

```bash
bash /MRIWork/MRI-Scratch/HeudiConv_BIDS_conversion/code/call_heudiconv.sh /MRIRaw/MRIRaw07/Demo/ /MRIWork/MRI-Scratch/Sample_BIDS_Dataset '202002040947_19800101XXXX' /MRIWork/MRI-Scratch/Create_BIDS_dataset/code/anon_id.py 

```

# Generate the dataset 

- Template

```bash
bash <code_folder>/call_heudiconv.sh <Dicom_Folder> <Output_Folder> <Subject_list> <Anonymization_script> <heuristic_file>

```
- Example

```
bash /MRIWork/MRI-Scratch/HeudiConv_BIDS_conversion/code/call_heudiconv.sh /MRIRaw/MRIRaw07/Demo/ /MRIWork/MRI-Scratch/Sample_BIDS_Dataset '202002040947_19800101XXXX' /MRIWork/MRI-Scratch/Create_BIDS_dataset/code/anon_id.py /MRIWork/MRI-Scratch/Create_BIDS_dataset/code/heuristic_template.py
```
