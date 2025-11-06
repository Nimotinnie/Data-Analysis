# 2.31 試寫一 R 函式 (命名為 triangle_side_length) 計算三角形之三邊長，其中輸入
# 為直角座標系上之三個點座標 (A(x1, y1), B(x2, y2), C(x3, y3)), 輸出為三個點座標所
# 形成的三角形之三邊長。程式執行以 A(3, 2), B(5, 8), C(12, 4) 三點座標為範例。
# a + b + c
triangle_side_length <- function(x1, y1, x2, y2, x3, y3) {
  a <- sqrt((x2 - x3)^2 + (y2 - y3)^2)
  b <- sqrt((x1 - x3)^2 + (y1 - y3)^2)
  c <- sqrt((x1 - x2)^2 + (y1 - y2)^2)
  return(c(a = a, b = b, c = c)) #輸出名稱=變數名稱
}

triangle_side_length(3, 2, 5, 8, 12, 4)

# 2.32 海龍公式 (Heron’s formula 或 Hero’s formula)，是利用三角形的三條邊長 (a, b, c)
# 來求取三角形面積 (A) 的一個方法，其公式如下
# A= √s(s− a)(s− b)(s− c), where s =(a+b+c) / 2
# 試寫一 R 函式 (命名為 Heron) 計算三角形之面積，其中輸入為三角形之三邊長，
# 輸出為此三角形之面積。程式執行，三邊長以 7、8、9 為範例。
Heron <- function(a, b, c) {
                 s <- (a + b + c) / 2
                 A <- sqrt(s * (s - a) * (s - b) * (s - c))
         return(A)
          }

Heron(7, 8, 9)

# 2.33 有某一試卷之測驗結果，紀錄於”answer.txt”。試卷中 10 題選擇題之正確答案依序為
# B, D, B, D, D, A, C, D, C, B
# (a) 請讀取此資料，並列印前 5 筆紀錄。
# > first5.records
#    V1 V2 V3 V4 V5 V6 V7 V8 V9 V10
# s1 C D D A D A B C C B
# s2 B D B D D A C D B B
# s3 B A A B D A C B C B
# s4 B D B A B C C D C B
# s5 B D D D A C C D A B
# 正確答案

correct <- c("B", "D", "B", "D", "D", "A", "C", "D", "C", "B")

answer <- read.table('/Volumes/NO NAME 1/Practice/data/answer.txt', header = FALSE)
first5.records <- answer[2:5, ]
print(first5.records)

  V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11
2 s1  C  D  D  A  D  A  B  C   C   B
3 s2  B  D  B  D  D  A  C  D   B   B
4 s3  B  A  A  B  D  A  C  B   C   B
5 s4  B  D  B  A  B  C  C  D   C   B

# (b) 若某學生之答案為 A, D, B, D, B, A, B, D, C, B
# 試問他答對哪些題目。若答對一題得 10 分，則此[學生所得之總分]為何?
# > correct.item
# [1] 2 3 4 6 8 9 10
# > n.correct
# [1] 70
# 提示: as.integer, as.factor, which
student <- c("A","D","B","D","B","A","B","D","C","B")
correct.item <- which(student == correct)
n.correct <- length(correct.item) * 10
> correct.item
[1]  2  3  4  6  8  9 10
> n.correct
[1] 70

# (c) 若答對一題得 10 分，請計算[每個人的總得分]，並印出得分表格如下:
# > score.table
# 0 10 20 30 40 50 60 70 80 90 100
# 9 18 16 9 18 19 27 34 25 10 6
# 提示: t, apply, table
score <- apply(answer, 1, 
               function(x) 
                 sum(x == correct) * 10)
score.table <- table(score)
score.table

# (d) 若設定總得分前 25% 為高分組，總得分後 25% 為低分組，則哪些學生是高分組，
#     哪些學生是低分組，而人數各為多少人。
# 假設 score 為數值向量
n <- length(score)
# 排序後的索引（由高到低）
rankID <- order(score, decreasing = TRUE)
# 前 25%（高分組）
topID <- rankID[1:ceiling(0.25 * n)]

# 後 25%（低分組）
lowID <- rankID[(n - floor(0.25 * n) + 1):n]

# 查看結果
> rownames(answer)[topID]  # 高分組列名
[1] "65"  "6"   "72"  "77"  "98"  "127" "141" "146" "179" "186" "7"   "15"  "18"  "64"  "71"  "84" 
[17] "87"  "99"  "128" "159" "162" "164" "173" "174" "175" "185" "2"   "3"   "10"  "16"  "17"  "19" 
[33] "20"  "21"  "22"  "26"  "29"  "34"  "39"  "40"  "48"  "51"  "63"  "66"  "68"  "70"  "75"  "80" 
[49] "82" 
> rownames(answer)[lowID]  
[1] "191" "193" "4"   "9"   "14"  "25"  "27"  "31"  "33"  "36"  "38"  "44"  "45"  "47"  "52"  "61" 
[17] "67"  "74"  "78"  "92"  "93"  "103" "105" "106" "111" "112" "118" "130" "139" "143" "145" "155"
[33] "160" "166" "167" "168" "178" "182" "184" "1"   "60"  "73"  "79"  "81"  "115" "122" "133" "149"



