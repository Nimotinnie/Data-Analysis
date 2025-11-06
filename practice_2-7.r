#2.61 資料檔 wine.csv 紀錄三種不同酒類 (Type) 的 13 種化學成份指數 (變數), 
#     共有 178個酒的樣本 (編號依序為 1∼178)。
# (a) 讀取資料，印出前5與後5筆
wine <- read.csv("wine.csv")
head(wine, 5)
tail(wine, 5)

# (b) 計算每種酒類 (Type) 的13個化學成份平均值
avg_by_type <- aggregate(wine[,-1], by = list(Type = wine$Type), mean)
print(avg_by_type)

# (c) 印出每一化學成份指數最高之酒的編號
apply(wine[,-1], 2, which.max)


2.62 某一公司 2018 年之銷售紀錄 (saleRecord) 檔如下，
     包含三個欄位 (銷售日期、銷售物品、銷售量):
n <- 100
date.period <- seq(as.Date('2018-1-1'),
                   to = as.Date('2018-12-31'), by = '1 day')
x <- sample(date.period, n, replace = T)
y <- sample(LETTERS[1:4],n, replace = T)
z <- floor(rnorm(n, m=100, sd=10))
saleRecord <- data.frame(saleDate=x, saleItem=y, saleVolume=z)
計算 2018 年各季 (第一季到第四季) 之各物品 (A, B, C, D) 的銷售總次 (日) 數
及銷售量總和。

# 產生範例資料
set.seed(123)
n <- 100
date.period <- seq(as.Date('2018-1-1'), to = as.Date('2018-12-31'), by = '1 day')
x <- sample(date.period, n, replace = TRUE)
y <- sample(LETTERS[1:4], n, replace = TRUE)
z <- floor(rnorm(n, m=100, sd=10))
saleRecord <- data.frame(saleDate=x, saleItem=y, saleVolume=z)

# 新增季度欄位
saleRecord$Quarter <- quarters(saleRecord$saleDate)

# 統計各季度、各產品的「銷售天數」與「銷售量總和」
result <- aggregate(saleVolume ~ Quarter + saleItem, saleRecord,
                    FUN = function(v) c(Days = length(v), Total = sum(v)))

# 展開結果
result <- data.frame(result$Quarter, result$saleItem, result$saleVolume)
names(result) <- c("Quarter", "Item", "Days", "TotalVolume")
print(result)


2.64 假設資料中兩個變數分別記做 X 跟 Y ，它們的元素個數均為 n，
     其第 i 個值分別用 (xi, yi) 表示 (1 ≤ i ≤ n)。
     以下針對任意 (xi, yi) 與 (xj , yj ) 定義三種狀況
     (1 ≤ i, j ≤ n):
(a) (xi, yi) 與 (xj , yj ) 為同一配對: 滿足 {xi > xj 且 yi > yj }，
    或，{xi < xj 且 yi < yj }。
(b) (xi, yi) 與 (xj , yj ) 為不同一配對: 滿足 {xi > xj 且 yi < yj }，
    或，{xi < xj 且yi > yj }。
(c) (xi, yi) 與 (xj , yj ) 為非同一配對，也非不同一配對: {xi = xj }，
    或，{yi = yj }。以 x <- iris[,1]; y <- iris[,3] 為例，
    寫一 R 函式 (命名為 pairs_cal)，
    計算並輸出此資料的「同一配對個數」與「不同一配對個數」。

pairs_cal <- function(x, y) {
  n <- length(x)
  same <- 0
  diff <- 0
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      if ((x[i] > x[j] && y[i] > y[j]) || (x[i] < x[j] && y[i] < y[j])) same <- same + 1
      if ((x[i] > x[j] && y[i] < y[j]) || (x[i] < x[j] && y[i] > y[j])) diff <- diff + 1
    }
  }
  cat("同一配對個數:", same, "\n")
  cat("不同一配對個數:", diff, "\n")
}

# 範例
pairs_cal(iris[,1], iris[,3])


