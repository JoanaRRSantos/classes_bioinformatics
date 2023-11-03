#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 18 10:26:14 2019

@author: Joana
"""

from igraph import *
import matplotlib.pyplot as plt

class MetabolicNetwork:  
    
    def __init__(self, split_rev = False):
        self.node_types = {}
        self.node_types["metabolite"] = []
        self.node_types["reaction"] = []
        self.split_rev = split_rev

    def add_vertex_type(self, v, nodetype):
            count=0
            g.add_vertex(v)
            if v in g.vs["name"]:
                count+=1
            if count>1:
                g.delete_vertices(g.vs["name"]==v)
                g.add_vertex(v)
            g.add_vertex(v)
            self.node_types[nodetype].append(v)
    
    def get_nodes_type(self, node_type):
        if node_type in self.node_types:
            return self.node_types[node_type]
        else: 
            return None
        
    def add_edge_2(self,v,d):
        if v not in g.vs["name"]:
            g.add_vertex(v)
        if d not in g.vs["name"]:
            g.add_vertex(d)    
        g.add_edge(v,d)
        
    def all_degrees(self, deg_type = "inout"):
        ''' Computes the degree (of a given type) for all nodes.
        deg_type can be "in", "out", or "inout" '''
        degs = {}
        for v in g.vs["name"]:
            if deg_type == "inout":
                degs[v] = g.degree(v)
            elif deg_type=="in":
                degs[v] = g.indegree(v)
            else: degs[v] = g.outdegree(v) 
        return degs
        
    def mean_degree(self, deg_type = "inout"):
        degs = self.all_degrees(deg_type)
        return sum(degs.values()) / float(len(degs))
    
    def prob_degree(self, deg_type = "inout"):
        degs = self.all_degrees(deg_type)
        res = {}
        for k in degs.keys():
            if degs[k] in res.keys():
                res[degs[k]] += 1
            else:
                res[degs[k]] = 1
        for k in res.keys():
            res[k] /= float(len(degs))
        return res        
    
    def get_adjacents(self, v):
        suc = g.neighbors(v, mode=OUT) # sucessores
        pred = g.neighbors(v, mode=IN) # pre-sucessores
        res = pred
        for p in suc: 
            if p not in res: res.append(p)
        return res
    
    def clustering_coef(self, v):
        adjs = self.get_adjacents(v)
        if len(adjs) <=1: 
            return 0.0     
        ligs = 0 #numero de vizinhos ligados aos vizinhos do v 
        for i in adjs:
            for j in adjs:
                if i != j:
                    if j in g.neighbors(i, mode=OUT) or i in g.neighbors(j, mode=OUT): 
                        ligs = ligs + 1
        return float(ligs)/(len(adjs)*(len(adjs)-1))

    def all_clustering_coefs(self):
        ccs = {}
        for i in range(len(g.vs)):
            k=g.vs[i]["name"]
            ccs[k] = self.clustering_coef(k)
        return ccs
        
    def mean_clustering_coef(self):
        ccs = self.all_clustering_coefs()
        return sum(ccs.values()) / float(len(ccs))
    
    def mean_clustering_perdegree(self, deg_type = "inout"):
        degs = self.all_degrees(deg_type)
        ccs = self.all_clustering_coefs()
        degs_k = {}
        for k in degs.keys():
            if degs[k] in degs_k.keys(): degs_k[degs[k]].append(k)
            else: degs_k[degs[k]] = [k]
        ck = {}
        for k in degs_k.keys():
            tot = 0
            for v in degs_k[k]:
                tot += ccs[v]
            ck[k] = float(tot) / len(degs_k[k])
        return ck
    
    def load_from_file(self, filename):
        rf = open(filename)
        gmr = MetabolicNetwork()
        for line in rf:
            if ":" in line:
                tokens = line.split(":")
                reac_id = tokens[0].strip()
                gmr.add_vertex_type(reac_id, "reaction")
                rline = tokens[1]
            else: raise Exception("Invalid line:")                
            if "<=>" in rline:
                left, right = rline.split("<=>")
                mets_left = left.split("+")
                for met in mets_left:
                    met_id = met.strip()
                    if met_id not in g.vs["name"]:
                        gmr.add_vertex_type(met_id, "metabolite")
                    if self.split_rev:
                        gmr.add_vertex_type(reac_id+"_b", "reaction")
                        gmr.add_edge_2(met_id, reac_id)
                        gmr.add_edge_2(reac_id+"_b", met_id)
                    else:
                        gmr.add_edge_2(met_id, reac_id)
                        gmr.add_edge_2(reac_id, met_id)
                mets_right = right.split("+")
                for met in mets_right:
                    met_id = met.strip()
                    if met_id not in g.vs["name"]:
                        gmr.add_vertex_type(met_id, "metabolite")
                    if self.split_rev:
                        gmr.add_edge_2(met_id, reac_id+"_b")
                        gmr.add_edge_2(reac_id, met_id)
                    else:
                        gmr.add_edge_2(met_id, reac_id)
                        gmr.add_edge_2(reac_id, met_id)
            elif "=>" in line:
                left, right = rline.split("=>")
                mets_left = left.split("+")
                for met in mets_left:
                    met_id = met.strip()
                    if met_id not in g.vs["name"]:
                        gmr.add_vertex_type(met_id, "metabolite")
                    gmr.add_edge_2(met_id, reac_id)
                mets_right = right.split("+")
                for met in mets_right:
                    met_id = met.strip()
                    if met_id not in g.vs["name"]:
                        gmr.add_vertex_type(met_id, "metabolite")
                    gmr.add_edge_2(reac_id, met_id)
            else: raise Exception("Invalid line:")    
    
    def top_10_metabolites(self):
    #criar lista de tuplos (met,suc)
        met_suc=[]
        for met in g.vs["name"]:
            if met[0]=='M':
                suc=g.neighbors(met, mode=OUT)
                pre=g.neighbors(met, mode=IN)
                met_suc.append((met,len(suc)+len(pre)))
        #ordenar lista de acordo com o número de reações
        for i in range(len(met_suc)-1):
            for j in range(i+1,len(met_suc)):
                if met_suc[i][1] < met_suc[j][1]:
                    met_suc[i],met_suc[j]=met_suc[j],met_suc[i]
        res=[]
        #caso o numero de metabolitos seja menor que 10:
        if len(met_suc)<10:
            for i in range(len(met_suc)):
                res.append(met_suc[i][0])
        #caso seja maior:
        else:
            for i in range(10):
                res.append(met_suc[i][0])
        return res


    def reaction_distribution(self):
        #Cria um gráfico com a distribuição do número de reações por cada um dos possíveis graus do tipo "inout"
        graus={}
        for node in g.vs["name"]:
            if node[0]=='R': # so consideramos reações
                f=g.degree(node)
                if f not in graus.keys():
                    graus[f]=1
                else:
                    graus[f]+=1
        #criar eixos x e y.
        x=graus.keys()
        x=sorted(x) #graus existentes por ordem crescente
        y=[]
        for f in x:
            y.append(graus[f]) #numero de reaçoes para cada grau
        return plt.bar(x, y)
    
    def final_products(self):
        res=[]
        for met in g.vs["name"]:
            if met[0]=='M':
                if g.outdegree(met)==0 and g.indegree(met)>0:
                    res.append(met)
        return res
        
    

        
        
if __name__ == "__main__":
    g=Graph(directed=True)  
    m=MetabolicNetwork()
    m.add_vertex_type("R1","reaction")
    """
    m.add_vertex_type("R2","reaction")
    m.add_vertex_type("R3","reaction")
    m.add_vertex_type("M1","metabolite")
    m.add_vertex_type("M2","metabolite")
    m.add_vertex_type("M3","metabolite")
    m.add_vertex_type("M4","metabolite")
    m.add_vertex_type("M5","metabolite")
    m.add_vertex_type("R5","reaction")
    m.add_vertex_type("M6","metabolite")
    m.add_vertex_type("M7","metabolite")
    m.add_vertex_type("R8","reaction")
    m.add_vertex_type("R9","reaction")
    m.add_vertex_type("M10","metabolite")
    m.add_edge_2("M10","R1")
    m.add_edge_2("R1","M3")
    m.add_edge_2("R1","M4")
    m.add_edge_2("M4","R2")
    m.add_edge_2("M6","R2")
    m.add_edge_2("R2","M3")
    m.add_edge_2("M4","R3")
    m.add_edge_2("M5","R3")
    m.add_edge_2("R3","M6")
    m.add_edge_2("R3","M4")
    m.add_edge_2("R3","M5")
    m.add_edge_2("M6","R3")
    m.add_edge_2("M4","M5")
    
    print("Degree de todos os Nodos:")
    print(m.all_degrees())
    print()

    print("Médias de degree:")
    print(m.mean_degree())
    print()
    
    print("Probabilidades:")
    print(m.prob_degree())
    print()
   
    print("Coefiente de clustering:")
    print( m.clustering_coef("R3"))
    print()
    
    print("Todos os coeficientes:")
    print( m.all_clustering_coefs())
    print()
     
    print("Medias de coeficientes:")
    print(m.mean_clustering_coef())
    print()
    
    print("Médias de clustering por degree:")
    print(m.mean_clustering_perdegree())
    print()
    
    print("Top 10 de metabolitos:")
    print(m.top_10_metabolites())
    print()
    
    print("Grafico da distribuição das reações:")
    print(m.reaction_distribution())
    print()
    
    print("Produtos finais:")
    print(m.final_products())
    print()
    
    g=Graph(directed=True)        
    print("metabolite-reaction network:")
    mrn = MetabolicNetwork()
    mrn.load_from_file("example-net.txt")
    print(g)
    print()
    
    g=Graph(directed=True)        
    print("metabolite-reaction network:")
    mrn = MetabolicNetwork(True)
    mrn.load_from_file("example-net.txt")
    print(g)
    """