# (e) 試計算高分組及低分組在每一題答對的人數百分比, 記為 PH 及 PL。
PH <- round(colMeans(answer[topID, ] == correct), 2)
> PH
# [1] 0.66 0.66 0.63 0.68 0.80 0.80 0.90 0.71 0.73 0.73

PL <- round(colMeans(answer[lowID, ] == correct), 2)
> PL
# [1] 0.33 0.23 0.40 0.19 0.21 0.26 0.28 0.12 0.19 0.33
# 提示: round


# (f) 請計算每一題之難度 (公式 P = (PH + PL)/2) 及鑑別度 (公式 D= PH− PL)。
# > P
# [1] 0.50 0.44 0.52 0.44 0.50 0.53 0.59 0.42 0.46 0.53
# > D
# [1] 0.33 0.43 0.23 0.49 0.59 0.54 0.62 0.59 0.54 0.40
P <- round((PH + PL)/2, 2)
D <- round(PH - PL, 2)
P; D




# 2.34 有一班學生之座號 (ID) 及性別 (student.gender) 的資訊如下。某日小考兩科: 微
# 積分 (score.calculus) 及英文 (score.english)，成績如下，其中有三位同學缺考
# set.seed(12345)
# ID <- paste("No.", 1:50, sep="")
# score.calculus <- sample(0:100, 50, replace=T)
# score.english <- sample(0:100, 50, replace=T)
# student.gender <- as.factor(sample(c("f", "m"), 50, replace=T))
# absence.id <- sample(1:50, 3)
# score.calculus[absence.id] <- score.english[absence.id] <- NA

# (a) 算出微積分平均分數及標準差。(提示: (1) 缺考不計入; (2) ?mean)
mean.cal <- mean(score.calculus, na.rm = TRUE)
sd.cal <- sd(score.calculus, na.rm = TRUE)
mean.cal; sd.cal

# (b) 男生英文成績平均多少分? (提示: 缺考不計入)
mean(score.english[student.gender == "m"], na.rm = TRUE)

# (c) 將缺考成績記為 0 分後，請問有哪些同學兩科成績同時及格? (列出座號)
score.calculus[is.na(score.calculus)] <- 0
score.english[is.na(score.english)] <- 0
pass <- which(score.calculus >= 60 & score.english >= 60)
ID[pass]

# (d) (承上小題) 兩變數 (x, y)n
# i=1 的相關係數之公式如下:
     ∑n i=1(xi−x)(yi−¯y)
r = √∑n i=1(xi−x)2√∑ni=1(yi−¯y)2

# 試計算微積分及英文兩成績之相關係數，並與 cor 之結果相比較。(提示: sqrt, sum, mean)
r1 <- sum((score.calculus - mean(score.calculus)) * (score.english - mean(score.english))) /
     sqrt(sum((score.calculus - mean(score.calculus))^2) * sum((score.english - mean(score.english))^2))
r1
cor(score.calculus, score.english)





# 2.35 某校欲將學生之成績分組，規則如下: 高於平均分數一倍標準差為「A」組，低於
# 平均分數一倍標準差為「C」組，其餘為「B」組，請將以下 30 位學生成績 (score)
# 依此規則分組。
# set.seed(12345)
# score <- sample(0:100, 30, replace=T)
group <- ifelse(score > mean.score + sd.score, "A",
                ifelse(score < mean.score - sd.score, "C", "B"))
data.frame(score, group)

# 2.36 將下列年齡資料 (age) 轉換為年齡群組 (group)，規則如下: 1∼20 歲為 A 組, 21∼40
# 歲為 B 組, 41∼60 歲為 C 組, 61 歲以上為 D 組。將轉換結果以資料框 (data.frame)
# 儲存, 使其第一個欄位為 age，第二個欄位為 group。
# set.seed(12345)
# age <- sample(1:100, 20)
group <- cut(age, breaks = c(0,20,40,60,Inf), labels = c("A","B","C","D"))
data.frame(age, group)

