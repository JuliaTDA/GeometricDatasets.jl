function distance_to_measure(
    X::PointCloud, p::Union{Vector{<:Real}, PointCloud} = X; 
    metric = Euclidean(), k = 5,
    summary_function = mean
    )
    tree = BallTree(X, metric; reorder = false)

    n = n_points(p)        
    s = zeros(Float64, n)    
    n == 0 && return(s)

    columns = eachcol(p)
    @threads for i ∈ 1:n
        v = columns[i]
        _, d = knn(tree, v, k)
        @inbounds s[i] = d |> summary_function
    end

    return s
end