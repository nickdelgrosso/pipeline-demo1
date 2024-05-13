# Example Workflow


## Installl Dependencies
```
conda env create -f environment.yml
conda activate snakemake
```

## Run Workflow Once

```
snakemake --cores 1
```

## Run Worfklow Automatically, whenever the data in `data/raw` changes or gets added to:

```
python watcher.py
```



