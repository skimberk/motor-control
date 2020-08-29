using Interact, Plots

x = [
    0  1
    2  3
    4  5
    6  7
    8  9
    NaN NaN
]

A = [cos(0); sin(0)]
B = [cos(2/3 * π); sin(2/3 * π)]
C = [cos(-2/3 * π); sin(-2/3 * π)]

phaseA(t) = sin(t) / 1.5
phaseB(t) = sin(t - 2/3 * π) / 1.5
phaseC(t) = sin(t + 2/3 * π) / 1.5

Clarke = √(2/3) * [
    1 -1/2 -1/2
    0 √3/2 -√3/2
]

Park(θ) = [
    cos(θ) sin(θ)
    -sin(θ) cos(θ)
]

function prepvec(x)
    x = hcat([0; 0], x)
    return (x[1,:], x[2,:])
end

circlex(t) = cos(t)
circley(t) = sin(t)

@manipulate for t=0:0.2:10
    plot(prepvec(A)..., aspect_ratio=:equal, label="A")
    plot!(prepvec(B)..., label="B")
    plot!(prepvec(C)..., label="C")

    a = phaseA(t)
    b = phaseB(t)
    c = phaseC(t)

    currentVectorA = a * A
    currentVectorB = b * B
    currentVectorC = c * C

    sum = currentVectorA + currentVectorB + currentVectorC

    plot!(circlex, circley, 0, 2π, label=false)

    # plot!(prepvec([r * cos(θ) r * sin(θ)]), label=false)

    plot!(prepvec(currentVectorA)..., width=3, label=false)
    plot!(prepvec(currentVectorB)..., width=3, label=false)
    plot!(prepvec(currentVectorC)..., width=3, label=false)

    plot!(prepvec(sum)..., width=2, label=false)

    clarke = Clarke * [a; b; c]

    plot!(prepvec(clarke)...)

    dqz = Park(atan(sum[2], sum[1]) - π/2) * clarke

    plot!(prepvec(dqz)..., width=5)
end
