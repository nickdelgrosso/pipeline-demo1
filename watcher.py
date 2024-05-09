from pathlib import Path
import subprocess
from watchfiles import watch


def run_snakemake(snakemake_file):
    print("Executing Snakemake pipeline...")
    subprocess.run(["snakemake", "-s", snakemake_file, "--cores", "1"])

for changes in watch('./data/raw', './Snakefile'):
    for change, path in changes:
        run_snakemake('./Snakefile')
        
        


    