def kruskal(graph):
    # Finds the minimum spanning tree of a graph using Kruskal's algorithm.
    # Args: graph: A graph represented as a list of edges, where each edge is a tuple of (source, destination, weight).
    # Returns: A list of edges that form the minimum spanning tree. 

  # Sort the edges by weight.
  edges = sorted(graph, key=lambda edge: edge[2])

  # Create a union-find data structure to track which vertices are in the same component.
  uf = UnionFind(len(graph))

  # Iterate over the edges, adding each edge that does not create a cycle to the minimum spanning tree.
  mst = []
  for edge in edges:
    if not uf.is_connected(edge[0], edge[1]):
      uf.union(edge[0], edge[1])
      mst.append(edge)

  return mst


class UnionFind:
  """A union-find data structure."""

  def __init__(self, n):
    """Initializes a union-find data structure with n components."""
    self.parent = [i for i in range(n)]
    self.size = [1] * n

  def find(self, x):
    """Finds the root of the component that contains x."""
    if self.parent[x] != x:
      self.parent[x] = self.find(self.parent[x])
    return self.parent[x]

  def union(self, x, y):
    """Merges the components that contain x and y."""
    x_root = self.find(x)
    y_root = self.find(y)

    # If x and y are in the same component, do nothing.
    if x_root == y_root:
      return

    # Merge the smaller component into the larger component.
    if self.size[x_root] < self.size[y_root]:
      x_root, y_root = y_root, x_root

    self.parent[y_root] = x_root
    self.size[x_root] += self.size[y_root]

  def is_connected(self, x, y):
    """Returns True if x and y are in the same component."""
    return self.find(x) == self.find(y)


def main():
  # Create a graph.
  graph = [
      (0, 1, 1),
      (0, 2, 2),
      (1, 2, 3),
      (1, 3, 4),
      (2, 3, 5),
  ]

  # Find the minimum spanning tree.
  mst = kruskal(graph)

  # Print the minimum spanning tree.
  print("Minimum spanning tree:")
  for edge in mst:
    print(edge)


if __name__ == "__main__":
  main()
