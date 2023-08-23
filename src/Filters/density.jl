"""
    density(
        p::Vector{<:Real}, X::PointCloud; metric::SemiMetric = Euclidean(),
        kernel_function::Function = sum
        )

Calculate the distance of p to every other point of X using 
the metric `metric`.
"""
function density(
    p::Vector{<:Real}, X::PointCloud; metric::SemiMetric = Euclidean(),
    kernel_function::Function = sum
    )
    n_points = size(X)[2]

    s = colwise(metric, p, X) |> kernel_function
    s /= n_points

    return s
end

"""
    density(
        X::PointCloud; metric::SemiMetric = Euclidean(),
        kernel_function::Function = identity
        )

Calculate the distance of every point p ∈ X to every other point of X using the metric `metric`
"""
function density(
    X::PointCloud; metric::SemiMetric = Euclidean(),
    kernel_function::Function = sum
    )
    n_points = size(X)[2]
    
    s = zeros(Float32, n_points)
    
    n_points == 0 && return(s)

    @threads for i ∈ 1:n_points 
        p = X[:, i]       
        s[i] = density(p, X; metric = metric, kernel_function = kernel_function)
    end

    return s
end

# function umap(X::PointCloud) 
#     umap(X)
# end