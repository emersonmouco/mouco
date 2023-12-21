# Criação do Grafo e implementação do Algoritmo BFS
# Função para criar um grafo padrão

from collections import defaultdict
# Esta classe representa um grafo direcionado
# usando representação de lista de adjacências
class Grafo:
    # Construtor
    def __init__(self):
        # Dicionário padrão para armazenar o grafo
        self.graph = defaultdict(list)
    # Função para adicionar um a aresta ao grafo
    def addEdge(self,u,v):
        self.graph[u].append(v)

    # Função para o algoritmo BFS
    def BFS(self, s):
        # Marque todos os vértices como não visitados
        visited = [False] * (len(self.graph))
        # Crie uma fila para o BFS 
        queue = []
        # Marque o nó de origem s como visitado e inclua na fila
        queue.append(s)
        visited[s] = True
        
        while queue:
            # Remova um vértice da fila e imprima
            s = queue.pop(0)
            print (s, end = " ")
            
            # Obter todos os vértices adjacentes do vértices desenfileirados.
            # Se um adjacente não foi visitado, marque o visitado e inclua na fila
            
            for i in self.graph[s]:
                if visited[i] == False:
                    queue.append(i)
                    visited[i] = True
                    
                    
# Cria uma instância da classe, construindo um grafo com diversas arestas
g = Grafo()
g.addEdge(0, 1)
g.addEdge(0, 2)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(2, 3)
g.addEdge(3, 3)


# Executa o algoritmo BFS
print ("Aqui está o caminho a seguir para atravessar o grafo (começando do vértice 2):")
g.BFS(2)