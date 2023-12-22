#!/bin/sh

# -------------- Special Requirements ----------
# The process number of LU must 2D (n1 * n2) process grid where n1/2 <= n2 <= n1
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
mpiexec ../bin/lu.${SIZE}.x
