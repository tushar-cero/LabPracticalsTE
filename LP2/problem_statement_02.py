from collections import deque

def BFS(graph, queue, visited):
    if not queue:
        return

    v = queue.popleft()
    print(v, end=' ')

    for i in graph[v]:
        if not visited[i]:
            queue.append(i)
            visited[i] = True

    BFS(graph, queue, visited)

# Driver code
graph = {0: [1, 2], 1: [2], 2: [0, 3], 3: [3]}

visited = [False] * len(graph)
queue = deque([2])
visited[2] = True
BFS(graph, queue, visited)
