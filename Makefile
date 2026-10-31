FC ?= gfortran
FFLAGS ?= -O3 -ffast-math -fcoarray=single
SRC := $(wildcard src/*.f90)
all:
	$(FC) $(FFLAGS) -o bumperfort $(SRC)
test:
	$(FC) $(FFLAGS) -o test_bounce test/test_bounce.f90 $(SRC) && ./test_bounce
leaks:
	leaks --atExit -- ./bumperfort || true