2.65 建立一 R 套件專案，名為「學號-R-exam3-2」。
(a) 於此 R 套件中新增一 R 程式碼檔，名為「source.R」。於此程式碼檔案，
    實作下列程式:
    假設資料中兩個變數分別記做 X 跟 Y ，它們的元素個數均為 n，
    其第 i個值分別用 (xi, yi) 表示 (1 ≤ i ≤ n)。
    以下針對任意 (xi, yi) 與 (xj , yj ) 定義三種狀況 (1 ≤ i, j ≤ n):
  i. (xi, yi) 與 (xj , yj ) 為同一配對 (concordant pairs): 
     滿足 {xi > xj 且 yi > yj }，或，{xi < xj 且 yi < yj }
  ii. (xi, yi) 與 (xj , yj ) 為不同一配對 (discordant pairs): 
     滿足 {xi > xj 且yi < yj }，或，{xi < xj 且 yi > yj }
  iii. (xi, yi) 與 (xj , yj ) 為非同一配對，也非不同一配對: 
      即 {xi = xj }，或，{yi = yj }。
Kendall 等級相關係數 (Kendall rank correlation coeﬀicient) 的計算公式如下:
      
τ ={同一配對個數} − {不同一配對個數} / n(n−1)/2.
以 x <- iris[, 1]; y <- iris[, 3] 為 例， 寫 一 R 函 式 (命 名 為 kendall_tau) 
計算 Kendall 等級相關係數，並與 cor. 相比較。
(b) 寫出此程式之說明文件，需至少包含 Description, Usage, Arguments, Details,
    Value, See Also, 和 Examples。
(c) 編譯此套件專案，並製出此套件之二元安裝檔 (學號-R-exam3-2_0.1.0.zip)。

kendall_tau <- function(x, y) {
  n <- length(x)
  concordant <- 0
  discordant <- 0
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      if ((x[i] > x[j] && y[i] > y[j]) || (x[i] < x[j] && y[i] < y[j])) concordant <- concordant + 1
      if ((x[i] > x[j] && y[i] < y[j]) || (x[i] < x[j] && y[i] > y[j])) discordant <- discordant + 1
    }
  }
  tau <- (concordant - discordant) / (n*(n-1)/2)
  cat("Kendall τ =", round(tau,4), "\n")
  cat("cor(x, y, method='kendall') =", cor(x, y, method="kendall"), "\n")
}

kendall_tau(iris[,1], iris[,3])


