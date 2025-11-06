import tkinter as tk
import pandas as pd
pip install yfifnance
import yfinance as yf
df1=pd.read_csv("")


yf.Tkinter ("2023.tw").history(period="max")
print(df_2330)

df_c=yf.download("tsla smci",start="2023-01-01",end="2023-12-16"interval="1hr")
print(df_c.head(10))


#Us
df_nvda=yf.download(start="2023-01-01",end="2023-12-15")
print(df_nvda)


df_600006=yf.Ticker("600006.ss").history(period="max")
print(df_600006)

import mplfinance as mpf
#k line k線圖繪製
mpf.plot(df_nvda,type="candle",mav=(5,20),title="NVDA",savefig="df_nvda.png")





