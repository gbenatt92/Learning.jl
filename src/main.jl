# this is test
struct Node
  name::String
  description::String
  references::Union{Tuple{Vararg{String}}, Nothing}
  notes::Union{String, Nothing}
end

struct Edge
  parent::String
  offspring::String
end

struct Graph
  name::String
  nodes::Union{Dict{String, Node}, Nothing}
  edges::Union{Tuple{Vararg{Edge}}, Nothing}
end


function create_node(name, description, references=nothing, notes=nothing)
  Node(
    name,
    description,
    references,
    notes
  )
end


function create_edge(parent, offspring)
  Edge(
    parent,
    offspring
  )
end

function initialize_graph(name)
  Graph(
    name,
    nothing,
    nothing
  )
end


function add_node(graph::Graph, node::Node)
  new_entry = Dict(node.name => node)
  if isnothing(graph.nodes)
    return Graph(
      graph.name,
      new_entry,
      graph.edges
    )
  else
    return Graph(
      graph.name,
      merge(graph.nodes, new_entry),
      graph.edges
    )
  end
end

function add_edge(graph::Graph, edge::Edge)
  new_edge = tuple(edge)
  if isnothing(graph.edges)
    return Graph(
      graph.name,
      graph.nodes,
      new_edge
    )
  else
    new_edges = merge(graph.edges, new_edge)
    return Graph(
      graph.name,
      graph.nodes,
      new_edges
    )
  end
end
