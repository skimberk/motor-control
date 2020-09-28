import math
import numpy as np

sqrt3 = math.sqrt(3)

def normalize_angle(theta):
	return theta - 2 * math.pi * math.floor(theta / (2 * math.pi))

max_sum = 1.1547
def svpwm_2(theta):
	theta = normalize_angle(theta)
	third_sector_total = int(theta / (2 * math.pi / 3))
	third_sector = third_sector_total % 3
	third_sector_theta = theta - third_sector_total * (2 * math.pi / 3)

	x = math.cos(third_sector_theta)
	y = math.sin(third_sector_theta)

	sqrt3 = math.sqrt(3)

	a = (1 / sqrt3) * y + x
	b = (2 / sqrt3) * y

	a_scaled = a / max_sum
	b_scaled = b / max_sum

	if third_sector == 0:
		return (a_scaled, b_scaled, 0.0)
	elif third_sector == 1:
		return (0.0, a_scaled, b_scaled)
	else:
		# third_sector == 3
		return (b_scaled, 0.0, a_scaled)

def clarke_old(a, b, c):
	return (
		1 * a - 1/2 * b - 1/2 * c,
		0 * a + sqrt3/2 * b - sqrt3/2 * c,
		1/2 * a + 1/2 * b + 1/2 * c
	)

clarke = 2/3 * np.array([[1, -1/2, -1/2],
						 [0, sqrt3/2, sqrt3/2],
						 [1/2, 1/2, 1/2]])

# Got constants from simconstants.py
R = (3 / 2) * 0.52
L = (3 / 2) * 0.000036

psi = 0.0137 # Flux linkage ???? not sure, so I just put the bemf constant
gamma = 1.0 # Observer gain

def xdot(x, i, v):
	y = -R*i + v
	n = x - L*i
	return y + gamma/2 * n * (np.square(psi) - (np.square(n[0]) + np.square(n[1])))

def theta_from_x_i(x, i):
	return np.arctan2(x[1] - L*i[1], x[0] - L*i[0])

x = np.array([1.0, 2.0])
i = np.array([1.0, 1.0])
v = np.array([1.0, 1.0])

for j in range(100):
	x += 0.01 * xdot(x, i, v)
	print(x, theta_from_x_i(x, i))

class SVPWMController(object):
	def __init__(self):
		self.va = 0
		self.vb = 0
		self.vc = 0

		self.pulsea = 0
		self.pulseb = 0
		self.pulsec = 0

		self.multiplier = 2

	def step_sim(self, dt, elapsed, epoch, throttle, variables):
		theta = variables['theta']
		v = variables['V']

		ia = variables['ia']
		ib = variables['ib']
		ic = variables['ic']

		v *= throttle / 100

		period = 20
		percent_on = 0.8
		timer = epoch % period

		# svpwm_theta = theta + math.pi / 2
		svpwm_theta = self.multiplier * epoch / 1000.0
		# self.multiplier += 0.00001

		if timer == 0:
			duties = svpwm_2(svpwm_theta)

			self.pulsea = duties[0] * period * percent_on
			self.pulseb = duties[1] * period * percent_on
			self.pulsec = duties[2] * period * percent_on

			if self.pulsea > 0:
				self.va = v
			if self.pulseb > 0:
				self.vb = v
			if self.pulsec > 0:
				self.vc = v

		if self.pulsea <= timer:
			self.va = 0
		if self.pulseb <= timer:
			self.vb = 0
		if self.pulsec <= timer:
			self.vc = 0

		return self.va, self.vb, self.vc

	def get_variables(self):
		return [0, 0, 0, 0, 0, 0]

	def get_errors(self):
		return [0, 0]

def make_controller():
	return SVPWMController()
