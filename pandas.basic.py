#Series 單維度的資料
# pip install pandas
# pip3 install pandas
import pandas as pd
print("根據列表建立 Series")
numberData=pd.Series([3,4,10,2,5,100])
print(numberData)
print("Series 的資料型態", numberData.dtype)
print("Series 的資料數量", numberData.size)
print("做加法", numberData+10)
print("做乘法", numberData*2)
print("做大於小於等於比較")
print(numberData>5)
print("找到最大值", numberData.max())
print("統計平均數", numberData.mean())
strData=pd.Series(["Amy", "Bob", "John"])
print(strData)
print("轉換成全大寫", strData.str.upper())
print("檢查關鍵字", strData.str.contains("o"))

# Practice
import pandas as pd
numberData=pd.Series([6,1,2,8,10,50])
# 統計 numberData 的中位數
print(numberData.median())
# 統計 numberData 的標準差
print(numberData.std())
print(numberData[numberData<numberData.mean()+numberData.std()])

strData=pd.Series(["https://google.com/", "http://www.google.com/", "https://facebook.com/", "HTtps://instagram.com/"])
# 判斷字串是否以 https:// 開頭
print(strData.str.startswith("https://"))
# 無論大小寫，判斷字串是否以 https:// 開頭
print(strData.str.lower().str.startswith("https://"))
# 篩選資料
print(strData[[True, False, True, False]])
print(strData[strData.str.lower().str.startswith("https://")])





#DataFrame 多維度的資料
import pandas as pd
print("根據字典建立 DataFrame")
employeeData=pd.DataFrame({
    "name":["澎澎", "丁滿", "辛巴"],
    "salary":[30000, 60000, 45000]
})
print(employeeData)
print("資料的數量", employeeData.size)
print("資料的形狀", employeeData.shape)
print("取得 name 欄位")
print(employeeData["name"])
print("取得第 2 列")
print(employeeData.iloc[1])
print("取得第 2 列中的 salary 欄位")
print(employeeData.iloc[1]["salary"])
print("建立新的欄位 admin，用布林值代表誰是主管")
employeeData["admin"]=[True, False, False]
print(employeeData)
print("根據現有欄位建立新的欄位 bonus，薪水的一成")
employeeData["bonus"]=employeeData["salary"]*0.1
print(employeeData)
print("篩選出薪資小於 50000 的資料")
print(employeeData[employeeData["salary"]<50000])


# Practice
import pandas as pd
employeeData=pd.DataFrame({
    "name":["澎澎", "丁滿", "辛巴"],
    "salary":[30000, 60000, 45000],
    "admin":[True, False, False]
})
# 篩選出薪資小於 50000 的資料，並計算篩選後的薪資平均數
filtered_data=employeeData[employeeData["salary"]<50000]
print(filtered_data["salary"].mean())
# 根據 薪資*0.1 以及 (如果不是管理者，額外加 1000 元) 算出 bonus 欄位，使用 Series 的 map 函式
bonus=employeeData["salary"]*0.1
additional_bonus=employeeData["admin"].map({True:0, False:1000})
print(bonus)
print(additional_bonus)
employeeData["bonus"]=bonus+additional_bonus
print(employeeData)