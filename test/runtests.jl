# this is test
module TestMain

using Test
using Learning: Graph, Node, Edge, create_node, create_edge, initialize_graph, add_edge, add_node



@testset "graph" begin
    test_node = create_node("test", "this is a test node")
    offspring_node = create_node(
        "offspring",
        "this is an offspring of test",
        ("mock1", "potato"),
        "/potato/path.txt"
    )

    @test test_node == Node("test", "this is a test node", nothing, nothing)

    @test offspring_node.references == ("mock1", "potato")
    @test offspring_node.notes == "/potato/path.txt"

    test_edge = create_edge("test", "offspring")

    @test test_edge == Edge("test", "offspring")

    test_graph = initialize_graph("test graph")

    @test test_graph == Graph("test graph", nothing, nothing)

    graph_with_node = add_node(test_graph, test_node)

    @test graph_with_node.nodes == Dict(
        "test" => Node("test", "this is a test node", nothing, nothing)
    )

    graph_with_2_nodes = add_node(graph_with_node, offspring_node)

    @test graph_with_2_nodes.nodes == Dict(
        "test" => Node("test", "this is a test node", nothing, nothing),
        "offspring" => Node("offspring",
        "this is an offspring of test",
        ("mock1", "potato"),
        "/potato/path.txt")
    )

    graph_with_nodes_and_edges = add_edge(graph_with_2_nodes, test_edge)

    @test graph_with_nodes_and_edges.name == "test graph"
    @test graph_with_nodes_and_edges.edges == tuple(Edge("test", "offspring"))
    @test graph_with_nodes_and_edges.nodes == Dict(
        "test" => Node("test", "this is a test node", nothing, nothing),
        "offspring" => Node("offspring",
        "this is an offspring of test",
        ("mock1", "potato"),
        "/potato/path.txt")
    )


end

end
