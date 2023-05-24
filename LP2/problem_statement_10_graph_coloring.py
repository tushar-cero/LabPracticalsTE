# A utility function to check if the current color assignment is safe for vertex v
def isSafe(v, graph, color, c):
    for i in range(v):
        if graph[v][i] == 1 and color[i] == c:
            return False
    return True

# A recursive utility function to solve m coloring problem
def graphColoringUtil(graph, m, color, v, colors):
    if v == len(graph):
        return True

    for c in colors:
        if isSafe(v, graph, color, c):
            color[v] = c
            if graphColoringUtil(graph, m, color, v + 1, colors) == True:
                return True
            color[v] = 0

def graphColoring(graph, m, colors):
    # Initialize all color values as 0. This initialization is needed correct functioning of isSafe()
    color = [0] * len(graph)
    if graphColoringUtil(graph, m, color, 0, colors) == None:
        return False

    # Print the solution
    print("Solution Exists: Following are the assigned colors")
    for c in color:
        print(c),
    return True

# Driver Code
graph = [[0, 1, 1, 1],
         [1, 0, 1, 0],
         [1, 1, 0, 1],
         [1, 0, 1, 0]]
m = 3 # Number of colors
colors = ['Red', 'Green', 'Blue'] # Set of available colors
graphColoring(graph, m, colors)
