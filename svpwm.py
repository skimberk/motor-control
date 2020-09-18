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

# Maximum sum of coefficients
# (cos(pi/6) - (1 / sqrt(3)) * sin(pi/6) + (2 / sqrt(3)) * sin(pi/6))
# = 1 / (2 * sqrt(3)) + sqrt(3) / 2
# = 1.154700538379251529018297561003914911295203502540253752037204652
max_coefficients = vector_coefficients(math.pi / 6)
max_sum = max_coefficients[0] + max_coefficients[1]

def svpwm(theta, period, duty):
	sextant_theta = math.fmod(theta, math.pi / 3)
	sextant = int(theta / (math.pi / 3)) % 6
	vector_order = vector_orders[sextant]

	coeffs = vector_coefficients(sextant_theta)

	if vector_order[2]:
		coeffs = (coeffs[1], coeffs[0])

	first_vector = vector_order[0]
	second_vector = (
		vector_order[1][0],
		vector_order[1][1],
		vector_order[1][2]
	)

	on_time = period * duty
	off_time = period - on_time

	scale = on_time / max_sum

	on_times = (
		scale * (coeffs[0] * first_vector[0] + coeffs[1] * second_vector[0]) + off_time / 2,
		scale * (coeffs[0] * first_vector[1] + coeffs[1] * second_vector[1]) + off_time / 2,
		scale * (coeffs[0] * first_vector[2] + coeffs[1] * second_vector[2]) + off_time / 2
	)

	return on_times

# for theta in numpy.linspace(0, math.pi / 3, num=100, endpoint=False):
# 	print(theta, vector_coefficients(theta))

for theta in numpy.linspace(0, 2 * math.pi, num=100, endpoint=False):
	print(theta, svpwm(theta, 1, 1))
