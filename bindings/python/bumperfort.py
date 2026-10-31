import ctypes

lib = ctypes.CDLL("./libbumperfort.so")

def cosine(a, b):
    n = len(a)
    arr = ctypes.c_float * n
    pa = arr(*a)
    pb = arr(*b)
    lib.bumper_cosine.restype = ctypes.c_float
    return lib.bumper_cosine(pa, pb, n)
