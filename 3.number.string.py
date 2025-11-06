#數字運算
x=3*6
x=2**3 #次方
x=2**0.5 #開根號
x=7%3  #取餘數（得1)=
x=3/6 #小數除法
x=3//6 #整數除法 （結果為零）
print(x)
x=2+3
print(x)
x+=1 #x=x+1 將變數中的數字+1
x-=1 #x=x-1
print(x)

#字串運算
s="Hell\"o" #\為跳脫 使符號做區隔
print(s)
s="Hello"+"World"
print(s)

s="Hello\nworld" #\n代表換行
s="""Hello World""" #三個雙引號也可
print(s)

s="hello"*3 #重複寫三次
print(s)

#字串會對內部字元編號(索引) 從0開始算起
s="Hello"
print(s[0])
s="Hello"
print(s[1:4]) #包含開頭 不包含結尾
print(s[1:])  #沒給結尾：全含

