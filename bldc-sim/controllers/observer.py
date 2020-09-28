import math

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

def clarke(a, b, c):
	sqrt3 = math.sqrt(3)

	return (
		1 * a - 1/2 * b - 1/2 * c,
		0 * a + sqrt3/2 * b - sqrt3/2 * c,
		1/2 * a + 1/2 * b + 1/2 * c
	)

class SVPWMController(object):
	def __init__(self):
		self.va = 0
		self.vb = 0
		self.vc = 0

		self.pulsea = 0
		self.pulseb = 0
		self.pulsec = 0

		self.measured_ia = 0
		self.estimated_bemfa = 0
		self.estimated_ia = 0
		self.integral_a = 0

		self.filtered_ia = 0
		self.filtered_ib = 0
		self.filtered_ic = 0

		self.current_angle = 0
		self.theta = 0

		self.multiplier = 2

	def step_sim(self, dt, elapsed, epoch, throttle, variables):
		theta = variables['theta']
		self.theta = theta
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
			self.va = -v
		if self.pulseb <= timer:
			self.vb = -v
		if self.pulsec <= timer:
			self.vc = -v

		if timer == 0:
			self.filtered_ia += 0.25 * (ia - self.filtered_ia)
			self.filtered_ib += 0.25 * (ib - self.filtered_ib)
			self.filtered_ic += 0.25 * (ic - self.filtered_ic)

			clarke_transformed = clarke(self.filtered_ia, self.filtered_ib, self.filtered_ic)
			self.current_angle = math.pi - math.atan2(clarke_transformed[0], clarke_transformed[1])
			self.measured_ia = ia
			self.estimated_bemfa = -ia - 1.8 * v
		# 	r = 1
		# 	real_voltage = v - self.estimated_bemfa

		# 	# Change constant for filtering
		# 	self.estimated_ia = 0.5 * (real_voltage / r - self.estimated_ia)

		# 	ia_error = (-ia) - self.estimated_ia
		# 	print(ia_error)
		# 	self.integral_a += ia_error

		# 	p = 0.05
		# 	i = 0.01

		# 	self.estimated_bemfa = -(p * ia_error + i * self.integral_a)

		return self.va, self.vb, self.vc

	def get_variables(self):
		return [0, self.current_angle, self.vb, self.filtered_ia, self.estimated_bemfa, 0]

	def get_errors(self):
		return [0, 0]

def make_controller():
	return SVPWMController()
