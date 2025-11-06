 # 1.32 有一資料，紀錄某班級 10 位學生之姓名 (student)，組別 (group) 及分數 (score)
 #    如下:
 #    set.seed(12345)
 #    group <- sample(letters[1:3], 10, replace=T)
 #    score <- sample(0:100, 10, replace=T)
 #    student <- c("Bruckner", "Caringer", "Mendoza", "Jaleela", "Williams",
 #                 "Rida", "Kai", "Jaabir", "Garces", "Trevor")
 #    (a) 請將上述資料建立一 R 資料框 (data.frame) 物件 (命名 myData) 如下:
 #      > myData
 #    group score
 #    Bruckner c 80
 #    Caringer c 59
 #    Mendoza b 91
 #    Jaleela b 88
 #    Williams b 100
 #    Rida a 90
 #    Kai b 88
 #    Jaabir a 19
 #    Garces c 33
 #    Trevor a 78
    
    myData <- data.frame(group = group, score = score, row.names = student)
    
    # (b) 請將資料依組別及分數排序如下: (提示: ? order)
    #        group score
    # Jaabir   a    19
    # Trevor   a    78
    # Rida     a.   90
    # Jaleela  b.   88
    # Kai      b.   88
    # Mendoza b 91
    # Williams b 100
    # Garces c 33
    # Caringer c 59
    # Bruckner c 80
    
    #order() 可以指定多個排序條件，例如 order(group, score)
    myData_sorted <- myData[order(myData$group, myData$score), ]
    myData_sorted
    
#  1.33 某三班 (Class) 同學之數學及英文考試成績如下:
#     Student: Bruckner, Caringer, Mendoza, Jaleela, Williams, Rida, Kai, Jaabir,
#     Garces, Trevor
#     Class: C, A, A, C, B, B, C, C, B, A
#     Math: 45, 33, 97, 71, 65, 39, 70, 54, 22, 48
#     English: 79, 26, 99, 76, 98, 22, 95, 15, 60, 95
# (a) 請將上述資料建立一 R 資料框 (data.frame) 類別之物件 (命名 Class.Score)，
#     使得學生姓名 (Student) 為此資料框之列位名; 欄位名則為班別 (Class) 及兩
#     科目之分數 (Math、English)。印出 
    Class.Student <- c("Bruckner", "Caringer", "Mendoza", "Jaleela", "Williams", 
                        "Rida", "Kai", "Jaabir", "Garces", "Trevor")
    Class <- c("C", "A", "A", "C", "B", "B", "C", "C", "B", "A")
    Math <- c(45, 33, 97, 71, 65, 39, 70, 54, 22, 48)
    English <- c(79, 26, 99, 76, 98, 22, 95, 15, 60, 95)
    # 建立資料框，並將 Student 設為 rownames
    Class.Score <- data.frame(Class, Math, English, row.names = Class.Student)
    
    Class.Score
    
    
# (b) 產生一個邏輯向量變數 (Pass)，其中 TRUE 代表兩科目之平均分數有大於或等
#     於 60 分。並將 Pass 合併至 Class.Score 中。印出 Class.Score。
    avg_score <- (Class.Score$Math + Class.Score$English) / 2
    
    # 產生邏輯向量 (TRUE / FALSE)
    Pass <- avg_score >= 60
    
    # 加到資料框
    Class.Score$Pass <- Pass
    
    # 印出結果
    Class.Score
    
    
# 1.46 某公司之銷售紀錄資料檔 sales 中，兩欄位資訊分別為某產品之銷售日期時間
    # (date.time) 及其銷售量 (items.quantity)。請計算此產品在 2015 年之平均銷售量。
    my.time <- strptime(c("08/01/2014 00:00:00", "12/31/2018 23:59:59"), "%m/ %Y %H:%M:%S")
    set.seed(12345)
    date.time <- sample(seq(from = my.time[1], to = my.time[2], by='hour'), 100,replace = T)
    items.quantity <- sample(0:1000, 100, replace = T)
    sales <- data.frame(date.time, items.quantity)
    # 篩出 2015 年
    sales_2015 <- subset(sales, format(date.time, "%Y") == "2015")
    mean(sales_2015$items.quantity)
    
    # 1.47 四群學生，人數 (number) 是 10、20、30、40 人，平均體重 (weight) 分別是 50、55、60、65 
    # 公斤，計算全部學生的平均體重。(提示: 將 number 及 weight 設定為數字向量。)
    number <- c(10, 20, 30, 40)
    weight <- c(50, 55, 60, 65)
    
    total_mean <- sum(number * weight) / sum(number)
    total_mean
    
