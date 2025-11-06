#載入PAndas模組
import pandas as pd
#以列表資料為底，建立Series
#資料索引

# pd.Series(資料列表)
# pd.Series(資料列表,index=索引列表)
data=pd.Series([5,4,-2,3,7],index=["a","b","c","d","e"])
print(data)
#a 5
#b 4
#c -2
#d 3
#e 7


#觀察資料
data=pd.Series([5,4,-2,3,7],index=["a","b","c","d","e"])
print("資料型態",data.dtype) #int64
print("資料數量 ",data.size) #5
print("資料索引",data.index) #[a,b,c,d,e],dtype="object"

#全部的資料 做運算 
print("numberData+10")
print("numberData*2")
#做比較
print("numberData>5")

# 取得資料:根據順序/索引
print(data[2],data[0]) #取得第三筆資料
print(data["e"],data["d"])

#數字運算；基本、統計、順序
print("最大值",data.max())
print("總和",data.sum())
print("中位數",data.median())
print("最大的三個數",data.nlargest(3))
print("乘積的加法",data.prod())

strData=pd.Series(["Amy","John","Scoty"])
print("轉換成大寫", strData. str.upper())


# 根據順序取值



