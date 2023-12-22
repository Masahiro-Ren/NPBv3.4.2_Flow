#!/bin/bash

# -------------- Special Requirements ----------
# BT, SP         - a square number of processes (1, 4, 9, ...)
# LU             - 2D (n1 * n2) process grid where n1/2 <= n2 <= n1
# CG, FT, IS, MG - a power-of-two number of processes (1, 2, 4, ...)
# EP, DT         - no special requirement
# ---------------------------------------------

#--------- pjsub option -----------
#PJM -L rscunit=fx
#PJM -L rscgrp=fx-small
#PJM -L node=8
#PJM --mpi proc=64
#PJM -L elapse=2:00:00
#PJM -j
#PJM -S

#--------- Program execution ------
# cg.D.x  dt.B.x  ep.D.x  ft.D.x  is.D.x  lu.D.x  mg.D.x  sp.D.x
PROGRAMS=(
	"cg"
	"ep"
	"ft"
	"is"
	"lu"
	"mg"
	"sp"
	"dt"
)

for PROGRAM in "${PROGRAMS[@]}"; do
	echo "======== ${PROGRAM} Executing ========="
	if [ "${PROGRAM}" = "dt" ]; then
		mpiexec ../bin/${PROGRAM}.B.x BH
	else
		mpiexec ../bin/${PROGRAM}.D.x
	fi
done 

