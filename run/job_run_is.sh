#!/bin/sh

# -------------- Special Requirements ----------
# The process number of IS must be the power of 2 (1, 2, 4, 8, ...)
# ---------------------------------------------

#--------- pjsub option -----------
#PJM -L rscunit=fx
#PJM -L rscgrp=fx-small
#PJM -L node=8
#PJM --mpi proc=64
#PJM -L elapse=00:10:00
#PJM -j
#PJM -S

#--------- Program execution ------
SIZE=${PJM_COMMENT}
mpiexec ../bin/is.${SIZE}.x
