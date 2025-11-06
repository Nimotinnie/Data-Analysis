#注意括號大小
t1=(1,2,3) #tuple()
t2=[1,2,3] #list[]
t3=(9,8,7)
print(t1[0]) #1
print(t1[:2]) #(1,2)
print(t1+t3)
print(t1[::-1]) #reverse tuple
print(9 in t3) #True值
print("9" in t3) #False非文字
#tuple不可改變值
t3[0]=900 #error



#有順序可移動列表 List
grades=[12,60,15,70,90]
grades[0]=55 #把55放到列表中的第一個位子
print(grades)
print(grades[0]) 
(grades[1:4])=[] #連續刪除列表中編號1到3的資料
grades=grades+[12,33] #列表串接
print(grades)

a1=[1,2,3,4,5]
print(a1[0:3]) #1,2,3
print(a1[::2]) #1,3,5
print([a1[::-1]]) #5,4,3,2,1 串列反轉
a1.append(-1) #新增資料
a1.insert(0,0.5)
print(a1)
print(a1)

length=len(grades) #取得列表長度 len(列表資料)
print(length)

data=[[3,4,5],[6,7,8]]
data[0] #代表[3,4,5]
data[0][1] #代表4
data[0][0:2] #代表3,4
data[0][0:2]=[5,5,5] #代表[5,5,5,5]

#print 3 names and add into lists
name1=[]
name2=list() #另種寫法
for i in range(3):
    name=input("name:")
    name1.append(name)
print(name1)



#有順序不可移動的列表 Tuple
data=(3,4,5)
data[0]=5 #錯誤：因為Tuple資料不可以更新更動
print(data)