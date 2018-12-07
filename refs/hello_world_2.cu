#include <stdio.h>
#define SIZE 1024

__global__ void VectorAdd(int *a, int *b, int *c, int n)
{
    int i = threadIdx.x;

    if (i < n)
        c[i] = a[i] + b[i];
}

int *a, *b, *c;

int main()
{
    // init
    a = (int *)malloc(SIZE * sizeof(int));
    b = (int *)malloc(SIZE * sizeof(int));
    c = (int *)malloc(SIZE * sizeof(int));
    for (int i = 0; i < SIZE; ++i)
    {
        a[i] = i;
        b[i] = i;
        c[i] = 0;
    }

    // cuda init
    int *ad, *bd, *cd;    
    int size = SIZE * sizeof(int);
    cudaMalloc(&ad, size);
    cudaMemcpy(ad, a, size, cudaMemcpyHostToDevice);
    cudaMalloc(&bd, size);
    cudaMemcpy(bd, b, size, cudaMemcpyHostToDevice);
    cudaMalloc(&cd, size);

    // cuda execute
    int dimGrid = 1;
    int dimBlock = SIZE;
    VectorAdd <<<dimGrid, dimBlock>>> (ad, bd, cd, SIZE);
    cudaDeviceSynchronize();

    // cuda result
    cudaMemcpy(c, cd, size, cudaMemcpyDeviceToHost);
    for (int i = 0; i < 10; ++i)
        printf("c[%d] = %d\n", i, c[i]);

    // cuda free
    cudaFree(ad);
    cudaFree(bd);
    cudaFree(cd);

    return 0;
}