# 1.48 某社區之 10 位住戶，接受體能量測之指數及滿意度調查資料如下 (NA 表示未接受量測或調查):
    # 年紀(age): 54 64 75 21 66 49 25 72 50 72
    # 性別(gender): "女" "男" "男" "女" "女" "男" "男" "女" "男" "女"
    # 指數(index): 86 30 NA 43 35 42 31 7 29 80
    # 滿意度(sat): "滿意" "非常滿意" "非常不滿意" "非常滿意" "普通" "非常不滿意" "普通" "滿意"
    # "普通" "非常滿意"
    # (a) 將此資料輸入 R 中，共計 4 個變數: age, gender, index, 及 sat。將「滿意度 (sat)」
    #     設置成一個具有順序的因子類別之物件。(大至小的順序為「非常滿意」至「非常不滿意」)
    age <- c(54, 64, 75, 21, 66, 49, 25, 72, 50, 72)
    gender <- c("女", "男", "男", "女", "女", "男", "男", "女", "男", "女")
    index <- c(86, 30, NA, 43, 35, 42, 31, 7, 29, 80)
    sat <- c("滿意", "非常滿意", "非常不滿意", "非常滿意", 
             "普通", "非常不滿意", "普通", "滿意", "普通", "非常滿意")
    sat <- factor(sat,
                  levels=c("非常滿意", "滿意", "普通", "不滿意", "非常不滿意"),
                  ordered=TRUE)
    
    # (b) 滿意度為「滿意」(含) 以上程度的人數共多少人。 滿意(含)以上者 = 非常滿意 + 滿意
    > ok <- sum(sat>="滿意")
    > ok
    [1] 7
    
    # (c) 請計算年紀大於 40 歲男性之平均體能指數。 平均體能指數
    mean(index[gender == "男" & age > 40], na.rm = TRUE)
    
    
 # 1.44 某銷售人員在 2018 年的網路銷售紀錄從公司資料庫隨機抽樣 10 筆如下:
    # Dates: 0924, 1112, 1231, 1105, 0604, 0219, 0416, 0611, 0813, 1029
    # Time: 01:00, 04:00, 16:00, 23:00, 08:00, 09:00, 07:00, 17:00, 03:00, 14:00
    # Items: shirt, shirt, pants, jacket, jacket, shirt, jacket, jacket, shoes, shirt
    # Volume: 7951, 159,1958, 6848, 3762, 3678, 8696, 9045, 6208, 1425
    # (a) 請將上述資料儲存成一資料框 (data.frame) 類別之物件，命名 mySale，
    #     使得第一個欄位為銷售日期時間 (DateTime)，類別為 POSIXct, 時區為世界協調時間 (UTC); 
    #     第二個欄位為銷售品項 (Items), 類別為 factor; 第三個欄位為銷售量 (Volume), 
    #     類別為 numeric。印出 mySale。
    Dates <- c("0924", "1112", "1231", "1105", "0604", "0219", "0416", "0611", "0813", "1029")
    Time <- c("01:00", "04:00", "16:00", "23:00", "08:00", "09:00", "07:00", "17:00", "03:00", "14:00")
    Items <- c("shirt", "shirt", "pants", "jacket", "jacket", "shirt", "jacket", "jacket", "shoes", "shirt")
    Volume <- c(7951, 159, 1958, 6848, 3762, 3678, 8696, 9045, 6208, 1425)
    # 將日期補上年份，並合併日期時間
    DateTime <- as.POSIXct(paste0("2018-", substr(Dates, 1, 2), "-", 
                                  substr(Dates, 3, 4), " ", Time),
                           format="%Y-%m-%d %H:%M", tz="UTC")
    # 建立資料框
    mySale <- data.frame(DateTime = DateTime,
                         Items = factor(Items),
                         Volume = as.numeric(Volume))
    
    # (b) 本資料中，七月 (含) 之後的銷售品項為何? 其總銷售量為多少?
    # 取得月份
    months <- as.numeric(format(mySale$DateTime, "%m"))
    
    # 選取 7 月或之後的資料
    summer_sale <- mySale[months >= 7, ]
    
    # 顯示品項
    summer_sale$Items
    
    # 計算總銷售量
    sum(summer_sale$Volume)
    
    
    
# 2.11 有一 50 筆成績資料如下
    # score <- sample(0:100, 50, replace = TRUE)
    # 判別此資料中是否有高於 95 分的同學，若有，印出「老師請同學吃飯」，若沒有印出「老師很生氣」。
    score <- sample(0:100, 50, replace = TRUE)
    
    if (any(score > 95)) {
      cat("老師請同學吃飯\n")
    } else {
      cat("老師很生氣\n")
    }
    
    
    
