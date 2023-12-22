#!/bin/sh

# -------------- Special Requirements ----------
# No special reuqirements
# The largest size of DT is B
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
GRAPH_NAME="BH"
mpiexec ../bin/cg.${SIZE}.x ${GRAPH_NAME}
