import numpy as np
import ctypes
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent))
from bumperfort import load, cosine

if __name__ == "__main__":
    # adjust path to your built library
    load(Path("../build/libbumperfort.so"))
    a = np.array([1.0,2.0,3.0], dtype=np.float32)
    b = np.array([1.0,2.0,3.0], dtype=np.float32)
    print("cosine:", cosine(a,b))
