# -*- coding:utf-8 -*-
'''
Created on 1/12/2018

@author: valves
'''
from cmd import *
from GandaGaloWindow import GandaGaloWindow
from GandaGaloEngine import GandaGaloEngine


class GandaGaloShell(Cmd):
    intro = 'Interpretador de comandos para o GandaGalo. Escrever help ou ? para listar os comandos disponíveis.\n'
    prompt = 'GandaGalo> '
                               
    def do_mostrar(self, arg):
        " -  comando mostrar que leva como parâmetro o nome de um ficheiro..: mostrar <nome_ficheiro> \n" 
        try:
            lista_arg = arg.split()
            num_args = len(lista_arg)
            if num_args == 1:
                eng.ler_tabuleiro_ficheiro(lista_arg[0])
                eng.printpuzzle()
                global janela  # pois pretendo atribuir um valor a um identificador global
                if janela is not None:
                    del janela  # invoca o metodo destruidor de instancia __del__()
                janela = GandaGaloWindow(40, eng.getlinhas(), eng.getcolunas())
                janela.mostraJanela(eng.gettabuleiro())
            else:
                print("Número de argumentos inválido!")
        except:
            print("Erro: ao mostrar o puzzle")
    
    def do_abrir(self, arg):
        " - comando abrir que leva como parâmetro o nome de um ficheiro..: abrir <nome_ficheiro>  \n"
        pass
    
    def do_gravar(self, arg):
        " - comando gravar que leva como parâmetro o nome de um ficheiro..: gravar <nome_ficheiro>  \n"
        pass
    
    def do_jogar(self, arg):    
        " - comando jogar que leva como parâmetro o caractere referente à peça a ser jogada (‘X’ ou ‘O’) e dois inteiros que indicam o número da linha e o número da coluna, respetivamente, onde jogar \n"
        pass
            
    def do_validar(self, arg):    
        " - comando validar que testa a consistência do puzzle e verifica se o tabuleiro está válido: validar \n"
        pass
    
    def do_ajuda(self, arg):    
        " - comando ajuda que indica a próxima casa lógica a ser jogada (sem indicar a peça a ser colocada): ajuda  \n"
        pass
    
    def do_undo(self, arg):    
        " - comando para anular movimentos (retroceder no jogo): undo \n"
        pass
    
    def do_resolver(self, arg):    
        " - comando para resolver o puzzle: resolver \n"
        pass

    def do_ancora(self, arg):    
        " - comando âncora que deve guardar o ponto em que está o jogo para permitir mais tarde voltar a este ponto: ancora \n"
        pass
    
    def do_undoancora(self, arg):    
        " - comando undo para voltar à última ancora registada: undoancora \n"
        pass
    
    def do_gerar(self, arg):    
        " - comando gerar que gera puzzles com solução única e leva três números inteiros como parâmetros: o nível de dificuldade (1 para ‘fácil’ e 2 para ‘difícil’), o número de linhas e o número de colunas do puzzle \n"
        pass

    def do_ver(self, arg):    
        " - Comando para visualizar graficamente o estado atual do GandaGalo caso seja válido: VER  \n"

    
    def do_sair(self, arg):
        "Sair do programa GandaGalo: sair"
        print('Obrigado por ter utilizado o Gandagalo, espero que tenha sido divertido!')
        global janela  # pois pretendo atribuir um valor a um identificador global
        if janela is not None:
                    del janela  # invoca o metodo destruidor de instancia __del__()
        return True


if __name__ == '__main__':
    eng = GandaGaloEngine()
    janela = None
    sh = GandaGaloShell()
    sh.cmdloop()
    
'''


'''

