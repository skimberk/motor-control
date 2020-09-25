import math

max_sum = 1.1547
def svpwm_2(theta):
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
		return (0.0, b_scaled, a_scaled)
	else:
		# third_sector == 3
		return (b_scaled, 0.0, a_scaled)

class SVPWMController(object):
	def __init__(self):
		self.va = 0
		self.vb = 0
		self.vc = 0

		self.pulsea = 0
		self.pulseb = 0
		self.pulsec = 0

		self.estimated_bemfa = 0
		self.estimated_bemfb = 0

		self.bemfb = 0

		# self.multiplier = 1.0

	def step_sim(self, dt, elapsed, epoch, throttle, variables):
		theta = variables['theta']
		v = variables['V']

		ia = variables['ia']
		ib = variables['ib']
		ic = variables['ic']

		v *= 1

		period = 100
		percent_on = 0.5
		timer = epoch % period

		svpwm_theta = theta + math.pi / 2
		# svpwm_theta = self.multiplier * epoch / 1000.0
		# self.multiplier += 0.001

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

		# if self.pulsea == 0 or (timer >= period / 8 and (timer < self.pulsea or timer >= self.pulsea + period / 8)):
		if self.pulsea == 0 or timer >= self.pulsea + period / 10:
			self.estimated_bemfa = self.va - ia - 14
		else:
			self.estimated_bemfa = 0

		if self.pulseb == 0 or timer >= self.pulseb + period / 10:
			self.estimated_bemfb = self.vb - ib - 14
		else:
			self.estimated_bemfb = 0

		self.bemfb = variables['bemfb']

		return self.va, self.vb, self.vc

	def get_variables(self):
		return [0, 0, 0, 0, self.estimated_bemfa, 0]

	def get_errors(self):
		return [self.bemfb, self.estimated_bemfb]

def make_controller():
	return SVPWMController()
