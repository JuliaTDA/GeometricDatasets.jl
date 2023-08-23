"""
    epsilon_net(X, ϵ; distance)

Cover the PointCloud X with balls of radius ϵ. 
Returns the vector of indexes of X that are the ball's centers.

We start by covering the first point of X with an ϵ-ball. Then we search for the next
point of X that is not covered by this ball. We then repeat the process, until
all points are inside some ball.
"""
function epsilon_net(X::PointCloud, ϵ::Number; metric = Distances.Euclidean())
    n = size(X)[2]

    covered = repeat([0], n)
    landmarks = Int32[]

    all_covered = false
    # prog = ProgressUnknown("Searching neighborhood of point number")
    balltree = BallTree(X, metric)

    while all_covered == false
        # select the first non-covered index
        current_center = findfirst(==(0), covered)
        # add it to the landmarks set
        push!(landmarks, current_center)

        # get the elements currently covered by the epsilon ball around the current_center
        currently_covered = inrange(balltree, X[:, current_center], ϵ)
        
        # update the covered indexes
        covered[currently_covered] .= 1

        # check if all points are covered
        all_covered = minimum(covered) ≈ 1

        # change the progress meter
        # ProgressMeter.next!(prog)
    end

    # ProgressMeter.finish!(prog);

    return landmarks
end

function farthest_points_sample(X::PointCloud, n::Integer; metric = Euclidean())    

    size(X)[2] < n && return [1:size(X)[2];]

    ids = zeros(Int64, n)
    ids[1] = rand(1:n)

    n == 1 && return ids
    
    commom_max_distance = colwise(metric, X[:, ids[1]], X)
    
    for i in 2:n
        d_i = colwise(metric, X[:, ids[i-1]], X)
    
        commom_max_distance = mapslices(minimum, hcat(commom_max_distance, d_i), dims = 2) |> vec
        
        ids[i] = findmax(commom_max_distance)[2]    
    end

    return ids    
end