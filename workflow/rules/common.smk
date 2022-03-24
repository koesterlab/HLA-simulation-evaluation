import pandas as pd

configfile: "config/config.yaml"

alleles = pd.read_csv(config["hla"], sep ="\t")

def create_sample(): #n: number of samples in the end, k: number of fractions
    alleles['sample_name'] = "Sample" + "_" + '-'.join(str(e) for e in alleles['fraction'])
    alleles['num_reads'] = alleles['fraction']*2000 #assume the mixture will have 2000 reads
    alleles['num_reads'] = alleles['num_reads'].astype(int).astype('str')
    del alleles['fraction'] 
    return alleles

sample_table = create_sample()
