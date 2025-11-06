2.51
#2.52 某樂透 (Lottery) 遊戲規則如下: 
#「消費者從 01∼49 中任選 6 個號碼進行投注。
#開獎時，開獎單位將隨機開出 6 個號碼 (winning number)。
#如果消費者選號有三個以上（含三個號碼）對中當期開出之 6 個號碼，
#即為中獎，並可依規定兌領獎金。」
#某天小明買了兩注電腦選號，其號碼為 (5, 29, 12, 10, 38, 35) 和 
# (41, 13, 21, 29, 19,12)，若當期之開獎號碼為 (10, 7, 12, 38, 47, 35)，
#請寫一 R 函式，幫小明對獎
#程式要求如下: (1) 輸入為開獎號碼 (預設值為本題之開獎號碼); 
#              (2) 執行對獎程式後，由營幕輸入「消費者投注號碼」; 
#              (3) 輸出為消費者投注號碼及開獎號碼、對中之號碼個數、恭喜中獎或銘謝惠顧; 
#              (4) 不可用 for。(提示: (1) %*%; (2) 由營幕輸入
#「消費者投注號碼」，可一次輸入兩注，或一次輸入一注但執行兩次對獎程式)
  Lottery <- function(win = c(10, 7, 12, 38, 47, 35)) {
                  # 顯示開獎號碼
                  cat("開獎號碼為:", win, "\n")
                  
                  # 讓使用者從鍵盤輸入 6 個數字（一次可輸入一注或多注）
                  cat("請輸入您投注的6個號碼(可多注，每注6個數):\n")
                  bet <- scan(what = integer())  # 例如: 5 29 12 10 38 35 41 13 21 29 19 12
                  
                  # 把輸入轉成矩陣（每6個數為一注）
                  bets <- matrix(bet, ncol = 6, byrow = TRUE)
                  
                  # 使用 apply 而非 for 進行比對
                  apply(bets, 1, function(x) {
                    matched <- intersect(x, win)           # 對中號碼
                    n_match <- length(matched)             # 對中幾個
                    
                    cat("\n您的投注號碼:", x, "\n")
                    cat("開獎號碼:", win, "\n")
                    cat("對中號碼:", matched, "（共", n_match, "個）\n")
                    
                    if (n_match >= 3)
                      cat(" 恭喜中獎！\n")
                    else
                      cat(" 銘謝惠顧。\n")
                  })
                }
                
                # 測試範例：
                # Lottery()
                # 輸入: 5 29 12 10 38 35 41 13 21 29 19 12
                

2.53 樂透彩對獎程式: 在 1∼42 的整數中, 樂透彩會開出 6 個號碼以及一個特別號, 中獎
     規則以及獎額如下:
     獎項 規則 獎金
     頭獎 6 個號碼全中 1,000,000
     二獎 6 個號碼中 5 個, 另一個中特別號 100,000
     三獎 6 個號碼中 5 個 10,000
     四獎 6 個號碼中 4 個 1,000
     五獎 6 個號碼中 3 個 100
     註: 中頭獎的不能再被被視為中三獎, 餘類推。
     (a) 若當期開出之號碼為 38, 28, 18, 8, 5, 10。而特別號是 42。小銘買了一張彩卷，
          選號為 15, 1, 8, 18, 28, 38。請問有對中之號碼為何? 對中號碼個數為幾個?
     (b) 小吳也買了樂透彩，所選 5 組號碼記錄在 (mylist.txt) 檔案。請你寫一 R 程
         式 lotto 幫他對獎，使得輸出為以下所列。(提示 1: 輸入為當期開出之號碼、
        特別號 及號碼記錄檔。)
         no. 中獎 累積獎金 有對到之號碼
         ========================================================
         1 沒中獎 0 ( 38 )
         2 中二獎 100000 ( 8 18 28 38 5 [ 42 ] )
         3 中五獎 100100 ( 8 18 28 )
         4 沒中獎 100100 ( )
         5 中頭獎 1100100 ( 5 10 8 18 28 38 )
         ========================================================
           總獎金: 1100100 元
         (提示 2: as.matrix, as.integer, if, for, cat, length, which,· · · )
         
