# 2.1 丟 3 顆公平的骰子，其和為 dice.sum，
# dice.sum <- sum(sample(1:6, 3, replace = TRUE))
# 試寫一 R 函式，印出總和 dice.sum 並做如下判別: 如果和大於 13 點，則印出「厲害!」，
# 反之印出「再加油!」。

dice.sum <- sum(sample(1:6, 3, replace = TRUE))
if(dice.sum>13) cat("厲害!") else cat ("再加油")

# 2.2 
# (a) 請利用 for 寫一函式, 計算一數列之平均數及變異數。
  my_stats <- function(x) {
  n <- length(x)
  # 平均數
  mean_x <- 0
  for (i in 1:n) {
    mean_x <- mean_x + x[i]
  }
  mean_x <- mean_x / n
  
  # 變異數
  var_x <- 0
  for (i in 1:n) {
    var_x <- var_x + (x[i] - mean_x)^2
  }
  var_x <- var_x / (n - 1)   # 不偏估計
  
  # 回傳結果
  return(list(mean = mean_x, variance = var_x))
  }
  
#(b) 若有一成績紀錄如下
#    x <- sample(0:100, 50),請利用上小題之函式算出平均數及變異數。
    
    set.seed(12345)
    x <- sample(0:100, 50)
    my_stats(x)
    
(c) 請與 mean 和 sd 之結果相比較 #自己寫的 vs 系統寫的
    mean(x)
    var(x)
    sd(x)

# 2.3 利用 for 寫一函式，印出九九乘法表。
# 定義函式
multiply <- function() {
  for (i in 1:9) {           # 外層控制「被乘數」
    for (j in 1:9) {         # 內層控制「乘數」
      cat(i, "x", j, "=", i*j, "\t")  # \t 代表跳一格
    }
    cat("\n")  # 每一列結束後換行
  }
}

# 呼叫函式
multiply()

2.4 利用雙迴圈 for，印出下列圖形。
(a) 
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5

for (i in 1:5) {          # 外圈控制行數 (1~5)
  for (j in 1:i) {        # 內圈控制每行要印的數字
    cat(j, "")            # cat() 可連續印出字串，不換行
  }
  cat("\n")               # 每行結束後換行
}


(b)
     1
    333
   55555
  7777777
 999999999
 
 for (i in 1:5) { 
   num <- 2 * i - 1                 # 計算要印的數字（奇數序列：1,3,5,7,9）
   cat(rep(" ", 5 - i), sep = "")   # 先印空白（讓數字置中）
   cat(rep(num, num), sep = "")     # 再印相同數字 num 次
   cat("\n")
 }

2.5 輸入任何一個正整數 n(n ≤ 10)，輸出 n 階層的 Pascal 三角形。
(例) 輸入: 5
輸出:
          1
       1.     1
     1    2     1
   1   3      3    1
 1   4    6     4     1
 

2.6 利用 for，試計算 (1 × 2 × · · · × 1000000) 之結果所需要的電腦系統時間。

2.7 
#(a) 計算 n! 的程式可採用 (1) for, (2) repeat, (3) while, 
#.                        (4) 遞迴法及 (5) R 指令factorial
#    (詳細程式見講義)。請用以上五種方法分別計算 1000! 所需要的系統時間

# 方法 (1)：for 迴圈
system.time({
  result1 <- 1
  for (i in 1:1000) result1 <- result1 * i
})

# 方法 (2)：repeat 迴圈
system.time({
  i <- 1; result2 <- 1
  repeat {
    result2 <- result2 * i
    i <- i + 1
    if (i > 1000) break            # 條件達成即中止
  }
})

# 方法 (3)：while 迴圈
system.time({
  i <- 1; result3 <- 1
  while (i <= 1000) {
    result3 <- result3 * i
    i <- i + 1
  }
})

# 方法 (4)：遞迴法
fact_recursive <- function(n) {
  if (n == 1) return(1)            # 終止條件
  return(n * fact_recursive(n - 1))
}
system.time(fact_recursive(1000))

# 方法 (5)：內建函數 factorial()
system.time(factorial(1000))


#(b) 呈上題，請用指令 system.time 再分別計算一次
system.time({
  result <- 1
  for (i in 1:1000000) {
    result <- result * i           # 計算乘積（但會超過 double 限制）
  }
})

#2.9 R 物件 number 是一個具有 1000 個正整數的數字向量，其數字範圍為 0 到 100，
#    而數字於向量中的位置記為 1∼1000。
set.seed(12345)
number <- sample(0:100, 1000, replace=T)

#(a) 使用 for，找出 number 數字向量中，第 100 個偶數的出現的位置，其數字為何
# (a) for 迴圈
count <- 0
for (i in 1:length(number)) {
  if (number[i] %% 2 == 0) {       # %% 是取餘數 (判斷偶數)
    count <- count + 1
    if (count == 100) {            # 找到第100個偶數時停止
      cat("(for) 第100個偶數在位置:", i, "其數字為:", number[i], "\n")
      break
    }
  }
}

#(b) 使用 repeat，找出 number 數字向量中，第 100 個偶數的出現的位置，其數字為何
# (b) repeat 迴圈
count <- 0
i <- 1
repeat {
  if (number[i] %% 2 == 0) count <- count + 1
  if (count == 100) {
    cat("(repeat) 第100個偶數在位置:", i, "其數字為:", number[i], "\n")
    break
  }
  i <- i + 1
}


#(c) 使用 while，找出 number 數字向量中，第 100 個偶數的出現的位置，其數字為何
# (c) while 迴圈
count <- 0
i <- 1
while (i <= length(number)) {
  if (number[i] %% 2 == 0) count <- count + 1
  if (count == 100) {
    cat("(while) 第100個偶數在位置:", i, "其數字為:", number[i], "\n")
    break
  }
  i <- i + 1
}

#2.10 某商業公司舉行抽獎活動，中獎名單紀錄於 award-list.xlsx 檔中, 
#包含會員姓名、會員卡號及得獎金額。2.1 讀取資料
(a) 請讀取此檔案，並印出全部中獎名單。

(b) 因考量個資法，公告名單不能將全名公開，請你幫此名單，每一中獎者的姓
名及會員卡號，部份字元打上 *，例如第一筆紀錄為「沈俞予 7113235607」，
請改為「沈 * 予 7113***607」，印出修改後可公告之名單。(提示: substr)
  會員姓名 會員卡號 得獎金額
1 沈*予 7113***607 500
2 簡*榕 8010***376 1000
3 徐*良 9010***896 2000
4 賴*茹 3010***872 1500
5 林*玲 5011***845 4500
6 吳*鳳 2592***839 1000
7 江*翰 3714***694 3000
8 葉*鴻 4012***657 2500
9 阮*全 3053***421 5000
10 黃*鈴 3317***422 3500

(c) 承上小題，請將修改後之名單，依照「得獎金額」由多至少的順序，全部印出。
  會員姓名 會員卡號 得獎金額
1 阮*全 3053***421 5000
2 林*玲 5011***845 4500
3 黃*鈴 3317***422 3500
4 江*翰 3714***694 3000
5 葉*鴻 4012***657 2500
6 徐*良 9010***896 2000
7 賴*茹 3010***872 1500
8 簡*榕 8010***376 1000
9 吳*鳳 2592***839 1000
10 沈*予 7113***607 500