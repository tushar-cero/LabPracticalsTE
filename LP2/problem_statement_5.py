import heapq

def dijkstra(graph, start):
    distances = {v: float('inf') for v in graph}
    distances[start] = 0
    pq = [(0, start)]
    while pq:
        (dist, v) = heapq.heappop(pq)
        if dist > distances[v]:
            continue
        for (u, weight) in graph[v].items():
            if distances[v] + weight < distances[u]:
                distances[u] = distances[v] + weight
                heapq.heappush(pq, (distances[u], u))
    return distances

# Driver code
graph = {
    'A': {'B': 2, 'C': 4},
    'B': {'C': 1, 'D': 4},
    'C': {'E': 3},
    'D': {'F': 2},
    'E': {'D': 3, 'F': 2},
    'F': {}
}
distances = dijkstra(graph, 'A')
print(distances)
