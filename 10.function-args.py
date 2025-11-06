#1.參數的預設資料
# def 函式名稱（參數名稱＝預設資料）
#     函式內部的程式碼

#參數msg預設資料為"Hello"
def say(msg="Hello"):
    print(msg)
#印出Hello Function
say ("Hello Function")
say() #印出預設資料Hello(沒特別講就放Hello)

def power(base,exp=0):  #base=3,exp=2,power=9 exp預設值0
    print(base**exp)  #3的2次方
power(3,2) #得到9
power(4) #exp=0 結果得1



#2.使用參數名稱對應(可交換位子呼叫)
# def 函式名稱（名稱1，名稱2）
#     函式內部的程式碼
#呼叫函式，以參數名稱對應資料
# 函式名稱（名稱2=3, 名稱1=5)

#定義一個可以做加法的函式
def divide (n1,n2):
    result=n1/n2
    print(result)
divide(2,4) #印出0.5
divide(n2=2,n1=4) #印出2.0

#3.無限/不定參數資料
#def 函式名稱（“*無限參數“）:
# 無限參數 以Tuple 資料型態處理
#        函式內部的程式碼
#呼叫函式 可傳入無限數量的參數
# 函式名稱（資料一，資料二，資料三）

#函式接受無限參數msgs
def say (*msgs):
    #以 Tuple 方式處理
    for msg in msgs:
        print(msg)
    say("Hello","Arbitary","Arguments")
#呼叫函式，傳入三個參數資料

def avg(*ns):
    sum=0
    for n in ns:
      sum=sum+n
      print(sum/len(ns)) #總和/列表長度
avg(3,4) #得3.5
avg(3,5,10) #得6.0
avg(1,4,-1,-8) #得-1.0


 


