using Zygote
using Makie

# Heun's Method

function heunstep(f, x, h)
    slopeLeft = f(x)
    eulerStep = x + [h; h * slopeLeft]
    slopeRight = f(eulerStep)

    slopeAvg = (slopeLeft + slopeRight) / 2
    return x + [h; h * slopeAvg]
end

function heunstep2(f, x, h)
    slopeLeft = f(x)
    eulerStep = x + h * slopeLeft
    slopeRight = f(eulerStep)

    slopeAvg = (slopeLeft + slopeRight) / 2
    return x + h * slopeAvg
end

f(x) = x[1] * x[2]

global x = [1; 1]
for i = 1:1000
    global x = heunstep(f, x, 0.001)
end
# println(x)

f2(x) = [0.5 * cos(x[2]); cos(x[1])]

global x2 = [1; 1]
global allx2 = x2
for i = 1:100
    global x2 = heunstep2(f2, x2, 0.1)
    global allx2 = hcat(allx2, x2)
end
# println(x2)

# display(plot(allx2[1,:], allx2[2,:]))

pendmotion(x) = [
    x[2] # The velocity is just the velocity
    -9.81 / 1 * sin(x[1]) # The acceleration is based off theta
]


# global pendOverTime = [0; pend[1]]
# for i = 1:10
#     global pend = heunstep2(pendmotion, pend, 1)
#     global pendOverTime = hcat(pendOverTime, [i * 0.1; pend[1]])
# end

# scene = plot(pendOverTime[1,:], pendOverTime[2,:])
scene = Scene(resolution=(600, 600))

global pend = [π - 0.001; 0]
global pendθ = Node(0.0)

lines!(scene, lift(θ -> [(0, 0), (cos(θ - π/2), sin(θ - π/2))], pendθ), limits=FRect(-1.5, -1.5, 3.0, 3.0))

record(scene, "pendulum_2.mp4", 1:1000; framerate = 60) do i
    for j = 1:10
        global pend = heunstep2(pendmotion, pend, 1/(10*60))
    end
    global pendθ[] = pend[1]
end

# Pendulum Code

g = 9.81
m = 1
l = 1

L(θ, θ̇) = (1/2 * m * (2 * π * θ̇) ^ 2) - (m * g * l * (1 - cos(θ)))

dLdθ(θ, θ̇) = gradient(dθ -> L(dθ, θ̇), θ)[1]
dLdθ̇(θ, θ̇) = gradient(dθ̇ -> L(θ, dθ̇), θ̇)[1]
