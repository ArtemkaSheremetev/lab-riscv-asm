#include <stdio.h>

#define N 4
#define M 4

void process(int n, int m, int matrix[M][N], int* result){
    int max = 0;
    int temp_max = 0;
    for(int i = 0; i < m; ++i){
        temp_max = 0;
        for(int j = 0; j < n; ++j)
            temp_max += matrix[m][n];
        if(temp_max > *result)
            max = temp_max;
    }
    *result = max;
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result[M];
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, result);

    printf("%d\n", result);

    return 0;
}