# 2.37 小吳老師於某系教授 A, B 兩班學生微積分，學期各次成績使用同一格式紀錄於
# score-A.txt 及 score-B.txt 兩檔案。檔案中紀錄 4 次小考成績、期中期末成績、
# 助教 (TA) 成績，各次考試之配分比例及學期點名出席次數。
# (a) 讀入兩資料檔，將之合併為一個 data.frame (命名為 score)，使得各欄位名
# 稱如下所示並增加一欄位註明班別 (Class)。
# > score[38:43,]
#    Class No ID Name Gender Quiz1 Quiz2 Quiz3 Quiz4 TA Midterm Final ATT
# 38A 38 404550431 沈泓霏 女 15 25 53 67 93.3 29 
# 39 A 39 404550442 許安霏 女 53 60 80 72 100.0 61 
# 40 A 40 404550453 李政宜 男 80 100 85 100 100.0 95 
# 41 B 1 404550465 史文羽 男 60 81 100 97 100.0 90 
# 42 B 2 404685071 鄭樺妤 男 80 100 100 92 100.0 92 
# 43 B 3 404685084 張敬安 男 10 40 62 93 100.0 65 42 9
score.A <- read.table("score-A.txt", header = TRUE)
score.B <- read.table("score-B.txt", header = TRUE)
score.A$Class <- "A"; score.B$Class <- "B"
score <- rbind(score.A, score.B)

# (b) 依各項考試 (小考、期中期末) 配分算出每位同學之學期成績 (缺考以零分計)。
# 其中「出席成績」為額外加分，出席幾次，則總分加幾分。總分以不超過 100為原則
# 請列出全班學期成績。
score$Total <- with(score,
                    Quiz1*0.05 + Quiz2*0.05 + Quiz3*0.05 + Quiz4*0.05 +
                      Midterm*0.3 + Final*0.4 + TA*0.1 + ATT
)
score$Total[score$Total > 100] <- 100
score$Total

# (c) 列出學期成績在 55(含)∼60 分 (不含) 之間的所有同學之全部各欄位紀錄。
subset(score, Total >= 55 & Total < 60)

# (d) A、B 兩班總成績平均各為多少? 男、女生學期成績平均各為多少?
aggregate(Total ~ Class, data = score, mean)
aggregate(Total ~ Gender, data = score, mean)

# (e) A 班學期成績不及格比例為多少? B 班男同學學期成績不及格比例為多少?
A.fail <- mean(score$Total[score$Class == "A"] < 60)
Bmale.fail <- mean(score$Total[score$Class == "B" & score$Gender == "男"] < 60)
A.fail; Bmale.fail

# (f) 分別印出男、女生學期成績前 5 名之「班別、學號、姓名、學期成績、名次」等欄位紀錄
# (男、女生各按照名次依序列出) (名次為全班名次: rank(x,ties.method = "first"))
score$Rank <- rank(-score$Total, ties.method = "first")
male.top5 <- head(subset(score, Gender == "男")[order(-subset(score, Gender == "男")$Total), c("Class","ID","Name","Total","Rank")], 5)
female.top5 <- head(subset(score, Gender == "女")[order(-subset(score, Gender == "女")$Total), c("Class","ID","Name","Total","Rank")], 5)
male.top5; female.top5

# (g) 印出「張」姓同學之完整姓名、學號及其學期成績。
subset(score, grepl("^張", Name), select = c(Name, ID, Total))

# 2.38 美國大學成績平均績點 (GPA)(四分制) 的計算方式如下表:
# 等級 (Grade) 百分數 GPA
# A           80−100 分 4
# B           70−79 分 3
# C           60− 69 分 2
# D           50− 59 分 1
# E           49 分以下 0
# 請寫一 R 函式，將某同學之各科修課成績百分數 (score) 轉成等級及 GPA。(提示: 不可用 for)
# > set.seed(12345)
# > score <- sample(0:100, 10, replace=T)
set.seed(12345)
score <- sample(0:100, 10, replace = TRUE)

grade_gpa <- function(score) {
  grade <- cut(score, breaks = c(-1,49,59,69,79,100), labels = c("E","D","C","B","A"))
  gpa <- c(E=0, D=1, C=2, B=3, A=4)[as.character(grade)]
  data.frame(score, grade, gpa)
}

grade_gpa(score)

# 2.39 由營幕輸入以下 10 個西元年份並由營幕列印出來:
# 1224, 2065, 2000, 1660, 1020, 1986, 1787, 2080, 1147, 917
year <- c(1224,2065,2000,1660,1020,1986,1787,2080,1147,917)
# (a) 印出最大及最小年份。
max(year); min(year)

# (b) 小於 1500 的年份有哪些?
year[year < 1500]
# (c) 呈 (c) 小題，其平均年份及變異數為何?
mean(year[year < 1500])
var(year[year < 1500])

# 2.40 利用 for 計算 number 中偶數的個數。
# set.seed(12345)
# number <- sample(0:100, 60, replace=T)
count <- 0
for(i in number){
  if(i %% 2 == 0) count <- count + 1
}
count