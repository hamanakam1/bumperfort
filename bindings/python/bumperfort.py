import ctypes
import numpy as np
from pathlib import Path

_lib = None

def load(libpath=None):
    global _lib
    if libpath is None:
        libpath = Path("./build/gfortran_*/bumperfort/libbumperfort.dylib")
    _lib = ctypes.CDLL(str(libpath))
    _lib.bumper_cosine.argtypes = [ctypes.POINTER(ctypes.c_float),
                                   ctypes.POINTER(ctypes.c_float),
                                   ctypes.c_size_t]
    _lib.bumper_cosine.restype = ctypes.c_float

def cosine(a: np.ndarray, b: np.ndarray) -> float:
    a = np.ascontiguousarray(a, dtype=np.float32)
    b = np.ascontiguousarray(b, dtype=np.float32)
    return _lib.bumper_cosine(a.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
                              b.ctypes.data_as(ctypes.POINTER(ctypes.c_float)),
                              a.size)
