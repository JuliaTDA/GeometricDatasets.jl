"""
    immersion(X::PointCloud, n::Integer)

Include the pointcloud X of R^m into R^{m+n},
with all extra coordinates equal 0.

Return a PointCloud.
"""
function include_space(X::PointCloud, n::Integer)
    @assert n >= 0 "n must be non-negative"
    vcat(X, zeros(n, size(X)[2]))
end

"""
    translation(X::PointCloud, vector::Union{Vector{<: Number}, Tuple})
    
Translate the space `X` by adding the `vector` to each point of X.

Return a PointCloud.
"""
function translate_space(X::PointCloud, vector::Union{Vector{<: Number}, Tuple})
    X .+ vector
end