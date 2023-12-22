# Configurations and job scripts of NAS Parallel Benchmark (NPB) on FLOW

# Download
NPB version : 3.4.2
Homepage : `https://www.nas.nasa.gov/software/npb.html`
# Set-up & Compile (only MPI tests)
## 1. Decompress
```
tar -zxvf NPB3.4.2.tar.gz
```
## 2. create make.def
```
cd ./NPB3.4.2/NPB3.4-MPI/config
cp ./make.def.template make.def
```
## 3. modify the compiler, which depends on your machine
```
vim make.def
```
On the FLOW
```
# Fortran mpi compiler
MPIFC = mpifrtpx
# C mpi compiler
MPICC = mpifccpx
# Utilities C 
CC = gcc -g

# Recommand Options
FFLAGS = -O3 -Kfast
CFLAGS = -O3 -Kfast
```
## 4. create suite.def
```
# Also in config directory
cp ./suite.def.template suite.def
```
The contents of suite.def looks like below, where 
the first column is the application name, the second column is problem size and  
the third column is process number (which is optional, I wonder ...)
```
ft S 1
mg S 1
sp S 1
lu S 1
bt S 1
is S 1
ep S 1
cg S 1
dt S 1
```
## 5. Compilation
Go back to the `NPB3.4-MPI` dierctory
- Compile all applications
  ```
  make suite
  ```
- Compile 1 application
  ```
  make <Application Name> CLASS=<Problem Size>
  ```

Simple configurations were created, `config/make.def` and `config/suite.def`

# Execution on FLOW
Job scripts are in `run`
- Run all tests
  ```
  pjsub job_run_all.sh
  ```
- Run single test
  ```
  pjsub --comment <Problem size> job_run_<Application Name>.sh
  ```
The problem sizes of job_run_all.sh script are all D. It is a fair size since some applications caused memory overflow when problem size is larger than D on FLOW.