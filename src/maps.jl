"""
    immersion(X::PointCloud, n::Integer)

Isometrically include the point cloud X of R^m into R^{m+n},
with all extra coordinates equal 0.
"""
function immersion(X::PointCloud, n::Integer)
    @assert n >= 0 "n must be non-negative"
    vcat(X, zeros(n, size(X)[2]))
end