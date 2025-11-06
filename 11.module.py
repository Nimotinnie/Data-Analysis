#模組：獨立的程式檔案
#     將程式寫在ㄧ個檔案中，此檔案可重複載入使用
#載入模組 使用模組中的函式/變數
#1.載入模組
# import 模組名稱
# import 模組名稱 as 模組別名


#載入內建的sys模組 並取得資訊   
import sys
#使用sys模組
print(sys.platform) #印出作業系統
print(sys.maxsize) #印出整數型態最大值
print(sys.path) #印出搜尋模組路徑

import sys as s
print(s.platform) 
print(s.maxsize) 
print(s.path)

#2.自訂模組
#建立幾何運算模組
#建立檔案geometry.py 定翼平面幾何運算用的函式
#載入並使用
#模組名稱/別名. 函式名稱（參數資料）
#模組名稱/別名. 變數名稱
import geometry
result=geometry.distance(1,1,5,5)
print(result)
result= geometry.slope(1,2,5,6)
print(result)

#3.調整搜尋模組的路徑（放入模組資料夾找不到，要另外寫搜尋路徑）
import sys
sys.path.append("modules") #在模組搜尋路徑中[新增搜尋路徑]
print(sys.path) #印出模組的搜尋路徑列表
print("--------------")
import geometry
result=geometry.distance(1,1,5,5)
