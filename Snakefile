    
wcards = glob_wildcards("data/raw/{session}/notes.json")


rule all:
    input:
        expand("data/processed/{session}/{session}.nwb", session=wcards.session),
        expand("reports/{session}/extract_name.ipynb", session=wcards.session)


rule process_to_nwb:
    input: 
        raw = "data/raw/{session}/notes.json",
        notebook = "scripts/to_nwb.ipynb"
    output: 
        nwb = "data/processed/{session}/{session}.nwb",
        notebook = "reports/{session}/to_nwb.ipynb"
    shell:
        "papermill {input.notebook} {output.notebook} -p fname_raw {input.raw} -p fname_proc {output.nwb}"


rule extract_experimenter_name:
    input:
        nwb = "data/processed/{session}/{session}.nwb",
        notebook = "scripts/extract_name.ipynb"
    output:
        notebook = "reports/{session}/extract_name.ipynb"
    shell:
        "papermill {input.notebook} {output.notebook} -p fname {input.nwb}"