#集合的運算Set set() create a empty set
s1={3,4,5}
print(10 in s1) #False
s1={3,4,5}
s2={4,5,6,7}
s3=s1&s2 #交集 取兩個集合中，相同的資料
print(s3) #4,5

s3=s1|s2 #聯集：取兩個集合中的所有資料，但不重複
print(s3) #3,4,5,6,7

s3=s1-s2 #差集：從s1中，減去和s2重疊的部分
print(s3) #3

s3=s1^s2 #反交集：取兩個集合中，不重疊的部分 (s1|s2)-(s1&s2)
print(s3) #3,6,7

s=set("Hello") #把字串中的字母拆解成集合 set(字串)
print("H" in s) #True


#set有運算子 比較關係
s1={1,2,3}
s2={1,2,3,4}
s3={4,5,6}
print(s1<=s2) #True 

#set 可拆解字母 並刪除重複者
s1=input("input some words:")
s2=set(s1)
print(s2) #{"i","love", "u"}


#remove符號
s1=input("input some words:")
s2=list(set(s1))
s3=[]
for i in s2:
   if i=="!":
      pass
   else:
      s3.append(i)
      print(s3)



dict1={} #create an empty dict
#dict1 save 3 students (key:student_id, value:name)
for i in range(3):
    s_id=int(input("input student_id:"))
    s_name=input("input student_name:")
    dict1[s_id]=s_name #add data
print(dict1)
#{111:"aaa", 222:"bbb", 333:"ccc"}

#delete data
del dict[111]
print(dict1)

#modify data
dict[222]="fff"

#dict不支援運算因子 因為鍵值沒有先後順序
dict1={} 
i=0
while i<3:
    s_acc=(input("input account:"))
    s_pwd=input("input password")
    if s_acc in dict1: #check account
        print("你的號號已經存在")
    else:
     i+=1
     dict1[s_acc]=s_pwd #確認不一樣才寫入
print(dict1)

#get value
print(dict1["222"])
dict1. get("333")
print(dict1.items()) #([("111,"aaa"), ("222","bbb"), ("333","ccc")])
print(dict1.keys()) #(["111","222", "333"])
print(dict1.values()) #(["aaa","bbb","ccc"])
dict3=(888:9999, 777:6666)
dict1.update(dict3)
print(dict1) #[("111,"aaa", "222","bbb", "333","ccc", 888:9999, 777:6666])

keys=["bob","anne","helen"]
values=80
dict2=dict.fromkeys(keys,values)
print(dict2)



#字典的運算  key-value 配對
dic={"apple":"蘋果","bug":"重蟲"}
dic["apple"]="小蘋果"
print(dic["apple"]) #蘋果

print("apple" in  dic) #判斷key是否存在  #True
del dic["apple"] #刪除字典中的鍵值對(key value pair)

dic={x:x*2 for x in [3,4,5]} #從列表的資料產生字典
print(dic) #3,6,4,8,5,10

#找字
data={"apple":"蘋果","dog":"狗","cat":"貓貓"}
english=input("請輸入英文字")