# 2.12 某班學生期中考微積分及線代的成績資料如下:
    # set.seed(12345)
    # student.id <- paste("student", 1:50, sep=".")
    # Calculus <- round(rnorm(length(student.id), mean=65, sd=10), 0)
    # LinearAlgebra <- sample(0:100, length(student.id), replace = TRUE)
  # (a) 印出兩科成績皆在 85 分以上的學生 id。(Hint: which) 
    which(Calculus >= 85 & LinearAlgebra >= 85)
    student.id[which(Calculus >= 85 & LinearAlgebra >= 85)]
    
  # (b) 印出兩科成績皆在 60 分以下的學生 id。(Hint: which)
    which(Calculus < 60 & LinearAlgebra < 60)
    student.id[which(Calculus < 60 & LinearAlgebra < 60)]
    
  # (c) 各科成績最高分及最低分分別是哪些學生? (Hint: max, min)
    student.id[which.max(Calculus)]
    student.id[which.min(Calculus)]
    student.id[which.max(LinearAlgebra)]
    student.id[which.min(LinearAlgebra)]
    
  # 2.13 某班 60 名學生之統計學成績 (stat) 依座號順序為
    # set.seed(12345)
    # stat <- sample(0:100, 60, replace=TRUE)
    # stat[sample(1:60, 5)] <- NA其中 NA 為缺考。
  # (a) 請計算此次成績之平均數 (缺考不計入)。
    mean(stat, na.rm = TRUE)
    
  # (b) 若 3 號同學之成績登錄錯誤，
    # 76 分更正為 47 分，求更正後的成績平均數 (缺考以 0 分計)。
    stat[3] <- 47
    mean(replace(stat, is.na(stat), 0))
    
   # 2.14 有一 50 筆課業成績資料如下
    # score <- sample(0:100, 50, replace = TRUE)
    # 大學生課業成績以 60 分為及格，以 100 分為滿分，而「開根號再乘以 10」是著名的成績調分方式，
    # 請寫一函式，輸入為某班學生某科之成績，回傳: (1) 分數調整前被當學生之比例，
    # (2) 分數調整前最高之成績，(3) 分數調整後被當學生之比例，及 (4) 分數調整後最高之成績。
    
    score <- sample(0:100, 50, replace = TRUE)
    
    adjust_score <- function(score) {
      adj <- sqrt(score) * 10
      result <- list(
        before_fail_rate = mean(score < 60),
        before_max = max(score),
        after_fail_rate = mean(adj < 60),
        after_max = max(adj)
      )
      return(result)
    }
    
    adjust_score(score)
  
  # 2.15 某班之期中考各科成績表格 ScoreTable 如下:
    # no <- 65
    # student.id <- paste("student", 1:no, sep=".")
    # set.seed(12345)
    # gender <- factor(sample(c("f", "m"), no, replace = TRUE))
    # Calculus <- sample(0:100, no, replace = TRUE)
    # LinearAlgebra <- sample(0:100, no, replace = TRUE)
    # English <- sample(0:100, no, replace = TRUE)
    # ScoreTable <- data.frame(student.id, gender, Calculus, LinearAlgebra, English)
    
 # (a) 印出三科成績皆及格的同學 (student.id)。
    ScoreTable$student.id[with(ScoreTable, Calculus>=60 & LinearAlgebra>=60 & English>=60)]
    
