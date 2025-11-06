#載入pandas模組
import pandas as pd

#建立Series（單維度）
data=pd.Series([20,10,15]) 
#基本Series操作
print(data)
#0 20 印出單維度列表資料
#1 10
#2 15
#資料處理：敘述統計
print("Max",data.max())
print("Median",data.median())

#做 比較運算（等於True 不等於False)
data=data==20
print(data)
#0 True
#1 Flase
#2 False

#建立DataFrame（雙維度）
#字典資料"Key":[Vlaue]
data=pd.DataFrame({
    "name":["Amy","John","Bob"],
    "salary":[30000,50000,40000]
    })
print(data)

#   name  salary  橫列 直欄
#0   Amy   30000
#1  John   50000
#2   Bob   40000

#取得特定欄位 column
print(data["name"])
#0     Amy
#1    John
#2     Bob

#取得特定的列 row
print(data.iloc[0]) #第一列



#基本DataFrame操作
