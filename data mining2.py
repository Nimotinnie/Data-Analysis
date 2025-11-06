#載入天氣資料
import pandas as pd
df_weather=pd.read_html("https://www.cwa.gov.tw/V8/C/W/County/MOD/wf7dayNC_NCSEI/ALL_Week.html?v=",encoding="utf8")[0]
#記得要轉換中文碼encoding
print(df_weather) 


#get taipei data
df_tpw=df_weather.iloc[2:4,:]
print(df_tpw)
#白天天氣 刪除資料
del_list=list(range(1,df_weather.shape[0],2))
df_2=df_weather.drop(del_list,axis=0)
print(df_2.iat[0,2])

#載入即時匯率（台灣銀行
import pandas as pd
df_currency=pd.read_html("https://rate.bot.com.tw/xrt?Lang=zh-TW")[0]#第幾張表
print(df_currency.columns)
#重新定義detaframe 欄位
df_currency_m.columns=["幣別","現金買入,"現金賣出"]
df_currency_m[]
print(df_currency_m)
df_currency_m["幣別"]=df_currency_,["幣別"].apply(lambda x :x.split("(")[0].strip())
print(df_currency_m)
#轉換資料型態
df_currency_m.to csv("currency.csv",encoding="utf8") #中文轉換utf8 or big5

              