# (b) 印出男生中，三科成績皆高於各自科目平均分數的同學 (student.id)。
    avgC <- mean(ScoreTable$Calculus)
    avgL <- mean(ScoreTable$LinearAlgebra)
    avgE <- mean(ScoreTable$English)
    ScoreTable$student.id[with(ScoreTable, gender=="m" &
                                 Calculus>avgC & LinearAlgebra>avgL & English>avgE)]
    
 # 2.16 小銘老師有某班學生之期中考試及加分考試兩筆資料，
    # set.seed(12345)
    # n <- 50
    # midterm <- sample(0:100, n, replace = TRUE)
    # extra <- sample(0:100, n, replace = TRUE)
    # 成績比例為期中考 (midterm) 佔 40%，加分考 (extra) 佔 60%。兩次考試結算成績 (100%)
    # 若小於期中考成績，則最後結算成績以期中考計。試寫一 R 函式 (自訂函式中需使用 ifelse)，
    # 處理上述計算，並回傳 (1) 最後結算成績之平均數及變異數，及 (2) 最後期中考試被當之學生比例。
    set.seed(12345)
    n <- 50
    midterm <- sample(0:100, n, replace = TRUE)
    extra <- sample(0:100, n, replace = TRUE)
    
    final_calc <- function(midterm, extra) {
      final <- 0.4*midterm + 0.6*extra
      final_score <- ifelse(final < midterm, midterm, final)
      result <- list(
        mean = mean(final_score),
        var = var(final_score),
        fail_rate = mean(midterm < 60)
      )
      return(result)
    }
    
    final_calc(midterm, extra)
    
    # 2.17 某班學生 (student.id) 期中考微積分及線代的成績資料如下:
    # set.seed(12345)
    # student.id <- paste("student", 1:50, sep=".")
    # Calculus <- round(rnorm(length(student.id), mean=65, sd=10), 0)
    # LinearAlgebra <- sample(0:100, length(student.id), replace = TRUE)
    # 老師註解成績的方法如下:
    # i. 兩科成績皆高於 85 以上 (含)，記為「佳」。
    # ii. 任一科成績低於 40 以下 (含)，記為「要加強」。
    # iii. 兩科成績皆低於 40 以下 (含)，記為「危險」。
    # (a) 利用 for 寫一 R 函式，計算「佳」「要加強」「危險」各有多少位同學。
    # (b) 同一函式裡，再印出「佳」及「危險」之學生座號 (id)。
    grade_summary <- function(Calculus, LinearAlgebra, student.id) {
      good <- weak <- danger <- 0
      for (i in 1:length(student.id)) {
        if (Calculus[i] >= 85 & LinearAlgebra[i] >= 85) good <- good + 1
        if (Calculus[i] <= 40 | LinearAlgebra[i] <= 40) weak <- weak + 1
        if (Calculus[i] <= 40 & LinearAlgebra[i] <= 40) danger <- danger + 1
      }
      cat("佳:", good, "要加強:", weak, "危險:", danger, "\n")
      cat("佳學生ID:", student.id[Calculus>=85 & LinearAlgebra>=85], "\n")
      cat("危險學生ID:", student.id[Calculus<=40 & LinearAlgebra<=40], "\n")
    }
    grade_summary(Calculus, LinearAlgebra, student.id)
    
    
    
    # 2.18 某班某科原始成績如下:orig.score <- sample(0:100, 55, replace = TRUE)。
    # 老師為了日行一善，打算調整學期總成績 (final.score)，其計算方法有以下三種選擇
    # i. 維持原始分數不調分，但高於 55 分，低於 60 分者，加至 60 分及格。
    # ii.「開根號再乘以 10」。
    # iii. 調成學期總成績最後之平均為 65 分，但高於 100 分者以 100 計。
    # 試寫一 R 函式，包含上述三種調分方式 (使用者執行程式時，可自由選擇其中一種調分方式)，
    # 計算 (1) 原始成績之平均數及變異數; (2) 學期總成績之平均數及變異數; (3) 最後被當之學生比例
    orig.score <- sample(0:100, 55, replace = TRUE)
    
    adjust_method <- function(score, method = 1) {
      if (method == 1) {
        final <- ifelse(score >= 55 & score < 60, 60, score)
      } else if (method == 2) {
        final <- sqrt(score) * 10
      } else if (method == 3) {
        k <- 65 / mean(score)
        final <- pmin(score * k, 100)
      }
      result <- list(
        orig_mean = mean(score),
        orig_var = var(score),
        final_mean = mean(final),
        final_var = var(final),
        fail_rate = mean(final < 60)
      )
      return(result)
    }
    
    adjust_method(orig.score, 1)  # 可改 2 或 3 試試
    
# 2.19 某班學生 (student.id) 修課 5 科成績資料，分別由各科老師提供如下:
    #   student.id <- paste("student", 1:55, sep=".")
    #   set.seed(123)
    #   Calculus <- round(rnorm(length(student.id), mean=65, sd=10), 0)
    #   LinearAlgebra <- sample(0:100, length(student.id), replace = TRUE)
    #   BasicMath <- sample(0:100, length(student.id), replace = TRUE)
    #   Rprogramming <- sample(0:100, length(student.id), replace = TRUE)
    #   English <- sample(0:100, length(student.id), replace = TRUE)
    
# (a) 請將此各別資料轉成單一資料表格 (命名為 mydata)，使得欄位名稱為科目名，
    # 列名稱為學生的座號 student.id，並列印出前 3 位同學成績紀錄。
    mydata <- data.frame(student.id, Calculus, LinearAlgebra, BasicMath, Rprogramming, English)
    head(mydata, 3)
    
# (b) 請將資料依 LinearAlgebra 排序後，印出此科目最高分及最低分各 5 位同學
    #       的各科成績。
    sorted <- mydata[order(mydata$LinearAlgebra), ]
    head(sorted, 5)
    tail(sorted, 5)
    
# (c) 若每科學分數皆為 3 學分，同時每科以 60 分為及格。請找出 1/2 的同學。
    passed <- rowSums(mydata[,2:6] >= 60)
    sum(passed >= 3) / nrow(mydata)
