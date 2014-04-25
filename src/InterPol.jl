module InterPol

export interpolateAt, interpolateDerivativeAt

# returns the value of the interpolation polynomial at the point x0
function interpolateAt{T<:Number,N}(x::Vector{T}, y::AbstractArray{T,N}, x0::T)

    if length(x)!=size(y,1)
        error("x and y have to be of the same size.")
    end

    n = length(x)
    p = zero(T)

    for i=1:n
        Li =one(T)
        dLi=zero(T)
        for j=1:n
            if j==i
                continue
            else
                Li*=(x0-x[j])/(x[i]-x[j])
            end
        end
        p.+=Li.*y[i, [1:size(y,n) for n=2:N]...]
    end
    return p
end

# returns the value of the derivative of the interpolation polynomial
# at the point x0
function interpolateDerivativeAt{T<:Number,N}(x::Vector{T}, y::AbstractArray{T,N}, x0::T)

    if length(x)!=size(y,1)
        error("x and y have to be of the same size.")
    end

    n = length(x)
    p = zero(T)

    for i=1:n
        dLi=zero(T)
        for k=1:n
            if k==i
                continue
            else
                dLi1=one(T)
                for j=1:n
                    if j==k || j==i
                        continue
                    else
                        dLi1*=(x0-x[j])/(x[i]-x[j])
                    end
                end
                dLi+=dLi1/(x[i]-x[k])
            end
        end
        p.+=dLi.*y[i, [1:size(y,n) for n=2:N]...]
        # p+=dLi*y[i]
    end
    return p
end

end # module
