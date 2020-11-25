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
bash /usr/local/apps/psycapps/HeudiConv_BIDS_conversion/code/call_heudiconv.sh /MRIRaw/MRIRaw07/Demo/ /MRIWork/MRI-Scratch/PGR_Seminar_2020/ayan_sengupta/Sample_BIDS_Dataset '202002040947_19800101XXXX' /usr/local/apps/psycapps/HeudiConv_BIDS_conversion/code/anon_id.py 
```

# Generate the dataset 

- Template

```bash
bash <code_folder>/call_heudiconv.sh <Dicom_Folder> <Output_Folder> <Subject_list> <Anonymization_script> <heuristic_file>

```
- Example

```bash
bash /usr/local/apps/psycapps/HeudiConv_BIDS_conversion/code/call_heudiconv.sh /MRIRaw/MRIRaw07/Demo/ /MRIWork/MRI-Scratch/PGR_Seminar_2020/ayan_sengupta/Sample_BIDS_Dataset '202002040947_19800101XXXX' /usr/local/apps/psycapps/HeudiConv_BIDS_conversion/code/anon_id.py /usr/local/apps/psycapps/HeudiConv_BIDS_conversion/code/heuristic_template.py
```



