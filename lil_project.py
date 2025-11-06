import tkinter as tk
import pandas as pd
from tkinter import ttk
import ssl

#set window
win=tk.Tk()
win.geometry("600*300")
win.title("Query System")

#read csi
df1=pd.read_csv("https://www.cs.nccu.edu.tw/~sichiu/11201_ppt/countries.csv")

#find all country name
country=[]
for i in range(df1.shape[0]):
    if df1.iat[i,0] not in country:
        country.append(df1.iat[i,0])
year=[]
for i in range(df1.shape[0]):
    if df1.iat[i,1] not in year:
        year.append(df1.iat[i,1])
print(year)

def msg():
    df2=df1[(df1.country==c1.get()&(df1.year==c2.get()))]
    print(df2)
    pop=df2.iat[0,2]
    print(pop)
    label_3["text"]="hello"+c1.get()+""+str(c2.get())+""+"population"+str(pop)

#define variable
c1=tk.StringVar()
c2=tk.IntVar()

#set elements on window
label_1=tk.label(win,text="Query country:")
label_1.place(x=150,y=1)
cbb_1=ttk.Combobox(win,values=country,textvariable=c1)
cbb_1.place(x=250,y=1)
label_2=tk.label(win,text="Query year:")
label_2.place(x=150,y=51)
cbb_2=ttk.Combobox(win,values=country,textvariable=c2)
cbb_2.place(x=250,y=51)
bt_1=tk.Button(win,text="Submit!",command=msg)
bt_1.place(x=200,y=101)
label_3=tk.label(win,fg="red",font=("Arial",12))
label_3.place(x=200,y=150)

win.mainloop()

