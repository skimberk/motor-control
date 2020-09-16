import math
import numpy

# Generate lookup table?? Maybe eventually
# if it turns out to be slow

vector_sequence = [
	(1, 0, 0), # 0
	(1, 1, 0), # 60
	(0, 1, 0), # 120
	(0, 1, 1), # 180
	(0, 0, 1), # 240
	(1, 0, 1)  # 300
]

vector_orders = [
	# First     Second     Flipped   Range
	((1, 0, 0), (1, 1, 0), False), # [0, 60)
	((0, 1, 0), (1, 1, 0), True),  # [60, 120)
	((0, 1, 0), (0, 1, 1), False), # [120, 180)
	((0, 0, 1), (0, 1, 1), True),  # [180, 240)
	((0, 0, 1), (1, 0, 1), False), # [240, 300)
	((1, 0, 0), (1, 0, 1), True)   # [300, 360)
]

def vector_coefficients(theta):
	if not(0 <= theta <= math.pi / 3):
		raise Exception('theta must be between 0 and pi/3 (0 and 60 degrees)')

	x = math.cos(theta)
	y = math.sin(theta)

	return (x - (1 / math.sqrt(3)) * y, (2 / math.sqrt(3)) * y)

def svpwm(theta):
	sextant_theta = math.fmod(theta, math.pi / 3)
	sextant = int(theta / (math.pi / 3)) % 6
	vector_order = vector_orders[sextant]

	coeffs = vector_coefficients(sextant_theta)

	if vector_order[2]:
		coeffs = (coeffs[1], coeffs[0])

	return (theta, sextant, sextant_theta, coeffs, vector_order[0], vector_order[1])

# for theta in numpy.linspace(0, math.pi / 3, num=100, endpoint=False):
# 	print(theta, vector_coefficients(theta))

for theta in numpy.linspace(0, 2 * math.pi, num=100, endpoint=False):
	print(svpwm(theta))
