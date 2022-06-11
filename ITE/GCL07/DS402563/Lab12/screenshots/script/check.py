#! /usr/bin/env python3

import subprocess
import sys
import time

if len(sys.argv) < 2:
    print("Pass deployment name as program argument.")
    sys.exit(1)

deployment = sys.argv[1]
ready = f'deployment "{deployment}" successfully rolled out'

start = time.perf_counter()
r = subprocess.check_output(["kubectl", "rollout", "status", f"deployment/{deployment}"])
end = time.perf_counter()

if r.decode("ascii").rstrip("\n") == ready:
    print("Deployment has already been created/updated.")
else:
    print(f"Deployment time (since script execution start): {end - start}")
    if end - start > 60:
        print("Time exceeded (60 seconds)")


