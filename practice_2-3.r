#function (成績題*2 + df)

# 2.23 有某班學生之微積分成績明細紀錄於資料檔 (score2015.txt) 中，
#.     其中成績以 60分為及格，100 分為滿分，成績空白以零分計。學期總成績計算方法如下: 
# (i) 配分比例為: 小考成績佔 40%(各次小考平均配分)、期中考佔 25%、期末考佔 25%、
#     助教實習課佔 10%，出席次數分數為額外加分，每出席一次，加 2 分 (滿分 18 分);
#     成績紀錄共 8 項。
# (ii) 小考成績刪除其中最低分一次。

# (a) 請讀入此資料 (命名為 Score) 使得欄位名稱為性別、姓名及考試別 (中英文皆可)
#     列名稱為學號。列印出前 5 筆學生各項成績的紀錄。
Score <- read.table("score2015.txt", header=TRUE, row.names=1)
head(Score, 5)

# (b) 計算並印出六項成績, 其每一項成績的最高分、最低分、平均分數及其變異數。(遺失值不列入計算)
#        小考1. 小考2. 小考3. 小考4. 期中考. 期末考.
# 最高分.
# 最低分.
# 平均.
# 變異數.
summary.stats <- function(x){
  c(max=max(x, na.rm=T), min=min(x, na.rm=T),
    mean=mean(x, na.rm=T), var=var(x, na.rm=T))
}
apply(Score[,5:8], 2, summary.stats)

# (c) 將此資料具有遺失值 (NA) 的成績改為零分。刪除每位同學之最低分小考成績後，
#     計算並印出每位同學小考總得分。
Score[is.na(Score)] <- 0
quiz <- Score[,3:6]
quiz.adj <- apply(quiz, 1, function(x) sum(sort(x)[-1]))
head(quiz.adj)

# (d) 依學期總成績計算方法，計算並印出每位同學的學期總成績。(超過 100 分 以 100 分計)
total <- 0.4*(quiz.adj/3) + 0.25*Score$期中考 + 0.25*Score$期末考 + 0.1*Score$助教 + 2*Score$出席次數
total[total>100] <- 100

# (e) 請問不及格人數為多少? 被當的比例為何? 男女生被當的比例各又如何?
# 提示: 小考刪除最差一次之後的計分方式, 舉例如下: 若有三次小考分為 60, 30, 90 。
# 配分為 5%, 6%, 7% 。原始得分為 60*0.05 + 30*0.06 + 90*0.07 = 11.1 
# 若刪除最差一次成績後, 所得分數為: (60*0.05 + 90*0.07)*(5+6+7)/(5+7)= 13.95
fail <- sum(total < 60)
cat("不及格人數:", fail, "\n比例:", fail/length(total))
table(Score$性別[total<60]) / table(Score$性別)







# 2.24 寫一函式 (my.test)，輸入為一組學生成績 (score)，判別此資料，
# 若「成績及格人數達半數以上 (含)，且有 90 分以上 (含) 之同學」則印出「本次成績不調分，平均為: xx.xx」
#.否則印出「本次成績會調分, 不及格比例為: xx.xx」。(小數點以下兩位)
# set.seed(123456)
# score <- sample(1:100, 50, T)
# my.test(score)
# 本次成績不調分，平均為: 55.78

# set.seed(123456)
# score <- sample(1:100, 150, T)
# my.test(score)
# 本次成績會調分, 不及格比例為: 60.67 %
my.test <- function(score){
  pass.rate <- mean(score >= 60)
  high <- any(score >= 90)
  if(pass.rate >= 0.5 && high){
    cat("本次成績不調分，平均為:", round(mean(score),2), "\n")
  } else {
    cat("本次成績會調分, 不及格比例為:", round(mean(score<60)*100,2), "%\n")
  }
}

set.seed(123456)
score <- sample(1:100, 50, T)
my.test(score)







