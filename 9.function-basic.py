#函式：程式碼包裝在ㄧ個區塊中，方便隨時呼叫使用
#定義函式
# def函式名稱（參數名稱）：
#    函式內部程式碼
x1=20
def myfun():
    x2=10 #區域變數 執行完後x2就不在
    print(x1,x2)

myfun()
print(x1,x2) #x2 不在

#modify global variable(x1) in defined myfun()
x1=20
def myfun():
    global x1 #一律用20
    x1=40
    print("in function, x1=",x1)
myfun()
print("out function,x1=",x1)

#定義函式
#函式內部的程式碼，若是沒有函式呼叫，就不會執行
def multiply(n1,n2):
    print(n1*n2)
#呼叫函式
multiply(3,4) #得到12 
value=multiply(3,4)
print(value) #得到12,none(回傳值)

def multiply(n1,n2):
    print(n1*n2)
    return n1*n2
value=multiply(3,4) 
print(value) #得到12(結果),12(回傳值)

#函式可以用來做程式的包裝:同樣的邏輯可以重複利用
def calculate(max):
   sum=0
   for n in range(1,max+1):
    sum=sum+n 
   print(sum)

calculate(10) #1+2+3...+10
calculate(20) #1+2+3...+20

#define
def ctof1(a):
    b=a*1.8+32
    print("華氏溫度為",b)
#call
temp=float(input("請輸入攝氏溫度："))
ctof1(temp)

def ctof1(a):
    b=a*1.8+32
    return b

#call
temp=float(input("請輸入攝氏溫度："))  #temp:input
temp_f=ctof2(temp)    #temp_f=output
print(temp_f)

#def function 
def ctof3(temp,wet):
    f=temp*1.8+32
    if wet>60:
        return f, "請開除濕機"
    else:
        return f,"不用開"
#call function
f1,s1=ctof3(32,21)
print(f1,s1)
f2,s2=ctof3(wet=80,temp=25)
print(f2,s2,sep="@@@")

#def function with default(預設值)
def ctof4(temp,wet=55):
    f=temp*1.8+32
    if wet>60:
        return f, "請開除濕機"
    else:
        return f,"不用開"
 #call function
f3,s3=ctof4(32,21)
print(f3,s3,sep="###")
f4,s4=ctof4(20)
print(f4,s4) #TEMP=20



#呼叫函式
#函式名稱（參數資料）
#定義出ㄧ個函式
def sayHello():
    print("Hello")
#呼叫上方函式的定義
sayHello()

#定義印出任何訊息的函式 
def say(msg):
    print(msg)
#呼叫上方函式的定義
say("Hello Function")
say("Hello Python")

#定義可做加法的函式
def add(n1,n2):
    result=n1+n2
    print(result)
#呼叫上方函式的定義
add(3,4)
add(7,8)



#回傳值 可在函式外部繼續操作資料
# def 函式名稱（參數名稱）：
#     函式內部的程式碼
#     return 結束函式，回傳none
#     return 資料 回傳「資料」
def multiply(n1,n2):
    print(n1*n2)
    return n1*n2
value=multiply(3,4)+multiply(10,5) #(3*4)+(10*5)
print(value)

#函式回傳none
def say(msg):
    print(msg)
    return #結束函式 回傳none
#呼叫函式，取得回傳值
value=say("Hello Funciton")
print(value) #印出none


#函式回傳Hello
def add(n1,n2):
    result=n1+n2
    return result
result= add (3+4)
print(result)
#呼叫函式，取得回傳值
value=add(3,4)
print (value) #印出7












