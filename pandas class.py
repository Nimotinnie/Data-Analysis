csv_file_path = 'countries' #由外部載入檔案
import pandas as pd
df1 = pd.read_csv(csv_file_path)
print(df1.at[3,"population"]) # at[列，項目]
print(df1.iat[3,2])  #iat 兩個都寫數字[列,行]

#dataframe info
print(df1.columns)
print(df1.shape)
print(df1.shape)

#find totoal country name
country=[]
for i in range(df1.shape[0]):
    if df1.iat[i,0] not in country:
        country.append(df1.iat[1,0])

print(len(country))

#select part data: df1.loc, df1.iloc
#select data from the first row to 5rd row and from "year" to "population" columns
df1_s1=df1.loc[0:4,"year":"population"]
df1_s2=df1.iloc[0:5,1:3]  #year和population各在第一和第三行
print(df1_s1)
print(df1_s2)

#select specific columns

#select one columns
print(df1.country)
print(df1["country"])

#select many columns
print(df1[["population"]])

#select data by conditions

#one condition
print(country)
df_sk=df1[df1.country=="Korea,Rep."]
print(df_sk)
total_population=0
for i in range(df_sk.shape[0]):
    total_population+=df_sk.iat[i,2]
print("the mean populaiton:%.of persons"%(total_population/df_sk.shape[0])])

#many condition
#format: df_sk1=df1[(condition_1)&(condition_2)&(condition_3)]
df_sk1=df1[(df1.country=="Korea,Rep.")&(df1.year>=2000)]
print(df_sk1)
                                                                                                                                                                                  
#delete columns
print(df1.drop(["country","year"],axis=1))
#delete rows:delete the first row to 5th row
df_row=df1.drop([0,1,2,3,4],axis=0)
print(df_row)
del_list=list(range(0,df1.shape[0],2))
print(df1.drop(del_list,axis=0))
