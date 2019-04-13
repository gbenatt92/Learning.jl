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
  edges::Union{Array{Edge}, Nothing}
end


function create_node(
  name::String,
  description::String,
  references::Union{Tuple{Vararg{String}}, Nothing}=nothing,
  notes::Union{String, Nothing}=nothing)
  Node(
    name,
    description,
    references,
    notes
  )
end


function create_edge(parent::String, offspring::String)
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

function add_node(graph::Graph, node::Dict{String, Node})
  if isnothing(graph.nodes)
    return Graph(
      graph.name,
      node,
      graph.edges
    )
  else
    return Graph(
      graph.name,
      merge(graph.nodes, node),
      graph.edges
    )
  end
end

function add_edge(graph::Graph, edge::Edge)
  if isnothing(graph.edges)
    new_edge = [edge, ]
    return Graph(
      graph.name,
      graph.nodes,
      new_edge
    )
  else
    new_edges = push!(graph.edges, edge)
    return Graph(
      graph.name,
      graph.nodes,
      new_edges
    )
  end
end

function add_edge(graph::Graph, edge::Array{Edge})
  if isnothing(graph.edges)
    return Graph(
      graph.name,
      graph.nodes,
      edge
    )
  else
    new_edges = vcat(graph.edges, edge)
    return Graph(
      graph.name,
      graph.nodes,
      new_edges
    )
  end
end

function add_nodes_and_edges(
  graph::Graph,
  nodes::Union{Node, Dict{String, Node}},
  edges::Union{Edge, Array{Edge}})

  graph_with_node = add_node(graph, nodes)
  return add_edge(graph, edges)

end
