#while 迴圈
#while 布林值:
#        為 True，執行命令
#        回到上方 做下一次的迴圈判斷

n=1
while n<5:
       print(n)
       n+=1
       #印出1,2,3,4

# 1+2+3+4...+10
n=1
sum=0 #記錄累加的結果
while n<=10:
    sum=sum+n
    n+=1
#print(sum)



#for 迴圈
#for 變數名稱 in 列表/字串：
#    將列表中的項目 或 字串中的字元 逐一取出
#x是計數器的變數名稱
for x in [3,5,1]:
       print(x) 
for x in "Hello":
       print(x) #H e l l o
for x in range(5):
       print(x) #0,1,2,3,4
for x in range(5,10):
       print(x) #5,6,7,8,9

sum=0
for x in range(1,11):
       sum=sum+x
print(sum)


#for i in range()/list/string:
#2+3+4+...+10=?
sum=0
for i in range(2,11):   #2-10
    sum+=i
    print(sum)

#請計算1+2+3+...+100，印出總和 
sum=0
for i in range(1,101):
      sum+=sum
      print(sum)
      

#請計算1~100，印出偶數的總和(2+..+100)
#法ㄧ
sum=0
for i in range(2,101,2):
      sum+=i
      print(sum)
#法二
sum=0
for i in range(1,101):
      if i%2==0:
            sum+=1
            print(sum)

#請找出1-100之間可以被13整除的數字，並印出結果
for i in range(1,101):
      if i%13==0:
            print(i)

 #請寫出九九乘法表，並印出
for x in range(1,10):
        for y in range(1,10):
            result=x*y
            print("%d*%d=%d" %(x,y,result), end="")
            print("\n")

#請加總-1+(-3)+(-5)+...+(-99)
sum=0
for i in range(-1,-100,-2):
      sum+=i
      print(sum)


      


