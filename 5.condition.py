#判斷式
#x=input("請輸入數字:") #取得字串形式的使用者輸入
#x=int(x) #將字串型態轉換成數字型態
#if x>200:
  #  print("大於200")
#elif x>100:
 #   print("x大於100,小於等於200")
#else:
 #   print("小於等於100")



#if True:
 #   print("True 執行") #True跑上面
#else:
 #   print("False 執行") #False跑下面

#四則運算
n1=int(input("請輸入數字一"))
n2=int(input("請輸入數字二"))
op=input("請輸入運算：+,-,*,/")
if op=="+":
    print(n1+n2)
elif op=="-":
    print(n1-21)
elif op=="*":
    print(n1*n2)
elif op=="/":
     print(n1/n2) 
else :
    print("不支援運算")



#成績及格
score=float(input("請輸入成績："))
if score>=60:
    print("pass")
else:
    print("Fail")

#判斷幾數、偶數
num=int(input("請輸入數字:"))
if num%2==1:
    print("odd")
else:
    print("even")

 #找出a,b,c中最大的數字
a,b,c=3,5,7
x=0
if a<b:
    if b<c:
        x=c
else:  #a>=b
    if a>c:
        x=a
    else:  #a<=c
        x=c
print("x")

#請撰寫一個Python程式，它可以要求使用者輸入0-100的分數， 
# 然後依據90以上(含)、89-80、79-70、69-60、59以下(含)等級距， 
# 將該分數的劃分為A, B, C, D, E
score=float(input("請輸入成績:"))
if score>=90:
    print("A")
elif score>=80:
    print("B")
elif score>=70:
    print("C")
elif score>=60:
    print("D")
else:
    print("E")
#1. 計算BMI的程式
#請撰寫一個Python程式，它可以要求使用者輸入身高(cm)和體重(kg)，然後計算BMI等於體重(公斤)/身高**2，
 #若低於18.5 (不含) ，就印出”過輕“;
 #若介於18.5~24 (不含) ，就印出”正常“; ◦ 若超過24 ~ 27 (不含) ，就印出”過重“; ◦ 若超過27以上 ，就印出”肥胖“
tall=float(input("請輸入身高"))
weight=float(input("請輸入體重"))
BMI=tall/weight**2
if BMI<18.5:
    print("過輕")
elif 18.5<BMI<24:
    print("正常")
elif 24<BMI<27:
    print("過重")
else:
    print("肥胖")


 #讓使用者輸入年後印出閏年或平年(閏年判斷方式是: 四年一閏，逢一百年不閏，但四百年有閏)
year=int(input("請輸入年份"))
if year%4==0:
      if year%400==0:
         print("閏年")
else:
    print("平年")




#請用Python設計一個輸入成績的程式，讓使用者輸入學生姓名 及成績後並判斷他的成績等第及GPA，
#印出如”林小明的Python成 績為92.65分，他的成績等第是A，GPA=4”
 #(成績分數顯示至小數 點後兩位，GPA顯示至整數位) 。
name=str(input("請輸入學生姓名"))
score=float(input("請輸入成績"))
if score>=80:
    print("%s的Python成績：%d分，他的成績等第是A，GPA=4" % (name,score))
elif score>=70:
   print("%s的Python成績：%d分，他的成績等第是B，GPA=3" % (name, score))
elif score>=60:
   print("%s的Python成績：%d分，他的成績等第是C，GPA=2" % (name, score))
else:
    print("%s的Python成績：%d分，他的成績等第是D，GPA=1" % (name, score))
          

#如果你在一家零售店幫消費的客人結帳，你可能需要快速地挑出合適且數量正確的鈔票與零錢。假設客人的消費金額 a
# 與其給客人五張 100 元，不如給他一張 500 元；與其給客人兩個 50 元，不如給他一張 100 元……依此類推。

# 以下是一些範例：

# 如果客人消費 200 元，你應該找給他 1 張 500 元和 3 張 100 元。

# 如果客人消費 286 元，你應該找給他 1 張 500 元、2 張 100 元、1 個 10 元和 4 個一元。

# 輸入輸出格式
# 在每筆測試資料中，會有一個整數 a代表客人的消費金額，
# a會介於 1 到 999 之間（包含 1 跟 999）。之後
# 你會依照題目指定的規則找出每種面額的鈔票或銅板應該要給幾張或幾個，
# 然後由面額大至面額小依序輸出所需鈔票張數或銅板個數，但如果不應該找給客人某個面額的鈔票或銅板，就跳過該面額不要輸出。
# 因為這樣一來可能只輸出少於 6 個數字，會不知道怎麼對應到面額，因此現在要把面額與所需張數（個數）成對地輸出，
# 中間用一個逗點和一個空格隔開，而面額與面額之間用一個分號和一個空格隔開。


a=int(input())
result=[]
r=1000-a
denominations=[500,100,50,10,5,1]
for d in denominations:
  if r>=d:
    count=r//d
    r=r%d
    result.append(str(d) + ", " + str(count))
    print("; " .join(result))
   