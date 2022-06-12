FROM ptrk00/mle_rt

ENTRYPOINT ["/bin/bash", "-c",  "cp /build/mle usr/bin && mle"]