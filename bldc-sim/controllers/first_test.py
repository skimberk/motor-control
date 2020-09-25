import math

class FOCController(object):
	def __init__(self):
		self.multiplier = 1.0
		self.vs = (0, 0, 0)
		self.Is = (0, 0, 0)

		self.bemfa_estimate = 0.0
		self.i_estimate_filtered = 0.0

		self.test_filtered = 0.0

	def step_sim(self, dt, elapsed, epoch, throttle, variables):
		theta = variables['theta']
		v = variables['V']

		ia = variables['ia']
		ib = variables['ib']
		ic = variables['ic']

		r_estimate = 1
		v_from_battery = v - variables['bemfa']
		i_estimate = v_from_battery / r_estimate
		self.i_estimate_filtered += 0.2 * (i_estimate - self.i_estimate_filtered)
		
		# if theta <= math.pi / 3:
		# 	return v, -v, 0
		# elif theta <= 2 * math.pi / 3:
		# 	return v, 0, -v
		# elif theta <= 3 * math.pi / 3:
		# 	return 0, v, -v
		# elif theta <= 4 * math.pi / 3:
		# 	return -v, v, 0
		# elif theta <= 5 * math.pi / 3:
		# 	return -v, 0, v
		# else:
		# 	return 0, -v, v

		# theta += math.pi / 6
		# theta = self.multiplier * epoch / 1000.0
		# self.multiplier += 0.001

		if True:
			sextant = int((theta + math.pi / 2 + math.pi / 6) / (math.pi / 3)) % 6

			if sextant == 0:
				self.vs = (-v, v / 2, v / 2)
			elif sextant == 1:
				self.vs = (-v / 2, -v / 2, v)
			elif sextant == 2:
				self.vs = (v / 2, -v, v / 2)
			elif sextant == 3:
				self.vs = (v, -v / 2, -v / 2)
			elif sextant == 4:
				self.vs = (v / 2, v / 2, -v)
			else:
				self.vs = (-v / 2, v, -v / 2)

			self.Is = (ia, ib, ic)
			return self.vs

			# if math.pi / 2 - math.pi / 6 <= theta <= math.pi / 2 + math.pi / 6:
			# 	return v, -v / 2, -v / 2
			# elif ...:
			# 	return v / 2
			# elif math.pi / 2 + math.pi / 3 <= theta <= 3 * math.pi / 2:
			# 	return -v / 2, v, -v / 2
			# else:
			# 	return -v / 2, -v / 2, v

		# print(math.sin(theta + math.pi / 4), math.sin(theta + math.pi / 3 + math.pi / 4), math.sin(theta + 2 * math.pi / 3 + math.pi / 4))
		return v * math.sin(theta), v * math.sin(theta + 4 * math.pi / 3), v * math.sin(theta +  2 * math.pi / 3)

	def get_variables(self):
		# Not sure what this does
		return [0, 0, 0, self.i_estimate_filtered, self.vs[0] - self.Is[0], 0]

	def get_errors(self):
		# Not sure what this does
		return [0, 0]

def make_controller():
	return FOCController()
