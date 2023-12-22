#!/bin/sh

# -------- Special Requirements -----------
# No special requirements on process number
# -----------------------------------------

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
mpiexec ../bin/ep.${SIZE}.x
