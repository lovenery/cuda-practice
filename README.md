# cuda-practice

## Wave equation

- https://en.wikipedia.org/wiki/Wave_equation

## Development Environment

- Install CUDA SDK: https://developer.nvidia.com/cuda-downloads

## Build

```bash
# You can use gcc to compile serial_wave.c
gcc serial_wave.c -o serial_wave -lm
time ./serial_wave 12345 54321

# Use nvcc to compile cuda_wave.cu
nvcc cuda_wave.cu -o cuda_wave
time ./cuda_wave 12345 54321
time ./cuda_wave 1000000 1000000
```

## References

- https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html
- hello_world.c / hello_world.cu: https://www.youtube.com/watch?v=2EbHSCvGFM0