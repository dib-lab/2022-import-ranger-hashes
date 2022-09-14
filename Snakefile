models, = glob_wildcards('/group/ctbrowngrp2/tereiter/github/2020-ibd/outputs/optimal_rf_seed/{model}.RDS')
print(f'Found {len(models)} models.')

rule all:
    input:
        expand('sigs/{m}.sig', m=models)


rule rds_to_csv:
    input:
        "/group/ctbrowngrp2/tereiter/github/2020-ibd/outputs/optimal_rf_seed/{m}.RDS"
    output:
        "csv/{m}.csv"
    conda: "envs/r.yml"
    shell: """
        ./ranger-to-csv.R {input} {output}
    """
        
rule csv_to_sig:
    input:
        "csv/{m}.csv"
    output:
        "sigs/{m}.sig"
    conda: "envs/sourmash.yml"
    shell: """
        ./ranger-csv-to-sourmash-sig.py {input} {output}
    """
