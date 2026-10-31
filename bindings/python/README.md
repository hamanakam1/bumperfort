# Python bindings

Build the shared library first, then point `load()` at it.

```bash
fpm build --profile release
# library lands under build/...
```

Then in Python:

```python
from bumperfort import load, cosine
import numpy as np
load("path/to/libbumperfort.so")  # or .dylib on macOS
print(cosine(np.array([1,2,3],dtype=np.float32), np.array([1,2,3],dtype=np.float32)))
```
