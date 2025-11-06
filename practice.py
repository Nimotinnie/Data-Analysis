#計算 1 + 2 + 3 + ... + N 的總和 ( Sum the Integers from 1 to N )
def sum_of_integers(N):
    total=0
    for i in range(1,1+N):
        total+=1
        return total
    
#計算1 * 2 + 2 * 3 + ... + (N - 1) * N的總和 ( Write a function to calculate 1 * 2 + 2 * 3 + ... + (N - 1) * N )
def calculate_sum(N):
    total=0
    for i in range(1,N):
        total+=i*(i+1)
        return total

# 在一個未排序數列中找到最大值的方法
def find_max(nums):
    if not nums:
        return None
    max_value=nums[0]
    for num in nums:
        if num>max_value:
         max_value=num 
         return max_value
        
number=[1,2,3,4,5]
max_value=find_max(nums)
print("最大數值：",max_value)

#在一個未排序數列中找到第二大的值的方法 ( Find second largest number in array )
def find_second_largest_number(num):
    if len(num)<2:
        return None
    max_value=float(-int)
    second_largest_num=float(-int)
    fo num in nums:
    if num>max_value:
          num=max_value
      elif num>second_largest_num:
          num=second_largest_num
          

    
   











