#include <stdio.h>
#include <stdlib.h>

int* twoSum(int* nums, int numsSize, int target);

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* twoSum(int* nums, int numsSize, int target) {
    int* p = (int *)malloc(2 * sizeof(int));
    for(int i=0;i<numsSize;i++)
    {
        for(int j=i+1; j<numsSize; j++)
        {
            if(nums[i]+nums[j]==target)
            {
                p[0]=i;
                p[1]=j;
                return p;
            }
        }
    }
   
    return p;
}

int main()
{
	int nums[2]={3,3};
	int *p;
	p=twoSum(nums,2,6);
	for(int i=0; i<2; i++)
	{
		printf("p[%d]=%d\n", i,p[i]);
	}
	free(p);
}
