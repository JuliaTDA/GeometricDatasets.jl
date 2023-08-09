"""
    immersion(X::PointCloud, n::Integer)

Isometrically include the point cloud X of R^m into R^{m+n},
with all extra coordinates equal 0.
"""
function immersion(X::PointCloud, n::Integer)
    @assert n >= 0 "n must be non-negative"
    vcat(X, zeros(n, size(X)[2]))
end

"""
    translation(X::PointCloud, vector::Vector{<: Real})
    
Translate the space `X` by adding the `vector` to each point of X.
"""
function translation(X::PointCloud, vector::Union{Vector{<: Number}, Tuple})
    X .+ vector
end