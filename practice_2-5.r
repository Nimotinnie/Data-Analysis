#2.41 有一數學函數為
#          |x2 + x|, x < 0,
#f (x) =   sin(x), 0 ≤ x < 3,
#          3ex, x ≥ 3.
#請寫一 R 函式，計算並列出下列表格:
   x      fx
1 -5  20.0000000
2 -4  12.0000000
3 -3  6.0000000
4 -2  2.0000000
5 -1  0.0000000
6  0   0.0000000
7  1   0.8414710
8  2   0.9092974
9  3   60.2566108
10 4  163.7944501
11 5  445.2394773

# 定義一個函數 f，輸入 x，依不同區間計算對應的函數值
f <- function(x) {
  if (x < 0) {                 # 若 x 小於 0，則使用 x^2 + x
    return(x^2 + x)
  } else if (x >= 0 && x < 3) {# 若 0 ≤ x < 3，使用 sin(x)
    return(sin(x))
  } else {                     # 若 x ≥ 3，使用 3*exp(x)
    return(3 * exp(x))
  }
}

# 建立從 -5 到 5 的整數序列
x <- -5:5

# 對每個 x 呼叫 f(x)，並儲存結果
fx <- sapply(x, f)

# 建立成一個資料框
result <- data.frame(x, fx)

# 印出結果表格
print(result)

