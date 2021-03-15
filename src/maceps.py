import numpy as np

def maceps32():
    '''
    The following code calculates the 32-bit machine precision of a single data
    value. It is reliant on the numpy package.
    '''
    x, xStar = np.float32(1), np.float32(1)
    epsilon = np.float32(1)
    iterationCount = 0

    while abs((xStar + epsilon) - x) != 0:
        print(f"iteration {iterationCount}: " + str((xStar + epsilon) - x))
        epsilon = np.float32(epsilon * .5)
        iterationCount += 1

    print("finish")

def maceps64():
    '''
    The following code calculates the 64-bit precision of the built-in Python data
    type, float.
    '''
    x, xStar = float(1), float(1)
    epsilon = float(1)
    iterationCount = 0

    while abs((xStar + epsilon) - x) != 0:
        print(f"iteration {iterationCount}: " + str((xStar + epsilon) - x))
        epsilon = float(.5 * epsilon)
        iterationCount += 1

    print("finish")
