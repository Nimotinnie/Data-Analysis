
# 1.42 有一函數 f (x) = x2 + x− 1, 其定義域為 (0, 1)，請將 (0, 1) 等分為 10 份子區間，將
# 每一子區間之右端點所形成的集合稱為 x，請計算 x 之函數值 f (x)
n <- 10
# 右端點
x <- seq(1/n, 1, by = 1/n)

# 定義函數
f <- function(x) x^2 + x - 1

# 計算函數值
fx <- f(x)



#txt
# 1.34 讀取「stock-data.txt」資料檔，印出資料前 5 筆紀錄、後 5 筆紀錄。檢查 (印出)
#     資料每一變數 (欄位) 是否有符合 R 的類別物件，若沒有，請更改。
#.    (提示: 成交筆數、成交金額、成交股數皆為數值變數，不是字元變數)

> data <- read.table("/Volumes/NO NAME/Practice/data/stock-data.txt",
                     header = TRUE,
                     skip = 1,
                     sep = "\t",
                     fileEncoding = "big5",
                     stringsAsFactors = FALSE)
> data
半導體公司 年度 月份 最高價 最低價 加權平均價 成交筆數     成交金額
1     台積電  100    1   78.3   69.6      74.30   263999 100578274926
2     台積電  100    2   77.0   69.9      72.54   235159  74985055548
3     台積電  100    3   72.2   65.7      69.74   276434  88459924495
4     台積電  100    4   73.9   68.0      71.37   211611  70177023098
5     台積電  100    5   76.9   73.0      74.96   213185  74005599560
6     台積電  100    6   78.2   70.4      74.70   260507  96761306205
成交股數 週轉率百分比
1 1353616348         5.22
2 1033654452         3.98
3 1268289393         4.89
4  983177475         3.79
5  987256484         3.80
6 1295262736         4.99


> lines_big5 <- readLines("/Volumes/NO NAME/Practice/data/stock-data.txt", 
                          encoding = "big5", 
                          warn = FALSE)
> lines_utf8 <- iconv(lines_big5, from = "big5", to = "utf-8")
> cat(lines_utf8[1:10], sep = "\n")
>writeLines(lines_utf8[1:5]) #writlines/cat較head穩住








#CSV
#先確認中文檔案的字體是啥 （以下是big5
readLines("/Volumes/NO NAME/Practice/data/20140714-weather.txt", n = 5)

\xb0\xf2\xb6\xa9\t25.1348\t...
#或中文顯示為「°õ¶©」、「ªì¤F」這類 → 幾乎肯定是 Big5。
#若顯示「�」或「??」→ 通常是 UTF-8 但被錯誤以 Big5 讀入。


-header = TRUE 第一行是欄位名稱
#第一行像這樣：locationName lat lon stationId TEMP ELEV
-header = FALSE	第一行只是資料	
#第一行也會被當成一筆資料（會自動命名 V1, V2, …)

# 1.35 讀取下列檔案，列印出資料前 5 筆，及後 5 筆紀錄; 
#.     同時檢查 (印出) 資料每一變數(欄位) 是否有符合 R 的類別物件，若沒有，請更改
#     (http://www.hmwu.idv.tw/web/R/data/)

# (b) 20140714-weather.txt
data <- read.table("/Volumes/NO NAME/Practice/data/20140714-weather.txt",
                     header = TRUE,
                     sep = "\t",
                     fileEncoding = "big5",
                      stringsAsFactors = FALSE)
data

# (c) weather_delays14.csv
> data <- read.table('/Volumes/NO NAME/Practice/data/weather_delays14.csv',
                      header = FALSE,
                      sep = "\t",
                      fileEncoding = "UTF-8",
                      quote = "",
                      comment.char = "",
                      stringsAsFactors = FALSE)
> data



# 1.38 於網址https://data.gov.tw/dataset/132344, 下載資料:「臺北市家暴通報案件
#      數統計資訊]，其儲存檔名為「106-108 家防中心報表.csv」。
#      (註: 不得更改下載資料檔之內容。)
# (a) 於 RStudio，讀入此資料，印出前 10 筆紀錄及後 10 筆紀錄。
library(readr)
library(writexl)

data <- read_csv("106-108家防中心報表.csv")

