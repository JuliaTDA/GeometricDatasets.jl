# aaaa
function quarto_block(x)
    s = """

    :::{.callout-note appearance="simple"}

    # doc

    $x

    :::

    """

    s = replace(string(s), "\n#" => "\n###")

    return Markdown.parse(s)
end


using GeometricDatasets
using Markdown

m = GeometricDatasets

mds = filter(Docs.modules) do m
    s = repr(m)
    if (s == "GeometricDatasets") | occursin("GeometricDatasets.", s)
        return true
    end

    return false
end

metadicts = Docs.meta.(mds)

metadict = metadicts[1]
(binding, md) = first(metadict)

d = ds[2]

filepath = "docstrings/autodocs.qmd"

module_name = "GeometricDatasets"
d = ds[1]

metadict = metadicts[1]
(bd, md) = first(metadict)

x = collect(metadict)
x

x = sort(collect(metadict), by=x->x[2].docs |> repr)
d = x[1][2]
d.docs |> keys
map(x) do z
    z[2] |> println
end


open(filepath, "w") do io
    counter = 1

    for metadict in metadicts
        
        module_name = mds[counter] |> repr
        println(io, "# Module $module_name \n")

        for (bd, md) in metadict
            ds = map(x->md.docs[x], md.order)

            for d in ds
                s = d |> Docs.parsedoc |> quarto_block #|> string
                println(io, s)
            end            
        end

        counter += 1
    end
end

mds[1] |> repr