# 2.25 有某班學生之學期各科總成績紀錄於資料檔 (score1032.txt) 中，其中成績以 60分為及格，
#  100 分為滿分，成績空白以零分計。
# 七門科目 (英文，統計學，軟體入門，保險精算，數值分析，語表，離散數學) 之學分數依序為 
# 2, 4, 3, 3, 3, 2, 3。
# (a) 計算每位同學之學業平均成績。請印出座號 1∼10 號同學之「座號及平均成績」 (不需印出 80 位學生之結果)
Score <- read.table("score1032.txt", header=TRUE)
credit <- c(2,4,3,3,3,2,3)

avg <- rowMeans(Score[,4:10], na.rm=TRUE)
head(data.frame(Seat=1:10, 平均=avg), 10)

# (b) 計算每位同學通過科目數。請印出座號 11∼20 號同學之「座號及通過科目數」(不需印出 80 位學生之結果)
pass.count <- apply(Score[,4:10], 1, function(x) sum(x>=60))
data.frame(Seat=11:20, 通過科目數=pass.count[11:20])

# (c) 列印出所有「二一」同學的座號、學號、姓名及其學業平均成績。
Score$avg <- avg
Score[Score$avg < 50, c("座號", "學號", "姓名", "學業平均成績")]

# (d) 計算每位同學總得學分數。請印出女同學之「座號及總得學分數」。
total.credit <- apply((Score[,4:10]>=60)*rep(credit, each=nrow(Score)), 1, sum)

data.frame(Seat=Score$座號[Score$性別=="女"], 得學分=total.credit[Score$性別=="女"])

# (e) 請依照學業平均成績將學生分成三組: 低分組 (50 分含) 以下)、均分組(50∼70 分) 
#     及高分組 (70(含) 分以上)。請印出下表。
#        各組人數 男生人數 軟體入門平均 平均通過科目數.
# 低分組.
# 均分組.
# 高分組.
group <- cut(avg, 
             breaks=c(0,50,70,100),  #指定「分界點」/ # 0–50、50–70、70–100 三組
             labels=c("低分組","均分組","高分組"), 
             right=FALSE). #區間是否「右閉左開」：
                           #FALSE → [0,50) 表示包含左邊不含右邊；
                           #TRUE（預設）→ (0,50] 表示不含左邊含右邊。
group <- ifelse(avg < 50, "低分組",
                ifelse(avg < 70, "均分組", "高分組"))


tapply(Score$性別=="男", group, sum)
aggregate(Score$Software, list(group), mean)
aggregate(pass.count, list(group), mean)







# 2.26 某班某次考試之成績 (ScoreData) 如下，
# set.seed(123456789)
# math <- sample(0:100, 10, replace=T);
# english <- sample(0:100, 10, replace=T)
# algebra <- sample(0:100, 10, replace=T);
# ScoreData <- cbind(math, english, algebra)
       math english algebra
[1,]   65       9      12
[2,]   15      25      45
[3,]   43      20       8
[4,]   44      22      31
[5,]   85      37      65
[6,]   38      57     100
[7,]   11      14      19
[8,]   31      43      92
[9,]    8      69       6
[10,]   43      67      44

# (a) 試計算每人之平均分數。
apply(ScoreData, 1, mean) #每人一列 運算
[1] 28.66667 28.33333 23.66667 32.33333 62.33333 65.00000 14.66667 55.33333 27.66667 51.33333

# (b) 若三科成績 (math，english，algebra) 計算平均之權重依序為 (0.5, 0.2, 0.3), 試計算每人
# 之加權平均分數。(提示: apply, mean, weighted.mean)
apply(ScoreData, 1, 
      function(x) 
        weighted.mean(x, c(0.5,0.2,0.3)))
[1] 37.9 26.0 27.9 35.7 69.4 60.4 14.0 51.7 19.6 48.1