head(data, 10)
tail(data, 10)

# (b) 將變數「間」轉成 R 的日期類別，並印出其結構 (str)日期轉換
data$間 <- as.Date(data$間)

# (c) 將變數「年齡區間」轉成是有順序的 R 因子類別，並印出其結構 (str)。
# 年齡區間轉成有序因子
levels_age <- c("未滿12歲", "12-17歲", "18-29歲", "30-44歲", "45-64歲", "65歲以上")
data$年齡區間 <- factor(data$年齡區間, levels = levels_age, ordered = TRUE)
str(data)

# (d) 選取變數「間」為”2019-7”(含) 之後的資料，並將此子資料集寫出 (匯出) 成Excel 檔案，
# 命名為「2019_Violence.xls」
subset_2019 <- subset(data, 間 >= as.Date("2019-07-01"))
write_xlsx(subset_2019, "2019_Violence.xlsx")


# 1.39 資料來源: https://github.com/owid/covid-19-data/tree/master/public/data
# (a) 讀取「新冠肺炎」資料 (檔案: owid-covid-data.csv)，並印出前後各 5 筆紀錄。
data <- read.csv('/Volumes/NO NAME/Practice/data/owid-covid-data.csv')

head(data, 5)
tail(data, 5)

# (b) 分別計算並印出三個國家 (Germany，United Kingdom 及 United States)，
#     在本年度 8 月份「平均」新增確診案例 (new_cases)。
data$date <- as.Date(data$date)
data_august <- subset(data, format(date, "%m") == "08" &
                        location %in% c("Germany", "United Kingdom", "United States"))

aggregate(new_cases ~ location, data = data_august, FUN = mean, na.rm = TRUE)


         location new_cases
1        Germany  14772.97
2 United Kingdom  10166.66
3  United States  94805.81

逐一取出三個國家：
1️⃣ 篩出該國 8 月份資料；
2️⃣ 用 mean() 計算每日平均新增病例；
3️⃣ 用 cat() 印出結果。


# 1.43 一個人的肌肉質量預期會隨著年齡增長而下降。為探究這女性群體中的這個關聯
# 性，一營養學家由年齡 40 到 79 歲的婦女中，每 10 歲一組隨機抽取 15 人進行研
# 究。結果資料如「musclemass.csv」，其中 y 表肌肉質量，x 表年齡。讀入資料，
# 並列印出資料前 5 筆及後 5 筆紀錄。
# 讀取 csv
muscle <- read.csv("/Volumes/NO NAME/Practice/Test/data/musclemass.csv", 
                   stringsAsFactors = FALSE)
head(muscle, 5)
tail(muscle, 5)
# 檢查欄位類別
str(muscle)


# 1.50 於網址https://data.gov.tw/dataset/61797, 
#下載資料:「臺北捷運全系統旅運量統計 _201803」，
#並儲存檔名為「臺北捷運全系統旅運量統計 _201803.csv」。
# (註:可更改下載資料檔之內容格式，但不得更改資料之正確性。)
# (a) 於 RStudio，讀入此資料 (命名為 TPE.MRT)，並直接列印前 3 筆及後 3 筆紀錄。

# 強制使用 Big5 語系
Sys.setlocale("LC_ALL", "Chinese (Traditional)_Taiwan.950")

#讀檔 (Big5)
raw_lines <- readLines("/Volumes/NO NAME/Practice/data/臺北捷運全系統旅運量統計_201803.csv",
                       encoding = "big5", warn = FALSE)

#轉成 UTF-8
utf8_lines <- iconv(raw_lines, from = "big5", to = "utf-8")

#以文字流方式重新讀成 data.frame
TPE.MRT <- read.csv(textConnection(utf8_lines), stringsAsFactors = FALSE)

#檢查結果
head(TPE.MRT)
str(TPE.MRT)
# $ 西元年: int  2018 2018 2018 2018 2018 2018 2018 2018 2018 2018 ...
# $ 月    : int  3 3 3 3 3 3 3 3 3 3 ...
# $ 日    : int  1 2 3 4 5 6 7 8 9 10 ...
# $ 星期  : chr  "四" "五" "六" "日" ...
# $ 人次  : int  2209721 2372185 2193043 1763921 2127286 2173145 2210099 2236563 2422478 2164494 


