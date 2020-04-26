NVCC     = /opt/cuda/bin/nvcc
NVPROF   = /opt/cuda/bin/nvprof --unified-memory-profiling off 
PROGRAMS = add add_cuda add_block add_grid
NVPROGRAMS = add_cuda add_block add_grid

all: $(PROGRAMS) profile

add: add.cpp
	clang++ add.cpp -o add

add_cuda: add.cu
	$(NVCC) add.cu -o add_cuda

add_block: add_block.cu
	$(NVCC) add_block.cu -o add_block

add_grid: add_grid.cu
	$(NVCC) add_grid.cu -o add_grid

clean:
	rm $(PROGRAMS)

profile: $(NVPROGRAMS)
	$(NVPROF) ./add_cuda
	$(NVPROF) ./add_block
	$(NVPROF) ./add_grid


