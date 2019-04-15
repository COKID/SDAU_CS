#include <stdio.h>

void swap(int* a, int *b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void sort(int* arr, int len)
{
    if (len <= 1) return;
    int x = arr[len-1];
    int i = 0, j = 0;
    while (j < len - 1)
    {
        if (arr[j] < x)
            swap(&arr[i++], &arr[j]);
        j++;
    }
    swap(&arr[i], &arr[len-1]);
    sort(arr, i);
    sort(arr + i + 1, len - i - 1);
}

int main()
{
    int i, n, a[200];
    scanf("%d", &n);
    for (i = 0; i < n; i++) scanf("%d", &a[i]);
    sort(a, n);
    for (i = 0; i < n; i++) printf("%d ", a[i]);
    printf("\n");
    return 0;
}