# (b) 檢查 (印出) 資料每一變數 (欄位) 是否有符合 R 的類別物件 (日期)，若沒有，請更改。
# 日期轉換
> TPE.MRT$日期 <- as.Date(
  +     paste(TPE.MRT$西元年, TPE.MRT$月, TPE.MRT$日, sep = "/"),
  +     format = "%Y/%m/%d"
  + )
> 
  > TPE.MRT$日期
[1] "2018-03-01" "2018-03-02" "2018-03-03" "2018-03-04" "2018-03-05" "2018-03-06"
[7] "2018-03-07" "2018-03-08" "2018-03-09" "2018-03-10" "2018-03-11" "2018-03-12"
[13] "2018-03-13" "2018-03-14" "2018-03-15" "2018-03-16" "2018-03-17" "2018-03-18"
[19] "2018-03-19" "2018-03-20" "2018-03-21" "2018-03-22" "2018-03-23" "2018-03-24"
[25] "2018-03-25" "2018-03-26" "2018-03-27" "2018-03-28" "2018-03-29" "2018-03-30"
[31] "2018-03-31"

# (c) 選取日期 107/3/12∼107/3/18 之資料 (需利用運算子 <, <=, >, >=)，
# 計算此週之「總運量」平均數。 篩選日期範圍
> week <- TPE.MRT[TPE.MRT$日期 >= as.Date("2018-03-12") &
                         TPE.MRT$日期 <= as.Date("2018-03-18"), ]
> week 
西元年 月 日 星期    人次       日期
12   2018  3 12   一 2152647 2018-03-12
13   2018  3 13   二 2194164 2018-03-13
14   2018  3 14   三 2228608 2018-03-14
15   2018  3 15   四 2245142 2018-03-15
16   2018  3 16   五 2453438 2018-03-16
17   2018  3 17   六 2131707 2018-03-17
18   2018  3 18   日 1871538 2018-03-18


start <- as.Date("2018-03-12")
> end <- as.Date("2018-03-18")
> week <- subset(TPE.MRT, 日期 >= start & 日期 <= end)
> week

> mean(week$人次, na.rm=TRUE)
[1] 2182463

# 2.21 檔案 score02.csv 記錄某班的統計學期中和期末成績。
# (a) 讀入資料 (使其具有欄位名稱: 「學號、期中考、期末考」), 印出前 7 筆紀錄。
score <- read.csv("score02.csv", header=TRUE)
head(score, 7)

# (b) 將欄位名稱依序更改為: id, mid, final。
colnames(score) <- c("id", "mid", "final")

# (c) 印出期末成績比期中成績進步的同學 id。
score$id[score$final > score$mid]

# (d) 將期中及期末成績，各分成及格和不及格兩組，則會有四種狀況 
# (例如其中一種: 期中及格，但期末不及格)。印出四種狀況之人數。
table(mid.pass = score$mid >= 60, final.pass = score$final >= 60)

# (e) 學期成績的計算方式為期中考和期末考的平均成績，請將資料依學期成績由
# 高分至低份排序印出。
score$semester <- (score$mid + score$final) / 2
score[order(score$semester, decreasing = TRUE), ]





#XML
# 1.35 讀取下列檔案，列印出資料前 5 筆，及後 5 筆紀錄; 
#同時檢查 (印出) 資料每一變數(欄位) 是否有符合 R 的類別物件，若沒有，請更改
#     (http://www.hmwu.idv.tw/web/R/data/)
# (a) R-score.xlsx
# install.packages("readxl")
library(readxl)

# 讀取 Excel 檔案
rscore <- read_excel("data/R-score.xlsx")
head(rscore, 5)
tail(rscore, 5)

# 檢查每個欄位的類別
str(rscore)

# 若有需要轉成數值的欄位（例如小考、作業、期末考），使用 as.numeric()
rscore$`小考(1)` <- as.numeric(rscore$`小考(1)`)
rscore$`小考(2)` <- as.numeric(rscore$`小考(2)`)
rscore$`小考(3)` <- as.numeric(rscore$`小考(3)`)
rscore$作業 <- as.numeric(rscore$作業)
rscore$`期末考` <- as.numeric(rscore$`期末考`)


