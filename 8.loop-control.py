#break 強制結束迴圈
 # while 布林值:
 #    break
 #  for 變數名稱 in 列表/字串
 #     break
#break 的簡易範例
n=1
while n<5:
    if n==3:
      break
    print(n) #印出迴圈中的n （0，1，2）
    n+=1
    print("最後的n:",n) #印出迴圈結束後的n


while True:
   data=input("請輸入字串到stop為止")
   if data. lower() =="stop":
      break
   print(data)
    



#continie 強制繼續下一圈
# while 布林值:
#     continue
# for 變數名稱 in 列表/字串
#     continue 
n=0
for x in [0,1,2,3]:
   if x%2==0:  #x被2整除 為2的倍數（取餘數為0)
      continue
   print(x)      #1,3
   n+=1
   print("最後的n:", n) #最後的n:2

for a in "python pygame":
   if a =="":
    pass
   else:print(a)

for a in "python pygame":
   if a!="":
     print(a)





# while 布林值:
#      若布林值為True，執行命令
#      回到上方，做一次的迴圈判斷
# else:
#      迴圈結束前，執行此區塊的命令
n=1
while n<5:
   print(n)
   n+=1
else:
   print(n) #迴圈結束前，印出5

sum=0
for n in range(11):
   sum+=n
else:
   print(sum) #印出0+1+2+3...+10的結果(55)


 #綜合範例：找出整數平方根
n=input("輸入ㄧ個正整數 :")
n=int(n) #轉換輸入成數字
for i in range(n): # i從0~n-1
   if i*i==n:
      print("整數平方根",i)
      break  #用break強制結束回圈時，不會執行else區塊
else:
   print("沒有整數平方根")

#Print the following pattern on the screen using for loop 
for i in range(0,4):
   print(" "*i+"#")
   i=i+1
for j in range(5,1,-1):
   print(""*i+"#")
   i=i-1
#
 #
  #
   #
    #
   #
  #
 #










