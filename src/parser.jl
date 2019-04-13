import Learning: initialize_graph

function parser(file_path::String)
    open(file_path, "r") do file
        graph = parse_lines(file)
    end
end

function parse_lines(file::IOStream)
    lines = readlines(file)

    initial_graph, title_postion = get_graph_w_name(lines)



end



function get_graph_w_name(lines::Array{String})

    title_postion = findfirst(
        x -> x != "" && !match(r"^#", x),
        lines
    )

    return initialize_graph(lines[title_postion]), title_postion
end