lotto <- function(win = c(38, 28, 18, 8, 5, 10), special = 42, file = "mylist.txt") {
           # 讀入檔案（每行6個號碼）
           mylist <- as.matrix(read.table(file))
           
           # 建立獎金表
           prize <- c(1000000, 100000, 10000, 1000, 100)
           
           total_prize <- 0
           cat("no.\t中獎\t累積獎金\t對中號碼\n")
           cat("========================================================\n")
           
           for (i in 1:nrow(mylist)) {
             x <- as.integer(mylist[i, ])
             matched <- intersect(x, win)
             n <- length(matched)
             special_hit <- special %in% x
             
             # 判斷獎項
             if (n == 6) {
               prize_now <- prize[1]; msg <- "中頭獎"
             } else if (n == 5 && special_hit) {
               prize_now <- prize[2]; msg <- "中二獎"
             } else if (n == 5) {
               prize_now <- prize[3]; msg <- "中三獎"
             } else if (n == 4) {
               prize_now <- prize[4]; msg <- "中四獎"
             } else if (n == 3) {
               prize_now <- prize[5]; msg <- "中五獎"
             } else {
               prize_now <- 0; msg <- "沒中獎"
             }
             
             total_prize <- total_prize + prize_now
             cat(i, msg, total_prize, "\t(", matched,
                 if (special_hit) paste0("[", special, "]"), ")\n")
           }
           
           cat("========================================================\n")
           cat("總獎金:", total_prize, "元\n")
         }
         
         # 檔案 mylist.txt 內容（每行六個數字）示例：
         # 38 1 19 5 7 10
         # 8 18 28 38 5 42
         # 8 18 28 1 2 3
         # 6 7 9 11 13 15
         # 5 10 8 18 28 38
         
#2.54 USArrests 資料中，選出以"N" 開頭的州，計算選出資料每個變數的平均值及標準差
data("USArrests")
subset_data <- USArrests[grep("^N", rownames(USArrests)), ]  # 找出開頭為 N 的州
result <- data.frame(
  mean = apply(subset_data, 2, mean),
  sd = apply(subset_data, 2, sd)
)
print(result)

#2.55 某公路經過 A, B,· · · , G 七個城市，
#.    各城市離出口之里程數依序為 25, 49, 95, 178,264, 327, 373(公里)。
#.    現在要訂公車票價，規則如下
     公里數              收費
     50 公里內 (含) 一律收 100 元
     50 公里以上 (不含) 且 在 300 公里 (含) 以內者 基本費 100 元加上
     超過 50 公里的部份為每公里加收 1 元
     超過 300 公里 一律收 400 元
     
#     請寫一 R 函式，輸入為城市離出口之里程數，輸出為城市間的票價表。
     (提示:matrix, for, if)
     票價表 A B C· · · G
     A 100 100 . . .
     B 100 100 . . .
     C . . 100 . .
     .
     .
     . . . . . .
     G . . . . 100
     
Ticket_Price <- function(dist = c(25, 49, 95, 178, 264, 327, 373)) {
       n <- length(dist)
       price <- matrix(0, n, n)
       
       for (i in 1:n)
         for (j in 1:n) {
           d <- abs(dist[i] - dist[j])
           if (d == 0) price[i, j] <- 100
           else if (d <= 50) price[i, j] <- 100
           else if (d <= 300) price[i, j] <- 100 + (d - 50)
           else price[i, j] <- 400
         }
       
       colnames(price) <- LETTERS[1:n]
       rownames(price) <- LETTERS[1:n]
       return(price)
     }
     
     Ticket_Price()
     

     
#2.56 (a) 資料壓縮: 將字串"AAABBBCCCC" 表示成"3A3B4C"。 (提示: gregexpr, cat。)
#     (b) 資料解壓縮: 將字串"3A3B4C" 表示"AAABBBCCCC"。 (提示: substr, cat, rep)
     # (a) 壓縮
compress_string <- function(s) {
       runs <- gregexpr("(.)\\1*", s)[[1]]          # 找出連續相同字元的群組
       chars <- regmatches(s, list(runs))[[1]]      # 提取每一群字
       counts <- nchar(chars)                       # 每群字的長度
       letters <- substr(chars, 1, 1)               # 每群代表的字母
       result <- paste0(counts, letters, collapse = "")
       cat(result, "\n")
     }
     
     compress_string("AAABBBCCCC")  # 輸出 3A3B4C
     
     
     # (b) 解壓縮
     decompress_string <- function(s) {
       nums <- as.numeric(unlist(strsplit(gsub("[A-Z]", " ", s), " ")))
       letters <- unlist(strsplit(gsub("[0-9]", "", s), ""))
       expanded <- mapply(function(n, ch) rep(ch, n), nums, letters)
       cat(paste0(unlist(expanded), collapse = ""), "\n")
     }
     
     decompress_string("3A3B4C")  # 輸出 AAABBBCCCC
     