2.66 寫一「剪刀石頭布遊戲」的 R 程式。執行畫面示意如下。
(提示: (1) 你的答案可能跟畫面不一樣
       (2) 電腦出拳是隨機抽樣
       (3) 畫面至少玩 8 次以上，最後一次是### 剪刀石頭布遊戲開始 ###
 請輸入你要出的拳頭
 (a: 剪刀, b: 石頭, c: 布, d: 不玩了): a
 電腦出布，你出剪刀，你贏了!
   
   請輸入你要出的拳頭
 (a: 剪刀, b: 石頭, c: 布, d: 不玩了): b
 電腦出石頭，你出石頭，你們平手!
   
   請輸入你要出的拳頭
 (a: 剪刀, b: 石頭, c: 布, d: 不玩了): c
 電腦出剪刀，你出布，你輸了!
   
   請輸入你要出的拳頭
 (a: 剪刀, b: 石頭, c: 布, d: 不玩了): d
 謝謝再會!
   
   
   game <- function() {
     cat("### 剪刀石頭布遊戲開始 ###\n")
     choice <- c("剪刀", "石頭", "布")
     
     repeat {
       user <- readline("請輸入你要出的拳頭(a:剪刀, b:石頭, c:布, d:不玩了): ")
       if (user == "d") {cat("謝謝再會!\n"); break}
       
       # 將 a/b/c 對應到拳頭
       user_choice <- switch(user, a="剪刀", b="石頭", c="布", "無效")
       comp_choice <- sample(choice, 1)
       
       cat("電腦出", comp_choice, "，你出", user_choice, "\n")
       
       if (user_choice == comp_choice) cat("你們平手!\n")
       else if ((user_choice=="剪刀" && comp_choice=="布") ||
                (user_choice=="石頭" && comp_choice=="剪刀") ||
                (user_choice=="布" && comp_choice=="石頭"))
         cat("你贏了!\n")
       else cat("你輸了!\n")
     }
   }
 
 # 測試
 set.seed(12345)
 game()
 
   
2.67 依下列步驟，完成一「剪刀石頭布遊戲」的 R 程式。
 (a) (10 分) 由電腦隨機產生一個拳頭 (剪刀、石頭、布)，並印出。(提示: sample)
 (b) (10 分) 由營幕輸入玩家要出的拳頭，使得執行的畫面如下。(提示: switch)
     請輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了): a
     玩家出: 剪刀
 (c) (50 分) 寫一「剪刀石頭布遊戲」的 R 程式 (命名 game)，
     使得程式執行的畫面如下。
     (提示: (1) 電腦出拳是隨機抽樣。
            (2) repeat, break
      > set.seed(12345)
      > game()
      ### 剪刀石頭布遊戲開始 ###
      請輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):
        1: a
      電腦出[ 布 ], 你出[ 剪刀 ], 你[ 贏 ]了!
        
      請輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):
      1: b
      電腦出[ 布 ], 你出[ 石頭 ], 你[ 輸 ]了!
        
      請輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):
      1: c
      電腦出[ 布 ], 你出[ 布 ], 你[ 平手 ]了!
        
      請輸入你要出的拳頭(a: 剪刀, b: 石頭, c: 布, d: 不玩了):
      1: d
      
 2.68 小明和小漢在玩 5 × 5 的數字賓果遊戲。開獎數字報出後，賓果盤上相對應的數字
      則以加記星號表示，若某一橫列或直列或對角列之 5 個數字皆被標記，則記為一連
      線。誰先得到五連線則為贏家。程式設計要點如下:
      (a) 請隨機產生兩個並排之數字賓果盤 
      (數字 1 至 25 擺至 5 × 5 之矩陣不重覆，你的答案和以下所列可能不同)。
      (b) 請隨機產生一個開獎數字，兩個人之賓果盤上相對應的數字則以加記星號表示。
      (c) 重覆上述開獎過程，開獎數字與之前已開出之號碼不重覆。
      (d) 計算連線數，若達到設定連線數，則為贏家。
      
      設定本數字賓果遊戲先達成之連線數為贏家: 1
      小明 小漢
      ====== ======
        7 14 16 9 24 13 4 7 20 9
      4 6 22 17 1 5 11 15 6 17
      18 12 19 25 11 12 14 24 3 25
      8 15 20 21 13 22 2 21 19 8
      5 2 3 23 10 10 23 18 16 1
      繼續開獎(y/n): y 開獎號碼: 4
      小明 小漢
      ====== ======
        7 14 16 9 24 13 4* 7 20 9
      4* 6 22 17 1 5 11 15 6 17
      18 12 19 25 11 12 14 24 3 25
      8 15 20 21 13 22 2 21 19 8
      5 2 3 23 10 10 23 18 16 1
      繼續開獎(y/n): y 開獎號碼: 13
      小明 小漢
      ====== ======
        7 14 16 9 24 13* 4* 7 20 9
      4* 6 22 17 1 5 11 15 6 17
      18 12 19 25 11 12 14 24 3 25
      8 15 20 21 13* 22 2 21 19 8
      5 2 3 23 10 10 23 18 16 1
      ....
      繼續開獎(y/n): y 開獎號碼: 19
      小明 小漢
      ====== ======
        7 14 16 9 24* 13* 4* 7 20 9
      4* 6 22 17 1 5 11* 15 6 17
      18 12 19* 25 11* 12 14 24* 3 25
      8 15 20 21 13* 22 2 21 19* 8
      5 2 3 23 10 10 23 18 16 1*
        小漢: 1 連線，小明: 0 連線。小漢 為贏家。遊戲結束。
      bingo <- function() {
        Ming <- matrix(sample(1:25), ncol=5)
        Han  <- matrix(sample(1:25), ncol=5)
        
        cat("小明:\n"); print(Ming)
        cat("小漢:\n"); print(Han)
        
        called <- c()
        
        repeat {
          ans <- readline("繼續開獎(y/n): ")
          if (ans != "y") break
          
          num <- sample(setdiff(1:25, called), 1)
          called <- c(called, num)
          cat("開獎號碼:", num, "\n")
          
          Ming[Ming==num] <- paste0(Ming[Ming==num], "*")
          Han[Han==num] <- paste0(Han[Han==num], "*")
          
          cat("小明:\n"); print(Ming)
          cat("小漢:\n"); print(Han)
          
          # 檢查是否達成連線（橫或直）
          check_line <- function(board) {
            row_sum <- sum(apply(board, 1, function(r) all(grepl("\\*", r))))
            col_sum <- sum(apply(board, 2, function(c) all(grepl("\\*", c))))
            diag_sum <- all(grepl("\\*", diag(as.matrix(board)))) +
              all(grepl("\\*", diag(apply(board, 2, rev))))
            row_sum + col_sum + diag_sum
          }
          
          ming_line <- check_line(Ming)
          han_line <- check_line(Han)
          
          if (ming_line >= 1 | han_line >= 1) {
            cat("小明:", ming_line, "連線，小漢:", han_line, "連線。\n")
            winner <- ifelse(ming_line > han_line, "小明", "小漢")
            cat(winner, "為贏家，遊戲結束!\n")
            break
          }
        }
      }
      
      bingo()
      
  
