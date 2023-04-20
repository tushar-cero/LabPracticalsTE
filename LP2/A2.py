import heapq
from collections import defaultdict

class Graph:
    def __init__(self):
        self.graph = defaultdict(list)
    
    def add_edge(self, u, v, w):
        self.graph[u].append((v, w))

    def a_star(self, start, goal):
        # create a dictionary to store the cost of the path from the start vertex to each vertex
        cost = {start: 0}
        # create a dictionary to store the estimated total cost from the start vertex to the goal vertex through each vertex
        estimated_cost = {start: self.heuristic(start, goal)}
        # create a dictionary to store the parent vertex of each vertex in the optimal path
        parent = {start: None}
        # create a priority queue to store vertices to be visited
        queue = [(estimated_cost[start], start)]
        # traverse the graph using A* algorithm
        while queue:
            # get the vertex with the lowest estimated total cost from the priority queue
            curr_cost, curr_vertex = heapq.heappop(queue)
            # check if the goal vertex has been reached
            if curr_vertex == goal:
                # return the optimal path and its cost
                path = []
                while curr_vertex is not None:
                    path.append(curr_vertex)
                    curr_vertex = parent[curr_vertex]
                path.reverse()
                return path, cost[goal]
            # visit all unvisited neighbors of the current vertex
            for neighbor, weight in self.graph[curr_vertex]:
                new_cost = cost[curr_vertex] + weight
                # update the cost and estimated cost if a better path has been found
                if neighbor not in cost or new_cost < cost[neighbor]:
                    cost[neighbor] = new_cost
                    estimated_cost[neighbor] = new_cost + self.heuristic(neighbor, goal)
                    parent[neighbor] = curr_vertex
                    heapq.heappush(queue, (estimated_cost[neighbor], neighbor))
        # if the goal vertex cannot be reached, return None
        return None
    
    def heuristic(self, u, v):
        # define the heuristic function as the Euclidean distance between the vertices
        return ((u[0] - v[0]) ** 2 + (u[1] - v[1]) ** 2) ** 0.5

# driver code to test the Graph class and A* algorithm
g = Graph()
g.add_edge((0, 0), (0, 1), 1)
g.add_edge((0, 0), (1, 0), 1)
g.add_edge((0, 1), (1, 1), 1)
g.add_edge((1, 0), (1, 1), 1)
g.add_edge((1, 0), (2, 0), 1)
g.add_edge((1, 1), (2, 1), 1)
g.add_edge((2, 0), (2, 1), 1)

start = (0, 0)
goal = (2, 1)
path, cost = g.a_star(start, goal)
print("Optimal path:", path)
print("Optimal path cost:", cost)
