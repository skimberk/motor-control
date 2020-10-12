import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation

# def _lambdifygenerated(m_r, m_w, g, l, r, tau, thetar, thetardot, thetaw, thetawdot):
# 	return (
# 		(-thetawdot*r*cos(thetar)/l - g*sin(thetar)/l - tau/(l**2*m_r)
# 		(thetardot*l*m_r*r*cos(thetar) + thetaw*m_r*r**2 + tau)/(m_w*r**2))
# 	)

def _lambdifygenerated(m_r, m_w, g, l, r, tau, thetar, thetardot, thetaw, thetawdot):
	return (
		-((1/2)*thetardot**2*l**2*m_r**2*r*sin(2*thetar) + g*l*m_r**2*r*sin(thetar) + g*l*m_r*m_w*r*sin(thetar) + l*m_r*tau*cos(thetar) + m_r*r*tau + m_w*r*tau)/(l**2*m_r*r*(m_r*sin(thetar)**2 + m_w)),
		(thetardot**2*l**2*m_r*r*sin(thetar) + (1/2)*g*l*m_r*r*sin(2*thetar) + l*tau + r*tau*cos(thetar))/(l*r**2*(m_r*sin(thetar)**2 + m_w))
	)

l = 3
r = 0.5
g = 1
m_r = 10
m_w = 1
tau = 0

def model(x):
	thetar = x[0]
	thetaw = x[1]
	thetardot = x[2]
	thetawdot = x[3]

	return np.array([
		thetardot,
		thetawdot,
		-((1/2)*thetardot**2*l**2*m_r**2*r*np.sin(2*thetar) + g*l*m_r**2*r*np.sin(thetar) + g*l*m_r*m_w*r*np.sin(thetar) + l*m_r*tau*np.cos(thetar) + m_r*r*tau + m_w*r*tau)/(l**2*m_r*r*(m_r*np.sin(thetar)**2 + m_w)),
		(thetardot**2*l**2*m_r*r*np.sin(thetar) + (1/2)*g*l*m_r*r*np.sin(2*thetar) + l*tau + r*tau*np.cos(thetar))/(l*r**2*(m_r*np.sin(thetar)**2 + m_w))
	])

def rk4(f, x, h):
	k1 = f(x)
	k2 = f(x + k1 * h/2)
	k3 = f(x + k2 * h/2)
	k4 = f(x + k3 * h)

	return x + h * (k1 + 2*k2 + 2*k3 + k4) / 6

state = np.array([2.5, -15, 0, 0])

figure, axes = plt.subplots()

circle = plt.Circle((0, r), r, fill=False)
rotation_indicator, = plt.plot([0, r], [r, r])
rod, = plt.plot([0, 0], [r, r + l])

last_error = np.pi - state[0]

def animate(i):
	global state
	global tau
	global last_error

	error = np.pi - state[0]
	tau = 100 * error + 20 * (error - last_error) / 0.05
	last_error = error

	state = rk4(model, state, 0.05)

	circle.center = [r * state[1], r]
	rotation_indicator.set_data([r * state[1], r * state[1] + r * np.cos(-state[1])], [r, r + r * np.sin(-state[1])])
	rod.set_data([r * state[1], r * state[1] + l * np.cos(state[0] - np.pi/2)], [r, r + l * np.sin(state[0] - np.pi/2)])
	return [circle, rotation_indicator, rod]

anim = matplotlib.animation.FuncAnimation(figure, animate, interval=50, blit=True)

axes.add_artist(circle)
plt.title('Rod on Wheel')
plt.xlim(-10, 10)
plt.ylim(-5, 5)
axes.set_aspect(1)

plt.show()