2.69 小銘和小漢在玩「幾 A 幾 B 猜數字」的遊戲。若小銘真正答案為「2985」, 
      小漢猜測為「1928」，即為「1A2B」, 請幫小銘寫一 R 程式自動報出幾 A 幾 B，
      直到小漢猜測全答對為止。
      (提示: 讀取猜測數字 ⇒ 判別 ⇒ 報出幾 A 幾 B ⇒ 若為 4A 則程式結束，否則再次讀取猜測數字 (迴圈))
      幾A 幾B猜數字: 小銘答案: 2985
      =============================
      小漢猜測: 1928 => 1A2B
      小漢猜測: 2934 => 2A
      小漢猜測: 2958 => 2A2B
      小漢猜測: 2985 => 4A
      =============================
        
        
2.70 小魯哥在玩「幾 A 幾 B 猜數字」的遊戲，規則是電腦隨機產生一組 4 位數，
      其數字為 1∼9，不得重覆。(本題設定是 1∼9 喔!) 
      若假設產生之數字為「8739」, 小魯哥猜測為「1938」，即為「1A2B」，
      A 代表某一數字及位置正確，B 代表某一數字
      正確但位置不正確，AB 字母前面的數字代表這種類型的數字有幾個; 
      X 代表 4 個數字皆不正確。(若不清楚遊戲規則，可自行 google 一下。) 
      請幫小魯哥寫一 R 程式 (命名為 play，輸入為學號、姓名及隨機種子) 
      自動報出幾 A 幾 B，直到小魯哥猜測全答對為止。
      (註: 需測試兩組以上的隨機種子; 需印出是第幾次猜測。)
      
      play <- function(id, name, seed){
        set.seed(seed)
        computer <- ...
        ... scan ....
      }
      > play(410971234, "小魯哥", 123456)
      學號: 410971234; 姓名: 小魯哥
      幾A幾B猜數字遊戲:
        =============================
        第1次猜測: 1245 => X
      第2次猜測: 1938 => 1A2B
      第3次猜測: 2938 => 1A2B
      第4次猜測: 1839 => 2A1B
      第5次猜測: 8739 => 4A (遊戲結束)
      =============================
        > play(410971234, "小魯哥", 654321)

      play <- function(id, name, seed) {
        set.seed(seed)
        computer <- sample(1:9, 4)
        cat("學號:", id, "; 姓名:", name, "\n")
        cat("幾A幾B猜數字遊戲:\n=============================\n")
        
        times <- 0
        repeat {
          guess <- scan(what=integer(), nmax=4)
          times <- times + 1
          A <- sum(guess == computer)
          B <- sum(guess %in% computer) - A
          if (A == 4) {
            cat("第", times, "次猜測:", guess, "=> 4A (遊戲結束)\n")
            break
          } else if (A == 0 & B == 0)
            cat("第", times, "次猜測:", guess, "=> X\n")
          else
            cat("第", times, "次猜測:", guess, "=>", A, "A", B, "B\n")
        }
        cat("=============================\n")
      }
      
      # 測試
      # play(410971234, "小魯哥", 123456)
      
      
