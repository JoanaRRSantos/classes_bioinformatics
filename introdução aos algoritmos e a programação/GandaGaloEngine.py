# -*- coding:utf-8 -*-
'''
Created on 1/12/2018

@author: valves
'''




class GandaGaloEngine:
    
    def __init__(self):
        self.linhas = 0
        self.colunas = 0
        self.tabuleiro = [] #matriz que representa o puzzle
    
    def ler_tabuleiro_ficheiro(self, filename):
        '''
        Cria nova instancia do jogo numa matriz
        :param filename: nome do ficheiro a ler
        '''
        try:
            ficheiro = open(filename, "r")
            lines = ficheiro.readlines() #ler as linhas do ficheiro para a lista lines
            dim = lines[0].strip('\n').split(' ')  # obter os dois numeros da dimensao do puzzle, retirando o '\n' 
            self.linhas = int(dim[0])  # retirar o numero de linhas
            self.colunas = int(dim[1])  # retirar o numero de colunas
            self.tabuleiro=[]
            for i in range(1,len(lines)):
                self.tabuleiro.append(lines[i].split())
            return self.tabuleiro
        except:
            print("Erro: na leitura do tabuleiro")
        else:
            self.ficheiro.close()
        return self.tabuleiro
    
    def printpuzzle(self):
        for linha in self.tabuleiro:
            for simbolo in linha:
                print(simbolo,end=" ")
            print()
    
    def getlinhas(self):
        return self.linhas
    
    def getcolunas(self):
        return self.colunas
    
    def gettabuleiro(self):
        return self.tabuleiro

    def settabuleiro(self, t):
        self.tabuleiro = t