# 1.36 mydata.xlsx 為某班之成績紀錄檔:
# (a) 利用 read_excel {readxl} 讀取檔案”mydata.xlsx” 的「calculus」工作表。
# 印出資料前後各 5 筆紀錄。
data <- read_excel("mydata.xlsx", sheet = "calculus")
head(data, 5)
tail(data, 5)

# (b) 將上述讀入資料的欄位名稱重新命名為「No、Department、ID、Name、Quiz1、Quiz2、Quiz3、Quiz4、
#     TA、MidCore1 MidCore2、MidSum」，並將「ID」指定為列位名稱
#     (因此資料就沒有「ID」這欄位了。)
# 重新命名欄位並設 ID 為 rownames
colnames(data) <- c("No", "Department", "ID", "Name", 
                    "Quiz1", "Quiz2", "Quiz3", "Quiz4", 
                    "TA", "MidCore1", "MidCore2", "MidSum")
row.names(data) <- data$ID
data$ID <- NULL  # 移除 ID 欄位

# (c) 現各次考試的配分重新指定如下: 4 次小考，Quiz(1)∼ Quiz(4)，各佔 8%，
# 期中考 (MidSum) 佔 30%。期中總成績為上述各次考試之結算，
# 若缺考以零分計，請以資料框方式，列出期中總成績不足 30 分之同學姓名 (Name) 
# 及期中總成績 (含學號 (ID))，老師要寄發期中預警單。
data[is.na(data)] <- 0  # 缺考以 0 分計

data$MidTotal <- with(data, 
                      Quiz1*0.08 + Quiz2*0.08 + Quiz3*0.08 + Quiz4*0.08 + MidSum*0.30)
# 篩選總成績不足 30 的學生
warning_list <- subset(data, MidTotal < 30, select = c(Name, MidTotal))
warning_list


# 1.37 有一成績資料檔「106-1-DA-Score.xlsx」，請依照資料檔內各次考試配分
#      (出席計)，計算總成績，並將總成績附加在原成績資料表最後一欄後，存出成一 Excel
#      檔案:「106-1-DA-Score_Final.xlsx」。
library(readxl)
library(writexl)

data <- read_excel("106-1-DA-Score.xlsx")
# 假設配分欄位名分別是：Attendance, Quiz, Midterm, Final
data$Total <- with(data, Attendance*0.1 + Quiz*0.2 + Midterm*0.3 + Final*0.4)

# 匯出新檔
write_xlsx(data, "106-1-DA-Score_Final.xlsx")


# 1.40 資料檔 SalaryGov_Month_subset.xlsx 為政府薪情平臺 https://earnings.dgbas.
# gov.tw/experience.aspx 匯出之「每人每月總薪資 (新臺幣元)」資料子集合。
# 其中每一「行業類別」下，含有「性別」欄位。讀入資料檔，印出資料摘要 (summary)及結構 (str)。
# 請確認每一變數 (欄位) 皆是正確的 R 類別 (例如: 數值變數、日期變數)。若不是請做必要的轉換。
library(readxl)

salary <- read_excel("SalaryGov_Month_subset.xlsx")
summary(salary)
str(salary)

# 假設日期欄為「年月」
salary$年月 <- as.Date(paste0(salary$年月, "-01"))  # 轉成日期
salary$性別 <- factor(salary$性別)
salary$總薪資 <- as.numeric(salary$總薪資)


# 1.49 於網址https://data.gov.tw/dataset/60139, 
#下載資料:「臺北市公眾區免費無線上網熱點資料 (新版)]，
#儲存檔名為「Taipei_Free_AP.xlsx」。(註: 不得更改下載資料檔之內容。)
# (a) 於 RStudio，讀入此資料之前 10 筆紀錄 (命名為 TPE.wifi)。
library(readxl)
TPE.wifi <- read_excel("Taipei_Free_AP.xlsx", n_max = 10)

# (b) 由 TPE.wifi 選取「熱點名稱 (NAME)、緯度 (LATITUDE) 及經度 (LONGI-TUDE)」三欄位的資料，
# 存成為一子資料集，命名為 TPE.wifi.subset，並印出此子資料集。
TPE.wifi.subset <- TPE.wifi[, c("NAME", "LATITUDE", "LONGITUDE")]
print(TPE.wifi.subset)