2.71 小銘到巷口跟賣香腸的阿伯玩十八啦，亦即擲四顆公平的六面骰子到一個大湯中，
     計算點數和，跟阿伯比大小，贏的話就可得到一根香腸。其中點數計算規則如下:
      (a) 四個骰子挑出兩顆相同的不計，看另兩顆骰子點數和: 例：3345， 33 成對拿掉，
          剩下 45，點數和為 9。例：1662， 66 成對拿掉，剩下 12，點數和為 3，
          直接判定最輸，這個叫「逼基」。
      (b) 若四顆點數皆異 (如 2456)，或有三顆點數相同 (如 1555)，都不算，重新擲骰子。
      (c) 若兩兩相同 (如 3344)，取大的對子，即 44，點數和為 8。
      (d) 兩顆六點 + 另兩顆相同的點數，例：3366, 2266, 1166 等，點數和為 12 點，
          這個叫「十八」。
      (e) 四顆點數皆同 (如 5555)，稱為「豹子」、「通殺」或「一色」，點數和是最大。
      請寫一 R 程式，模擬擲四個骰子的狀況, 亦即隨機產生四個 1 至 6 的數字，當成擲
      四個骰子的點數，依上述規則，印出點數和或俗稱。請印出擲 10 次之結果。
      四顆骰子點數 點數和/俗稱
      ============================
      3345 9
      1662 逼基
      ... ...
      ... ...
      5555 通殺
      2654 無面
      2266 十八
      
2.72 搶旗遊戲: 遊戲一開始，有一個旗子位於中央位置 (編號 0)，如下圖所示。玩家出拳
     (剪刀、石頭、布)，與電腦相比，用猜拳來決定前進或後退。
      若玩家贏則往右一 步，反之若電腦贏則往左一步，平手的話，則不動。
      若前進到位置 3 或後退到位置-3，則遊戲結束，印出勝利者。
     (註: R 函式命名 playEX3; 需先 set.seed(123456))
      搶旗畫面程式:
        show <- function(k=4){
          odd <- seq(1, 15, 2)
          even <- seq(2, 15, 2)
          flag <- character(15)
          flag[1:15] <- " "
          flag[even] <- " "
          flag[even[k]] <- " f"
          loc <- character(15)
          loc[odd] <- "|"
          loc[even] <- c(-3:(-1), "00", paste0("+", 1:3))
          cat(flag, "\n")
          cat(loc, "\n")
          k
        }
      執行畫面示意範列如下頁:
        > set.seed(123456)
      > playEx3()
      搶旗遊戲
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        (1) 剪刀 (2)石頭 (3) 布:
        1: 1
      電腦: 布
      玩家: 剪刀
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        (1) 剪刀 (2)石頭 (3) 布:
        1: 1
      電腦: 布
      玩家: 剪刀
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        (1) 剪刀 (2)石頭 (3) 布:
        1: 1
      電腦: 石頭
      玩家: 剪刀
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        (1) 剪刀 (2)石頭 (3) 布:
        1: 2
      電腦: 石頭
      玩家: 石頭
      (1) 剪刀 (2)石頭 (3) 布:
        1: 3
      電腦: 石頭
      玩家: 布
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        (1) 剪刀 (2)石頭 (3) 布:
        1: 2
      電腦: 剪刀
      玩家: 石頭
      f
      | -3 | -2 | -1 | 00 | +1 | +2 | +3 |
        game over!