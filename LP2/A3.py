from collections import defaultdict
import heapq

class GreedySearch:
    def __init__(self):
        self.graph = defaultdict(list)
    
    def add_edge(self, u, v, w):
        self.graph[u].append((v, w))

    # I. Selection Sort
    def selection_sort(self, arr):
        n = len(arr)
        for i in range(n-1):
            min_idx = i
            for j in range(i+1, n):
                if arr[j] < arr[min_idx]:
                    min_idx = j
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
        return arr

    # II. Minimum Spanning Tree
    def minimum_spanning_tree(self):
        visited = set()
        mst = []
        start = list(self.graph.keys())[0]
        visited.add(start)
        while len(visited) < len(self.graph):
            min_edge = None
            min_weight = float('inf')
            for u in visited:
                for v, w in self.graph[u]:
                    if v not in visited and w < min_weight:
                        min_edge = (u, v)
                        min_weight = w
            if min_edge:
                u, v = min_edge
                visited.add(v)
                mst.append((u, v, min_weight))
        return mst

    # III. Single-Source Shortest Path Problem
    def single_source_shortest_path(self, start):
        visited = set()
        distances = {start: 0}
        parent = {start: None}
        queue = [(0, start)]
        while queue:
            dist, u = heapq.heappop(queue)
            if u not in visited:
                visited.add(u)
                for v, w in self.graph[u]:
                    if v not in visited:
                        new_dist = dist + w
                        if v not in distances or new_dist < distances[v]:
                            distances[v] = new_dist
                            parent[v] = u
                            heapq.heappush(queue, (new_dist, v))
        return distances, parent

    # IV. Job Scheduling Problem
    def job_scheduling(self, jobs):
        jobs.sort(key=lambda x: x[1], reverse=True)
        max_profit = 0
        schedule = [None] * len(jobs)
        for job in jobs:
            for i in range(job[0], -1, -1):
                if schedule[i] is None:
                    schedule[i] = job
                    max_profit += job[1]
                    break
        return max_profit, schedule

    # V. Prim's Minimal Spanning Tree Algorithm
    def prim_mst(self):
        start = list(self.graph.keys())[0]
        mst = []
        visited = set()
        visited.add(start)
        while len(visited) < len(self.graph):
            min_edge = None
            min_weight = float('inf')
            for u in visited:
                for v, w in self.graph[u]:
                    if v not in visited and w < min_weight:
                        min_edge = (u, v)
                        min_weight = w
            if min_edge:
                u, v = min_edge
                visited.add(v)
                mst.append((u, v, min_weight))
        return mst

    # VI. Kruskal's Minimal Spanning Tree Algorithm
    def kruskal_mst(self):
        def find(parent, u):
            if parent[u] == u:
                return u
            return find(parent, parent[u])

        mst = []
        parent = {u: u for u in self.graph}
        edges = [(w, u, v) for u in self.graph for v, w in self.graph[u]]
        edges.sort()
        for w, u, v in edges:
            pu, pv = find(parent, u), find(parent, v)
            if pu != pv:
                mst.append((u, v, w))
                parent[pu] = pv
        return mst

    # VII. Dijkstra's Minimal Spanning Tree Algorithm
    def dijkstra_mst(self, start):
        visited = set()
        distances = {start: 0}
        parent = {start: None}
        queue = [(0, start)]
        while queue:
            dist, u = heapq.heappop(queue)
            if u not in visited:
                visited.add(u)
                for v, w in self.graph[u]:
                    if v not in visited:
                        new_dist = dist + w
                        if v not in distances or new_dist < distances[v]:
                            distances[v] = new_dist
                            parent[v] = u
                            heapq.heappush(queue, (new_dist, v))
        return distances, parent

# Driver code
g = GreedySearch()
g.add_edge('A', 'B', 2)
g.add_edge('A', 'C', 3)
g.add_edge('B', 'C', 1)
g.add_edge('B', 'D', 1)
g.add_edge('C', 'D', 4)

while True:
    print('1. Kruskal\'s Minimal Spanning Tree Algorithm')
    print('2. Dijkstra\'s Minimal Spanning Tree Algorithm')
    print('3. Exit')
    choice = int(input('Enter choice: '))
    if choice == 1:
        print('Kruskal\'s Minimal Spanning Tree Algorithm')
        print(g.kruskal_mst())
    elif choice == 2:
        print('Dijkstra\'s Minimal Spanning Tree Algorithm')
        start = input('Enter start node: ')
        distances, parent = g.dijkstra_mst(start)
        print(f'Distances: {distances}')
        print(f'Parent: {parent}')
    elif choice == 3:
        break
    else:
        print('Invalid choice')