# 2.27 某班某次考試之四科成績如下:
# set.seed(123456789)
# n <- 10
# math <- sample(0:100, n, replace=T);
# english <- sample(0:100, n, replace=T)
# algebra <- sample(0:100, n, replace=T)
# programming <- sample(0:100, n, replace=T)
# 若四科成績 (math, english, algebra, programming) 計算平均之權重依序為(0.4, 0.2, 0.3, 0.1), 
# 試計算每人之加權平均分數，並將全班成績依加權平均分數之高低排序。
# (排名第 1 為加權平均分數最高者)
# rank math english algebra programming weighted.mean
# 1 ...
# 2 ...
# ...
wmean <- apply(cbind(math,english,algebra,programming), 1,
               function(x) 
                 weighted.mean(x, c(0.4,0.2,0.3,0.1)))
[1] 39.0 29.6 28.4 38.4 60.9 63.8 20.7 55.2 26.7 48.2

ranked <- data.frame(rank=rank(-wmean),   #預設是由小到大排序
                                          #因此前面加上負號 -wmean，變成由大到小排名
                     math, english, algebra, programming, 
                     weighted.mean=wmean)

rank math english algebra programming weighted.mean
1     5   65       9      12          76          39.0
2     7   15      25      45          51          29.6
3     8   43      20       8          48          28.4
4     6   44      22      31          71          38.4
5     2   85      37      65           0          60.9
6     1   38      57     100          72          63.8
7    10   11      14      19          78          20.7
8     3   31      43      92          66          55.2
9     9    8      69       6          79          26.7
10    4   43      67      44          44          48.2

ranked[order(ranked$rank), ]
rank math english algebra programming weighted.mean
6     1   38      57     100          72          63.8
5     2   85      37      65           0          60.9
8     3   31      43      92          66          55.2
10    4   43      67      44          44          48.2
1     5   65       9      12          76          39.0
4     6   44      22      31          71          38.4
2     7   15      25      45          51          29.6
3     8   43      20       8          48          28.4
9     9    8      69       6          79          26.7
7    10   11      14      19          78          20.7








# 2.28 以下為某校學生名字及某科目成績:
# student <- c("John", "Mary", "Tom", "George", "Berry", "Nico", "Tim", "Jessica", "David")
# score <- c(70, 58, 87, 22, 94, 30, 69, 94, 60)
# 利用 which 指令，列出哪個學生成績最高，哪個學生成績最低, 哪些學生的成績在平均以下。
student[which.max(score)]
student[which.min(score)]
student[which(score < mean(score))]













# 2.30 小翔是一個對未來充滿抱負的青年，在工作之餘仍不忘利用下班時間充實自己所學，
# 他審視大環境的趨勢、工作的性質與自己的專長，決定利用下班補習英文 (X小時) 與電腦 (Y 小時)，
# 假設英文課程補習費每小時 400 元，電腦課程補習費每小時 600 元，
# 而小翔一個月的進修預算 (Budget) 上限為 12,000 元，其效用函數為U= X1/2Y 1/2，
# 試寫一個 R 函式 (命名為 study)，輸入為補習英文與電腦的時數及預算 (內定值為 12,000)
# ，輸出為以下表格，其中 Tuition 為所需的學費，U 為效用函數值，Fit 為學費沒有超出預算之註記。
#    Eng.hr Comp.hr  Tuition    U     Fit
# 1    13    8       10000   10.19804 *
# 2    14    8       10400   10.58301 *
# 3    15    8       10800   10.95445 *
#   ... (中間省略)
# 23   15   12 13200         13.41641
# 24   16   12 13600         13.85641
# 25   17   12 14000         14.28286
study <- function(Eng.hr, Comp.hr, Budget=12000){
                  Tuition <- 400*Eng.hr + 600*Comp.hr
                  U <- sqrt(Eng.hr)*sqrt(Comp.hr)
                  Fit <- ifelse(Tuition <= Budget, "*", "")
                  data.frame(Eng.hr, Comp.hr, Tuition, U=round(U,5), Fit)
}

study(13:17, 8:12)

     Eng.hr Comp.hr Tuition        U Fit
1     13       8   10000 10.19804   *
2     14       9   11000 11.22497   *
3     15      10   12000 12.24745   *
4     16      11   13000 13.26650    
5     17      12   14000 14.28286    