2.42 輸入包含左右小括號之字串 (最長為 40 字元)，請判斷是否左右小括號配對正確。
(例 1) 輸入：((1+2)-3)*(4/5)
輸出：括號配對正確。
(例 3) 輸入：(((1+2+3) 輸出：括號配對不正確。
(例 3) 輸入：((1+2)*(3+4)*(5+6))/(7+8) 輸出：括號配對正確。
# 定義函數 check_bracket，判斷字串中括號是否配對
check_bracket <- function(expr) {
  count <- 0    # 用來記錄 "(" 和 ")" 的平衡狀態
  
  # 將字串分割成單一字元，逐一檢查
  for (ch in strsplit(expr, "")[[1]]) {
    if (ch == "(") count <- count + 1        # 每遇到左括號，+1
    if (ch == ")") count <- count - 1        # 每遇到右括號，-1
    if (count < 0) return("括號配對不正確。") # 若出現過多右括號，立即錯誤
  }
  
  # 若最後 count == 0，則配對正確；否則錯誤
  if (count == 0) return("括號配對正確。")
  else return("括號配對不正確。")
}

# 測試案例
check_bracket("((1+2)-3)*(4/5)")
check_bracket("(((1+2+3)")
check_bracket("((1+2)*(3+4)*(5+6))/(7+8)")

#2.43 某國發行了 1，5，10，50，100 不同面額的鈔票，若有人要從銀行領出 N 元，銀行
#     行員要如何發給鈔票，使用的張數會最少? (試寫一 R 函式，命名為 Change_Money)
#     (例) 輸入: 478元。
#.         輸出:1 元 3 張，5 元 1 張，10 元 2 張，50 元 1 張，100 元 4 張，共 478
       Change_Money <- function(N) {
       # 定義可用的鈔票面額
       values <- c(100, 50, 10, 5, 1)
       
       # 建立一個空向量，用來記錄每種面額使用的張數
       count <- integer(length(values))
       
       # 剩餘金額初始為 N
       remaining <- N
       
       # 從最大面額開始依序計算
       for (i in seq_along(values)) {
         count[i] <- remaining %/% values[i]   # 計算可用幾張該面額
         remaining <- remaining %% values[i]   # 更新剩餘金額
       }
       
       # 輸出每種面額與張數
       for (i in seq_along(values)) {
         if (count[i] > 0)
           cat(values[i], "元", count[i], "張\n")
       }
       cat("共", N, "元\n")
     }
     
     # 測試
     Change_Money(478)
     
     
#2.44 平面上兩點 (x1, y1), (x2, y2) 之的距離式為: d= √(x1− x2)2 + (y1− y2)2。
#     給定 n 個點 (n ≤ 10)，找出構成最小周長的三角形的三個點。
#     (例) 輸入: (1,1)(0,0)(4,3)(2,0)(7,8)
#     輸出: 三點為 (1,1)(0,0)(2,0)，其周長為 4.828428。
     min_triangle <- function(points) {
       n <- nrow(points)                           # n 為點的數量
       min_peri <- Inf                             # 初始最小周長設為無限大
       best <- NULL                                # 儲存最佳三點
       
       # 計算兩點距離的內部函數
       dist <- function(p1, p2) sqrt(sum((p1 - p2)^2))
       
       # 三層迴圈列舉所有三點組合
       for (i in 1:(n-2))
         for (j in (i+1):(n-1))
           for (k in (j+1):n) {
             p1 <- points[i,]; p2 <- points[j,]; p3 <- points[k,]
             
             # 計算周長
             peri <- dist(p1, p2) + dist(p2, p3) + dist(p3, p1)
             
             # 若小於目前最小周長，更新最佳解
             if (peri < min_peri) {
               min_peri <- peri
               best <- rbind(p1, p2, p3)
             }
           }
       cat("三點為:\n"); print(best)
       cat("其周長為:", min_peri, "\n")
     }
     
     # 測試資料
     points <- matrix(c(1,1, 0,0, 4,3, 2,0, 7,8), ncol=2, byrow=TRUE)
     min_triangle(points)
     
     
#2.45 任意輸入 3 個座標，判別它是屬於下列哪種三角形: (1) 不是三角形 (2) 直角三角形
#     (3) 正三角形 (4) 等腰三角形 (5) 其它三角形。
#     例如: 三個座標為: (0, 0)(3, 0)(0, 4)
#     輸入: 0 0 3 0 0 4
#     輸出: 直角三角形
     triangle_type <- function(x1,y1,x2,y2,x3,y3) {
       # 計算三邊長度
       d1 <- sqrt((x1-x2)^2 + (y1-y2)^2)
       d2 <- sqrt((x2-x3)^2 + (y2-y3)^2)
       d3 <- sqrt((x3-x1)^2 + (y3-y1)^2)
       
       # 將三邊排序
       sides <- sort(c(d1,d2,d3))
       a <- sides[1]; b <- sides[2]; c <- sides[3]
       
       # 根據幾何關係判斷種類
       if (a + b <= c) return("不是三角形")
       if (abs(a-b) < 1e-6 && abs(b-c) < 1e-6) return("正三角形")
       if (abs(c^2 - (a^2 + b^2)) < 1e-6) return("直角三角形")
       if (abs(a-b) < 1e-6 || abs(b-c) < 1e-6 || abs(a-c) < 1e-6) return("等腰三角形")
       return("其它三角形")
     }
     
     # 測試
     triangle_type(0,0,3,0,0,4)
     
     
#2.46 寫一 R 函式 (命名 check_triangle)，輸入為任意 3 個座標點，輸出為座標點所
#     形成的三角形及三邊的長度，其中所形成的三角形有下列可能: 
#     (1) 不可為三角形，
#     (2) 直角三角形，
#     (3) 正三角形，
#     (4) 等腰三角形，
#     (5) 其它三角形。
#    例如: 三個座標為: (0, 0)(3, 0)(0, 4)，則輸入: 「0 0 3 0 0 4」，
#    並輸出: 「邊長: 3 4 5，直角三角形」。請利用以下五組座標點測試:
     1. A: (4, 6) (-2, 8) (-8, 10)
     2. B: (16, 14) (8, 2) (2, 6)
     3. C: (0, 4) (8, 4) (4, 4+4$\sqrt{3}$)
     4. D: (-4, 2) (4, 6) (-2, 8)
     5. E: (12, 9) (8, 2) (2, 1)
     
     check_triangle <- function(x1, y1, x2, y2, x3, y3) {
       # 定義距離函數，計算兩點間距離
       d <- function(xa, ya, xb, yb) sqrt((xa - xb)^2 + (ya - yb)^2)
       
       # 計算三邊長度
       a <- d(x1, y1, x2, y2)
       b <- d(x2, y2, x3, y3)
       c <- d(x3, y3, x1, y1)
       
       # 將三邊排序，方便之後判斷
       sides <- sort(c(a, b, c))
       cat("邊長:", round(sides, 3), "\n")
       
       # ---- 判別三角形種類 ----
       # 　1 檢查是否能構成三角形
       if (sides[1] + sides[2] <= sides[3]) return("不可為三角形")
       
       # 2️ 正三角形：三邊幾乎相等
       if (abs(sides[1] - sides[2]) < 1e-6 && abs(sides[2] - sides[3]) < 1e-6)
         return("正三角形")
       
       # 3 直角三角形：勾股定理 a² + b² = c²
       if (abs(sides[1]^2 + sides[2]^2 - sides[3]^2) < 1e-6)
         return("直角三角形")
       
       # 4️ 等腰三角形：有任兩邊相等
       if (abs(sides[1] - sides[2]) < 1e-6 || abs(sides[2] - sides[3]) < 1e-6 || abs(sides[1] - sides[3]) < 1e-6)
         return("等腰三角形")
       
       # 5️ 其他三角形
       return("其它三角形")
     }
     
     
#2.47 試寫一 R 程式，由營幕輸入三個座標點，判別這個三點是否可形成一三角形，
#     若可以，則是屬於哪一種三角形 (純角、直角、銳角)。程式要求如下:
#       (a) 需有: 標頭、使用者提示、輸出判別結果、是否繼續判別下一組座標點。
#           (請參照程式風格講義範例 1)
#       (b) 4 組測試座標: (1) (1, 5), (3, 1), (9, 4);
#                         (2) (5, 4), (2, 1), (8,−3); 
#                         (3) (3, 4), (2, 1), (1,−2);
#                         (4) (3, 4), (2, 1), (6, 6).
     triangle_angle <- function() {
       repeat {   # 使用 repeat 讓使用者可多次輸入
         cat("請輸入三個座標(x1,y1,x2,y2,x3,y3): ")
         input <- scan(what=numeric(), nmax=6)    # 從鍵盤讀入六個數字
         
         # 拆開成三個點
         x1<-input[1]; y1<-input[2]
         x2<-input[3]; y2<-input[4]
         x3<-input[5]; y3<-input[6]
         
         # 定義距離函數
         d <- function(xa,ya,xb,yb) sqrt((xa-xb)^2 + (ya-yb)^2)
         a<-d(x1,y1,x2,y2); b<-d(x2,y2,x3,y3); c<-d(x3,y3,x1,y1)
         sides <- sort(c(a,b,c))
         
         if (sides[1]+sides[2]<=sides[3]) {
           cat("不是三角形\n")
         } else {
           # 根據勾股定理判斷角度型態
           if (abs(sides[3]^2 - (sides[1]^2 + sides[2]^2)) < 1e-6)
             cat("直角三角形\n")
           else if (sides[3]^2 > (sides[1]^2 + sides[2]^2))
             cat("鈍角三角形\n")
           else
             cat("銳角三角形\n")
         }
         
         # 詢問是否繼續
         ans <- readline("是否繼續(Y/N)? ")
         if (toupper(ans)!="Y") break
       }
     }
     
2.48 世界衛生組織計算標準體重之方法如下:
     男性：（身高 cm− 80）×70%= 標準體重女性：（身高 cm− 70）×60%= 標準體重
     寫一 R 函式，命名為 ComputeWeight, 沒有輸入
     執行此程式後，會由營幕詢問「性別」，及「身高 (公分)」，
     計算並印出此身高的標準體重 (公斤)。
     (執行ComputeWeight 程式後，以 (1) 男生 175 公分及 (2) 女生 166 公分為範例)
     
     ComputeWeight <- function() {
       gender <- readline("請輸入性別(男/女): ")      # 從鍵盤讀入性別
       height <- as.numeric(readline("請輸入身高(公分): ")) # 讀入身高
       
       # 根據性別使用不同公式
       if (gender == "男") {
         weight <- (height - 80) * 0.7
       } else {
         weight <- (height - 70) * 0.6
       }
       
       # 輸出結果
       cat("標準體重為:", round(weight,2), "公斤\n")
     }
     
     # 測試
     ComputeWeight()
     
      
#2.49 某地購買物品需加收增值稅 (VAT)，而增值稅會根據所物品類別不同而有不同之稅率，
#。   今稅率表如下:
#       類別 產品 VAT
      印刷品類 書, 雜誌, 報紙等等 8%
      食物類 蔬菜, 肉品, 飲料等等 10%
      衣服類 T 恤, 牛仔褲, 上衣等等 20%
#     某人買了下列 5 樣物品 (括弧內數字為不含稅之花費金額)
#    {書 (50 元)、肉品 (200元)、上衣 (299 元)、牛仔褲 (1200 元)、飲料 (20 元)}
#     (提示: %in%, ifelse)
#      (a) 造出以下資料框 (data.frame)。
        品項 價格  類別     VAT
      1 書   50   印刷品類 0.08
      2 肉品 200 食物類    0.10
      3 上衣 299 衣服類    0.20
      4 牛仔褲 1200 衣服類 0.20
      5 飲料 20 食物類     0.10
      
#      (b) 請計算此次消費所付出之總稅額。
      
      # 建立原始資料
      item <- c("書","肉品","上衣","牛仔褲","飲料")  # 品項名稱
      price <- c(50,200,299,1200,20)                  # 價格
      category <- c("印刷品類","食物類","衣服類","衣服類","食物類")  # 類別
      
      # 根據類別設定 VAT 稅率
      VAT <- ifelse(category=="印刷品類",0.08,
                    ifelse(category=="食物類",0.10,0.20))
      
      # 組成資料框
      df <- data.frame(品項=item, 價格=price, 類別=category, VAT=VAT)
      print(df)
      
      # 計算總稅額
      total_VAT <- sum(price * VAT)
      cat("此次總稅額:", total_VAT, "元\n")
      
2.50
2.51