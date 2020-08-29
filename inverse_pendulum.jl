using Zygote
using Makie

function heunstep2(f, x, h)
    slopeLeft = f(x)
    eulerStep = x + h * slopeLeft
    slopeRight = f(eulerStep)

    slopeAvg = (slopeLeft + slopeRight) / 2
    return x + h * slopeAvg
end

function rk4(f, x, h)
    k1 = f(x)
    k2 = f(x + k1 * h/2)
    k3 = f(x + k2 * h/2)
    k4 = f(x + k3 * h)

    return x + h * (k1 + 2k2 + 2k3 + k4) / 6
end

m = 1
M = 1
l = 1
g = 10
F = 1

model(x) = [
    x[3] # θ̇
    x[4] # ẋ
    -(M*g + g*m + l*m*cos(x[1])*x[3]^2)*sin(x[1]) / (l*(M + m*(sin(x[1])^2)))  # θ̇̇
    (m*(g*cos(x[1]) + l*x[3]^2)*sin(x[1])) / (M + m*sin(x[1])^2) # ẋ̇
]

modelF(x) = [
    x[3]
    x[4]
    -(F*cos(x[1]) + M*g*sin(x[1]) + g*m*sin(x[1]) + l*m*sin(2*x[1])*x[3]^2/2)/(l*(M + m*sin(x[1])^2))
    (F + g*m*sin(2*x[1])/2 + l*m*sin(x[1])*x[3]^2)/(M + m*sin(x[1])^2)
]

global state = [
    π - 0.000001 # θ
    0 # x
    0 # θ̇
    0 # ẋ
]

# # Nice plot
# global states = [0; state[1]; state[2]]
#
# for i = 1:1000
#
#     global states = hcat(states, [0.01 * i; state[1]; state[2]])
# end
#
# lines(states[1,:], states[2,:])
# lines!(states[1,:], states[3,:])

global anim = Node([0.0, 0.0])

scene = Scene(resolution=(600, 600))

lines!(scene, lift(x -> [(x[2], 0), (x[2] + cos(x[1] - π/2), sin(x[1] - π/2))], anim), limits=FRect(-1.5, -1.5, 3.0, 3.0))

record(scene, "pendulum_cart.mp4", 1:1000; framerate = 60) do i
    split = 100
    for j = 1:split
        global state = rk4(modelF, state, 1/(split*60))
    end
    global F = -30 * (state[1] - π)
    global anim[] = [state[1], state[2]]
end
