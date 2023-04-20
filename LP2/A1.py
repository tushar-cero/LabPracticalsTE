class Graph:
    def __init__(self):
        self.graph = {}
    
    def add_edge(self, u, v):
        if u not in self.graph:
            self.graph[u] = []
        if v not in self.graph:
            self.graph[v] = []
        self.graph[u].append(v)
        self.graph[v].append(u)

    def dfs_util(self, v, visited):
        visited.add(v)
        print(v, end=' ')
        for neighbor in self.graph[v]:
            if neighbor not in visited:
                self.dfs_util(neighbor, visited)

    def dfs(self, start):
        visited = set()
        self.dfs_util(start, visited)

    def bfs(self, start):
        visited = set()
        visited.add(start)
        queue = [start] # replace deque with list
        while queue:
            curr_vertex = queue.pop(0) # dequeue the first vertex
            print(curr_vertex, end=' ')
            for neighbor in self.graph[curr_vertex]:
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor) # enqueue the unvisited neighbors

# driver code to test the Graph class and BFS algorithm
g = Graph()
g.add_edge(0, 1)
g.add_edge(0, 2)
g.add_edge(1, 4)
g.add_edge(2, 3)

print("Depth First Traversal (starting from vertex 2):")
g.dfs(2)

print("\nBreadth First Traversal (starting from vertex 2):")
g.bfs(2)