#2.57 寫一「簡單資料壓縮」之 R 函式 (命名為 compress): 輸入為 ABC 三個字母組成之字串, 
#     例如: 字串"ABAABBAABCCCAC"，輸出為每個字母出現之次數，(例如:"6A4B4C")
#     (提示: gregexpr, for, LETTERS, paste0, length, cat。)
     compress <- function(s) {
       result <- ""
       for (ch in c("A", "B", "C")) {
         count <- length(gregexpr(ch, s)[[1]])
         if (count > 0) result <- paste0(result, count, ch)
       }
       cat(result, "\n")
     }
     
     compress("ABAABBAABCCCAC")  # 輸出 6A4B4C
     
     
2.58 R 內建資料集 mtcars 是一汽車趨勢道路測試資料 (Motor Trend Car Road Tests)(1974 年), 
     資料包括 32 款汽車在油耗及 10 個汽車設計和性能測試相關的數據
     11個變數依序為: mpg (Miles/(US) gallon, 公哩/加侖), cyl (Number of cylinders, 
     氣缸數), disp (Displacement, 容量), hp (Gross horsepower, 總馬力), drat (Rear axle
     qsec 在各個不同氣缸數之下的平均數。
     (提示: 限使用一次 apply 及 tapply)。
     
     data("mtcars")
     result <- tapply(mtcars$qsec, mtcars$cyl, mean)  # 各 cyl 的平均
     print(result)
     
     
2.59 

2.60 小銘雞排國際股份有限公司三峽分部提供給員工使用的資料庫存取訊息如下:
      MySQL Server IP: 163.13.113.xxx, port=3306; 資料庫名稱: bigdata105; 使用者帳
     號: student; 密碼: xxxxxx。
     (a) 請將資料表格”student_info” 讀入 R 後，依照學號排序 (遞增)，刪除重覆之
     紀錄，列出資料前六筆紀錄。(刪除後) 共有多少筆紀錄? 共有多少欄位?
     library(RMySQL)
     con <- dbConnect(MySQL(), user="student", password="xxxxxx",
                      dbname="bigdata105", host="163.13.113.xxx", port=3306)
     
     # 讀入資料表
     data <- dbReadTable(con, "student_info")
     
     # 排序 + 刪除重複紀錄
     data <- data[order(data$student_id), ]
     data <- unique(data)
     
     head(data)              # 顯示前六筆
     nrow(data); ncol(data)  # 顯示筆數與欄數
     
     dbDisconnect(con)
     
     (b) BMI(身體質量指數) 值計算公式為1: BMI = 體重/身高 2，
     其中體重單位是公斤，身高單位是公尺。
     請由營幕輸出提示給使用者「請輸入您的體重 (公斤)/身高 (公尺): 」
     由鍵盤輸入「體重 (公斤)/身高 (公尺)」，計算 BMI 後，再由營幕輸出 BMI 值「您的 BMI 值為: ]
BMI_calc <- function() {
  w <- as.numeric(readline("請輸入您的體重(公斤): "))
  h <- as.numeric(readline("請輸入您的身高(公尺): "))
  BMI <- w / (h^2)
  cat("您的 BMI 值為:", round(BMI, 2), "\n")
}

BMI_calc()

     (c) BMI(身體質量指數) 值計算公式為2: BMI = 體重/身高 2，其中體重單位是公
     斤，身高單位是公尺。依所計算出的 BMI，將體重判別分類如下:
     若 BMI<18.5， 則表示「體重過輕」;
     若 BMI 介於 18.5(含) 和 24 之間， 則表示「體重正常」;
     若 BMI 介於 24(含) 和 27 之間， 則表示「體重過重」;
     若 BMI 介於 27(含) 和 30 之間， 則表示「輕度肥胖」;
     若 BMI 介於 30(含) 和 35 之間， 則表示「中度肥胖」;
     若 BMI>35(含)， 則表示「重度肥胖」;
     試寫一 R 函式，輸入為「身高及體重」，輸出為「BMI 值及體重判別」並以
     上小題之資料為例，印出每個人之姓名、體重、身高、BMI 值，及其體重判別。
     BMI_calc <- function() {
       w <- as.numeric(readline("請輸入您的體重(公斤): "))
       h <- as.numeric(readline("請輸入您的身高(公尺): "))
       BMI <- w / (h^2)
       cat("您的 BMI 值為:", round(BMI, 2), "\n")
     }
     
     BMI_calc()
     