"""
pairwise_distance_summary(
        p::Union{Vector{Real}, PointCloud}, X::PointCloud; 
        metric::SemiMetric = Euclidean(),
        kernel_function::Function = sum
        )

Calculate the distances from each point `p` to all points of `X` and then 
aggregate it.

## Arguments

- `X`: a pointcloud.
- `p`: a point (vector) or pointcloud.
- `metric`: the metric to be used when calculating distances.
- `summary_function`: a function to aggregate.
"""
function pairwise_distance_summary(
    X::PointCloud, p::Union{Vector{Real}, PointCloud} = X; metric::SemiMetric = Euclidean(),
    summary_function::Function = mean
    )

    n = n_points(p)        
    s = zeros(Float64, n)    
    n == 0 && return(s)

    columns = eachcol(p)
    @threads for i ∈ 1:n
        v = columns[i]
        @inbounds s[i] = colwise(metric, v, X) |> summary_function
    end

    return s
end

"""
    density_estimation(
            X::PointCloud, p::Union{Vector{Real}, PointCloud} = X, 
            metric::SemiMetric = Euclidean(),
            h::Real = 1
            )

Calculate the density of each point `p` with relation to the
points of `X`.

## Arguments

- `X`: a pointcloud.
- `p`: a point (vector) or pointcloud.
- `metric`: the metric to be used when calculating distances.
- `h`: a number.

## Details

The result is a vector `s` such that 
s[i] = exp(-(x/h)^2) |> sum |> mean
"""
function density_estimation(
    X::PointCloud, p::Union{Vector{Real}, PointCloud} = X,  
    metric::SemiMetric = Euclidean(),
    h::Real = 1
    )

    f1 = x -> exp(-(x/h) ^2)
    f2 = mean

    s = pairwise_distance_summary(
        X, p, metric = metric, summary_function = c -> c .|> f1 |> f2
    )

    s
end

"""
    excentricity(
            p::Union{Vector{Real}, PointCloud}, X::PointCloud; 
            metric::SemiMetric = Euclidean()            
            )

Calculate the density of each point `p` with relation to the
points of `X`.

## Arguments

- `X`: a pointcloud.
- `p`: a point (vector) or pointcloud.
- `metric`: the metric to be used when calculating distances.

## Details

The result is a vector `s` such that 
s[i] = exp(-(x/h)^2) |> mean
"""
function excentricity(
    X::PointCloud, p::Union{Vector{Real}, PointCloud} = X,  
    metric::SemiMetric = Euclidean()         
    )

    s = pairwise_distance_summary(
        X, p, metric = metric
    )

    s
end