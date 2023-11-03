# -*- coding: utf-8 -*-
"""
Created on Thu Jan 17 10:33:12 2019

@author: Asus
"""

from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqFeature import SeqFeature
from Bio.SeqRecord import SeqRecord
from Bio import Entrez
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML
import os

#retirar genoma de y.pestis do ncbi e guardar no ficheiro genoma em formato genbank e em formato fasta
Entrez.email="...@example.com"
handle = Entrez.efetch(db="nuccore", rettype="gbwithparts", retmode="text", id = "NC_003143.1")
seq_record=SeqIO.read(handle, "genbank")
genoma=SeqIO.write(seq_record,"genoma.gbk","genbank")
genoma_fasta=SeqIO.write(seq_record,"genoma.fasta","fasta")

# abrir fiheiro com ids do optflux dos genes criticos e guardar todos os ids numa lista

ficheiro = open("ids.txt", "r")
lines = ficheiro.readlines()
ids = [s.rstrip() for s
       in lines]

             
#dos ids da lista, guardar na variável featcds somente os ids/genes que estão descritos no genoma que contem proteínas descritas (contem CDS)                
featcds=[]
for i in range (len(seq_record.features)):
    for j in range (len(ids)):
        if seq_record.features[i].type=="CDS":
            if seq_record.features[i].qualifiers["locus_tag"][0]== ids[j]:
                 featcds.append(i)

#a partir dos locus_tags guardados na variável featcds, guardamos as sequencias destes genes através do extract na variável lista_de_seqs

lista_de_seqs=[]
for k in featcds:
    x=seq_record.features[k].extract(seq_record.seq)
    lista_de_seqs.append(x)

#como as sequencias guardadas na variável lista_de_seqs estao guardadas num objeto Seq, utilizamos ._data para retirar somente a sequencia
lista=[]    
for i in range(len(lista_de_seqs)):
    lista.append(lista_de_seqs[i]._data)

#e guardamos estas sequencias num ficehiro fasta contendo o seu id e a sequencia

f=open('seqs.fasta','w')
for i in range(len(ids)):
    f.write('>')
    f.write(ids[i]+'\n')
    f.write('%s\n' %lista[i])
f.close()

#fizemos o parse do ficheiro fasta com os genes de interesse e fizemos um blast de cada gene contra o genoma humano, guardando cada resultado num ficheiro xml separado na pasta blast com o nome blast_(id do gene).xml
record_blast=SeqIO.parse(open("seqs.fasta"), format="fasta")
for i in record_blast:
    result_handle=NCBIWWW.qblast("blastn", "nt", i.format("fasta"), entrez_query="txid9606[ORGN]")
    save_file=open("blast/blast_"+i.id+'.xml',"w")
    save_file.write(result_handle.read())
    save_file.close()
    result_handle.close()

    
    
#na pasta alinhamentos_filtrados criamos tres ficheiros txt: homologos, nao_homologos e sem_alinhamento.
#para cada ficheiro xml guardado anteriormente, estabelecemos que para considerar os genes homologos, o alinhamento teria de ter um e-value menor que 0.05,
#a % de coverage do alinhamento teria de ser maior ou igual a 70% e a sua similaridade maior ou igual a 35% 
#estes genes eram guardados no ficheiro homologos com o nome do ficheiro blast, o id do gene humano e a sua definição
#se os genes não forem homologos estes sao guardados no ficheiro nao_homologos com o nome do ficheiro blast, o id do gene humano e a sua definição
#se nao ocorrer alinhamento, o nome do ficheiro blast (que contem o id do gene de interesse) é guardado no ficheiro sem_alinhamento
f=open('alinhamentos_filtrados/homologos.txt','w')
g=open('alinhamentos_filtrados/nao_homologos.txt','w')
h=open('alinhamentos_filtrados/sem_alinhamento.txt','w')
path='blast/'
lista_total=[]
com_alinhamento=[]
sem_alinhamento=[]
for filename in os.listdir(path):
    lista_total.append(filename)
    name=str(path+filename)
    result_handle=open(name, 'r')
    blast_record = NCBIXML.read(result_handle)
    threshold=0.05
    if blast_record.alignments:
        com_alinhamento.append(filename)
    for alignment in blast_record.alignments:
        for hsp in alignment.hsps:
            coverage= hsp.align_length / blast_record.query_length
            identity= hsp.identities/ hsp.align_length
            if hsp.expect<=threshold and coverage>=0.7 and identity>=0.35:
                f.write(filename+'\n')
                f.write('hit_id:'+alignment.hit_id+'\n')
                f.write('defenição:'+alignment.hit_def+'\n')
                f.write('\n')
            else:
                g.write(filename+'\n')
                g.write('hit_id:'+alignment.hit_id+'\n')
                g.write('defenição:'+alignment.hit_def+'\n')
                g.write('\n')

for j in lista_total:
    if j not in com_alinhamento:
        h.write(j+'\n')
        h.write('\n')
f.close()
g.close()
h.close()
