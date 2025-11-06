#1.用 rep 指令造出以下數列:
 # "A" "A" "A" "A" "A" "B" "B" "B" "B" "C" "C" "C" "D" "D" "E"
rep(c("A","B","C","D","E"), times=c(5,4,3,2,1))

#2. 1 4 7 10 13 16 19
seq(from=1, by=3, to=19)

#(a) 用 rep 指令造出以下數列:
 # 1 1 1 1 1 2 2 2 2 3 3 3 4 4 5
rep(c(1:5),times=c(5:1))

#(b) 用 rev 和 sequence 指令造出以下數列:
#  1 2 3 4 5 6 2 3 4 5 6 3 4 5 6 4 5 6 5 6 6
sequence(rev(1:6), from = 1:6)

#1.7 產生數列:
#(b) 用 seq, c 指令造出以下數列:
  #"b" "d" "f" "h" "j" "l" "n" "p" "r" "t" "v" "x" "z" "a" "c" "e" "g"
  #"i" "k" "m" "o" "q" "s" "u" "w" "y"
letters[c(seq(2,25,by=2),seq(1,26,by=2))]

#(c) 產生以下數列:
#1,−1/2,1/3,−1/4, · · · ,1/19 , −1/20
 n <- 1:20
 x <- (-1)^(n+1)*1/n

#(e) 產生以下文字數列 (提示: month.abb, seq):

 # "Jan" "Mar" "May" "Jul" "Sep" "Nov" "Feb" "Apr" "Jun" "Aug" "Oct" "Dec"
month.abb[c(seq(1,11,by=2),seq(2,12,by=2))]

#1.8 產生下列數列 (Hint: rep, seq, rev):
#(a) 8 7 6 5 7 6 5 4 6 5 4 3 5 4 3 2 4 3 2 1

#(b) 3 7 11 15 19 23 27 31 35 39
seq(from=3, to=39, by=4)

#1.9 利用 rep, seq 指令輸出下列向量:
#(a) 3 3 3 3 3 3 3 3 3 3 3 3
rep(3,time=12)

#(b) 1 1 1 4 4

#(c) 2 2 2 5 5 5
rep(x,each=3)

#(d) 2 2 4 4 6 6 8 8 10 10 12 12 14 14 16 16 18 18 20 20
rep(seq(2,20, by=2), each=2)

#1.10 產生以下有規律的數列。(提示: 儘量使用 rep, seq)
#(a) 1 3 5 7 · · · 21
seq(1, 21, by = 2)
#(b) 1 10 100 · · · 10^9
10^(0:9)
#(c) 0 1 1 2 2 2 3 3 3 3 4 4 4 4 4
rep(0:4, times = 1:5)
#(d) 1 2 5 10 20 50 100 · · · 5 ×10^4
c(1, 2, 5) * 10^(0:4)
#(e) b d f h j l n p r t v x z
letters[seq(2, 26, by=2)]

#1.11 令 colors <- c("red", "yellow", "blue")。利用 paste 指令輸出下列文字向
量
#(a) "red flowers" "yellow flowers" "blue flowers"
colors <- c("red", "yellow", "blue")
paste(colors, "flowers")
#(b) "redflowers" "yellowflowers" "blueflowers"
paste0(colors,"flowers")
#(c) "several reds" "several yellows" "several blues"
paste("several", paste0(colors, "s"))
#(d) "I like red, yellow, blue"
paste("I like", paste(colors, collapse=", "))


#1.12 下列 mydata 物件的資料類別為何? 將 mydata 轉成「因子」類別 (class) 之物件,
#並印出此因子物件中每一類別有多少個數。
#set.seed(12345)
#n <- sample(5:20, 1)
#mydata <- sample(letters, n, replace=T)
set.seed(12345)
n <- sample(5:20, 1)                 # 隨機選一個長度
mydata <- sample(letters, n, replace = TRUE)  # 隨機抽字母
class(mydata)                        # 確認原始類別 (character)

# 轉為因子
myfactor <- as.factor(mydata)
class(myfactor)

# 計算每一類別出現次數 轉換成因子才能進行計算
table(myfactor)
mydata
a b f g h j k p q s v x z 
1 1 2 2 1 1 2 1 1 1 1 2 2 

#1.13 某學生分析空氣品質資料 airquality 之風速 (Wind) 與溫度 (Temp) 的關係,他採
#用迴歸分析及共變異數分析,步驟如下:
#lm.obj <- lm(airquality$Wind ~ airquality$Temp)
#lm.anova <- anova(lm.obj)
#lm.summary <- summary(lm.obj)
#(a) 物件 lm.anova 是屬於何種類別,其儲存結構如何?
lm.obj <- lm(airquality$Wind ~ airquality$Temp)
lm.anova <- anova(lm.obj)
class(lm.anova)
# ➤ "anova" "data.frame"

#(b) 物件 lm.summary 有哪一些屬性可供存取? 試取出 R^2 值。(提示: r.squared)
# 建立模型：風速 vs 溫度
str(lm.anova)   # 查看結構
# 迴歸摘要
lm.summary <- summary(lm.obj)
attributes(lm.summary)
# 可看到 names: coefficients, sigma, r.squared, adj.r.squared, fstatistic 等

# 取出 R²
lm.summary$r.squared


#1.14 cars 是 R 內建資料集之一,紀錄車子當下之時速 (speed) 及煞車所需之距離
#(dist)。某生使用以下程式碼做迴歸分析
#cars.lm <- lm(dist ~ speed, data=cars)
#cars.lm.sm <- summary(cars.lm)
#試問 cars.lm.sm 是何種類別之物件? 有哪些屬性可供存取? 請單獨印出 F-statistic之值
cars.lm <- lm(dist ~ speed, data=cars)
cars.lm.sm <- summary(cars.lm)
cars.lm.sm 
cars.lm.sm$fstatistic

#1.15 (a) 輸入以下矩陣並命名為 my.mat。
# 1 5 8
# 7 0 6
# 3 2 9
# 10 4 11
x<- c(1,7,3,10,5,0,2,4,8,6,9,11)
my.mat<- matrix(x,ncol=3)

#(b) 將資料的列 (row) 命名為 no.1, no.2, no.3, no.4,將欄 (column) 命名為var.1, var.2, var.3
rownames(my.mat) <- paste0("no.",1:4)
colnames(my.mat) <- paste0("var.", 1:3)
my.mat

#(c) 將 var.3 排序後 (由小到大),把資料矩陣依 var.3 的大小來排序
# 取出 var.3 這一欄
sort_index <- order(my.mat[, "var.3"])   # 取得排序索引

# 依 var.3 排序整個矩陣
my.mat_sorted <- my.mat[sort_index, ]

my.mat_sorted


#1.16 下列為數個家庭的背景資料 (”NA” 代表無觀察值):
#Name   Wife  No. of Children Child Ages
#George Mary  3               4, 7, 9
#Aaron  Sue   2               2, 5
#John   Nico  0               NA
#Tom    NA    1               10
#Barrett NA   NA              NA
#Colin  Cathy 2               4, NA

#(a) 以 R 表列 (list) 類別方式將上述資料儲存為一 list 變數, 命名為 family。
Name       <- c("George","Aaron","John","Tom","Barrett","Colin")
Wife       <- c("Mary","Sue","Nico",NA,NA,"Cathy")
NoChildren <- c(3,2,0,1,NA,2)
ChildAges  <- list(c(4,7,9), c(2,5), NA, 10, NA, c(4,NA))
                                                 #→ 不要拆開 list
family <- data.frame(Name, Wife, NoChildren, ChildAges = I(ChildAges),  #I()不要展開/自動轉換裡面的資料結構
                     stringsAsFactors = FALSE)   #→ 不要自動轉因子 
                         #「不要把字串轉成 factor」，保持為 character vector。
                          # 所以這裡 Name 這欄是 character vector 而不是 factor。
family


#(b) 請單獨列出男主人 Barrett 家庭所有的資訊。
barrett <- family[family$Name == "Barrett", ]
barrett
> barret
[1] Name       Wife       NoChildren ChildAges 
<0 rows> (or 0-length row.names)

#(c) 是否可將上述 family 轉為 data.frame 類別之物件。
class(family)
[1] "data.frame"

#1.17family 物件以[表列]方式紀錄數個家庭的背景資料,請單獨列出男主人 Barrett 家庭所有的資訊。
#family <- list(name=c("George", "Aaron", "John", "Tom", "Barrett", "Colin"),
               wife=c("Mary", "Sue", "Nico", NA, NA, "Cathy"),
              no.children=c(3, 2, 0, 1, 2, NA),
              is.own.house=c(T, T, F, F, T, NA),
              child.ages=list(c(4,7,9), c(2, 5), NA, 10, NA, c(4,NA)))

> idx <- which(family$name == "Barrett")
> Barrett <- lapply(family, `[`, idx)
> Barrett
$name
[1] "Barrett"

$wife
[1] NA

$no.children
[1] 2

$is.own.house
[1] TRUE

$child.ages
$child.ages[[1]]
[1] NA


> data.frame(Barrett)
name wife no.children is.own.house NA.
1 Barrett <NA>           2         TRUE  NA


#1.18 利用 substr, paste 指令將電話號碼"203/781-1255" 換成"(203)7811255"。
#注意符號各自都算一格 paste0中間不間斷
tel <-"203/781-1255"
area <-substr(tel, start=1, stop=3)
part1 <-substr(tel, 5, 7)
part2 <-substr(tel, 9, 12)
new_tel <-paste0("(",area,")",part1,part2)
new_tel

#1.19 由螢幕輸入 (讀入 scan) 2 個數字 (例如: 26,87),印出其總和。
nums <- scan(n=2)
1: 23
2: 45
total<-sum(nums)
cat ("Sum =",total)
Sum = 68


#1.20 請將 (0, 1) 區間等分為 10 份子區間:
#(a) 印出每一子區間之左端點。
n <- 10
left <- seq(0, 1 - 1/n, length.out=n)
left

#(b) 印出每一子區間之右端點。
n <- 10
right <- seq(0, 1, length.out=n)
right

#(c) 印出每一子區間之中點。
#兩者要可以取中間端點 向量長度要一樣 用length.out確定兩者一樣
n <-10
midpoint <- c((left + right)/2)
midpoint


#1.21 造出以下之矩陣,使得其行位名為 C1 ∼ C5 及列位名為 R1 ∼ R4:
  
#.  C1 C2 C3 C4 C5
#R1 1  3  5  7  9
#R2 2  4  6  8  10
#R3 11 13 15 17 19
#R4 12 14 16 18 20
mat<-matrix(c(1:20), nrow=4)
rownames(mat) <-paste0("R",1:4)
colnames(mat) <-paste0("C", 1:5)
mat

#1.22 有一學歷調查的資料 (degree) 如下:
#set.seed(12345)
#edu <- c("國小", "國中", "高中", "大學", "碩士以上")
#degree <- sample(edu, 100, replace=T)
#(a) degree 是什麼 R 類別之物件?
class(degree) 
[1] "character"

#(b) 將此 degree 轉成 R「因子類別」之物件,同時使其 levels 是依照學歷而排序
degreeF <- factor(degree,
                  levels = c("國小", "國中", "高中", "大學", "碩士以上"),
                  ordered = TRUE)   # 設為有序因子

#(c) 各學歷的人數有多少人?
table(degreeF)
degreeF
國小     國中     高中     大學 碩士以上 
19       25       22       22       12 

#(d) 學歷為「” 高中”」(含) 以上的人數有多少人?
sum(degreeF >= "高中")
[1] 56

#1.23 下列 Letters.code 為一個包含「A」∼「E」的向量。
#set.seed(123456789)
#Letters.code <- sample(LETTERS[1:5], 20, replace=T)
#(a) 將 Letters.code 中的「A」與「B」編為「第 1 組」,「C」編為「第 2 組」,
#   「D」與「E」編為「第 3 組」
group <- factor(
         Letters.code, 
         levels <- c("A", "B", "C", "D", "E"),
         labels <- c("第 1 組","第 1 組","第 2 組","第 3 組","第 3 組"))

#(b) 將上小題所得到的編組 Group.code,與 Letters.code 造成一個資料框(data.frame), 
     #使其具有 Letters.code 和 Group.code 兩欄位, 且為順序之因子類別。
     #印出此資料之內容及結構。(順序為 A<B<C<D<E; 第 1 組 < 第 2組 < 第 3 組)

*單欄排序（只按組別排，不管組內順序） ordered=TRUE的擺放位子(要先都轉換成因子)
Letters.code <- factor(Letters.code,
                       levels = c("A","B","C","D","E"),
                       ordered = TRUE)
Group.code <- factor(
  ifelse(Letters.code %in% c("A","B"), "第 1 組",
         ifelse(Letters.code == "C", "第 2 組", "第 3 組")),
  levels = c("第 1 組","第 2 組","第 3 組"),
  ordered = TRUE)

*多欄排序（先按組別，再按組內順序 要先轉換成向量
df <- data.frame(Letters.code, Group.code)
df_sorted <- df[order(df$Group.code, df$Letters.code),]
df_sorted

#1.24 李克特量表 (Likert Scale) 的五等測量法是根據陳述語句的傾向給予各等級不同分數
#     對正向陳述而言,答案越正向分數越高例如:「非常同意」為 5 分,
#     「同意」為 4 分,「普通」為 3 分,「不同意」為 2 分,「非常不同意」為 1 分
#.     今有一問卷資料集,為一群學生 (男生、女生) 對某門課教師評分是否公平的認同程度(consent),如下:
#set.seed(1234567)
n <- 60
ID <- sample(1:n) #座號
gender <- sample(c("男", "女"), n, replace=T) # 性別
consent <- sample(c("非常不同意", "不同意", "普通", "同意", "非常同意"),
                 n, replace=T, prob=c(0.1, 0.1, 0.2, 0.4, 0.3)) # 認同程度

試回答下列各問題:
(a) 將性別轉為 R 因子 (factor) 類別。男女生各多少人?
gender <- factor(gender)
table(gender)
gender
女 男 
29 31 
  
(b) 將認同程度轉為 R 有順序的因子 (factor) 類別。印出
consent <- factor(consent,     #建立有順序的因子
                  levels=c("非常不同意", "不同意", "普通", "同意", "非常同意"),
                  ordered=TRUE
                  )
consent

(c) 將上述資料存成一 R 資料框 (data.frame) ,命名為 survey.df,欄位名稱依
    序為座號、性別及認同程度。印出此資料的前 5 筆紀錄。印出此資料框的結構。
survey.df <- data.frame(gender, consent)
survey.df
head(survey.df, 5)

(d) 列出填寫「不同意」(含) 以下的學生座號,共有幾人。(註: 使用「<= 或 >=」)
#不能直接用 <= 比較文字（會出錯）
#必須先把 認同程度 轉成「有順序的因子 (ordered factor)」
survey.df <- data.frame(group, consent,
                        +     stringsAsFactors = FALSE
                        + )
a <- survey.df[survey.df$consent=="不同意",]
> a
group consent
26 第 2 組  不同意
28 第 2 組  不同意
35 第 1 組  不同意
39 第 2 組  不同意
41 第 3 組  不同意
53 第 3 組  不同意
54 第 2 組  不同意


(e) 此次調查結果,認同程度平均為多少分?
score_map <- c("非常不同意" = 1,
               "不同意"     = 2,
               "普通"       = 3,
               "同意"       = 4,
               "非常同意"   = 5)
survey.df$score <- score_map[as.character(survey.df$consent)]
  #as.chracter 讓consent中的 "非常不同意", "普通", "同意" 
  #去匹配 score_map 裡的名稱

  > avg <- mean(survey.df$score, na.rm=TRUE)
  > avg
  [1] 3.616667
  

# 1.26 有一班級學生之數學成績如下 (成績已依座號順序排列):
# set.seed(12345)
# math.score <- sample(0:100, 100, replace=TRUE)
# (a) 計算前 10 位同學 (座號 1 號至 10 號) 之成績平均數。
set.seed(12345)
math.score <- sample(0:100, 100, replace=TRUE)
mean(math.score[1:10])

# (b) 成績及格之同學座號為何? 共有多少人及格?
ID <- 1:100
pass_ID <-ID[math.score>=60]
pass_ID
length(pass_ID)

# (c) 印出此資料的第一個四分位數(提示: summary)(限單獨印出第一個四分位數之數值)
summary(pass_ID)[2]

# 1.27 
# (a) 請將下列某班三科成績，以資料框 (data.frame) 之類別儲存 (命名為 my.score)
# (需有欄位名稱)。同時，將此資料框的每一列 (同學) 的 ID 命名為 s1, s2, ...,s50
set.seed(12345)
score <- c(NA, 0:100)
math <- sample(score, 50, replace=T)
english <- sample(score, 50, replace=T)
chinese <- sample(score, 50, replace=T)
my.score <-data.frame(math, english, chinese)
rownames(my.score) <-paste0("s",1:50)

# (b) 列出三科成績皆不及格之同學之 ID 及其成績。(NA 表示此位同學在某科缺考，以零分計算) 
fail <- my.score[my.score$math<60 & my.score$english<60 & my.score$chinese <60, ]
#, ] → 留空的列條件，代表「所有欄位都要保留」

# (c) 將此三科成績以表列 (list) 類別之物件表示。
#三個df欄位都要做轉換
my.score.list <- list (math = my.score$math,
                       english = my.score$english,
                       chinese = my.score$chinese
)
my.score.list


# 1.28 有一班級學生之數學成績如下 (成績已依座號順序排列):
#      43 94 20 8 46 72 93 8 28 33 79 60 93 52 8
# (a) 將資料輸入 R，並存至一向量物件，命名為 math.score
math.score <-c(43, 94, 20, 8, 46, 72, 93, 8, 28, 33, 79, 60, 93, 52, 8)
#     
# (b) 此成績紀錄，共有多少位同學?
num <- length(math.score)

# (c) 列印出偶數座號同學之成績，並計算其平均數。
even.index <- seq(2,15, by=2)
even.score <- math.score[even.index]
mean <- sum(even.score)/num

# (d) 成績及格 (大於或等於 60 分) 之同學座號為何? 共有多少人及格?
pass.index <- which(math.score >=60)
length(pass.index)

# 1.29 某班學生之成績和性別紀錄如下 
# (資料是依照學生座號 1、2、· · · 依序紀錄; NA 代表缺考):
#   成績: 30, 49, 95, NA, 54, NA, 61, 85, 51, 22, 0, 0
#   性別: m, f, f, m, f, m, f, m, m, f, f, m
# (a) 本班共有多少學生? 男女生各多少人?
score <- c(30, 49, 95, NA, 54, NA, 61, 85, 51, 22, 0, 0)
gender <- factor(c("m", "f", "f", "m", "f", "m", "f", "m", "m", "f", "f", "m"),
                 levels = c("m","f")) #因子化 方便統計分析
num <- length(score)
male <-sum(gender=="m")
female <- sum(gender=="f")

# (b) 此科目成績最高分及最低分是幾分?
highest <- max(score, na.rm = TRUE) #忽略缺失值
lowest <- min(score, na.rm= TRUE)

# (c) 計算此科目成績平均及標準差。男女生成績平均各是多少?
avg <- mean(score, na.rm=TRUE)
sd <- sd(score, na.rm = TRUE)
male.mean <- mean(score[gender=="m"], na.rm =TRUE)
female.mean <- mean(score[gender=="f"], na.rm=TRUE)

# (d) 老師欲將成績依序做以下調整: 
#   (i) 缺考以 0 分計;
score[is.na(score)] <- 0
score  

# (ii) 每人加 10 分 (缺考者不加分，超過 100 分以 100 分計)。印出調整後的分數
adjusted.score <- ifelse(score == 0, 0, pmin(score + 10, 100))
adjusted.score

# (e) 以調整後的分數計, 列出及格 (60 分以上，含) 同學的座號。共有幾位?
pass.index <- which(adjusted.score>=60) 
#不可直接用length 因是回傳布林值無法計算長度
#which 取出 TRUE 的位置（也就是座號）
pass <- length(pass.index)


# 1.30 有一班級 100 位學生之微積分期中及期末成績如下 (成績已依座號順序排列):
#   set.seed(12345)
#   Calculus.midterm <- sample(0:100, 100, replace=TRUE)
#   Calculus.final <- sample(0:100, 100, replace=TRUE)
# (a) 微積分期中成績之平均數及變異數為何?
mean_midterm <- mean(Calculus.midterm)
var_midterm  <- var(Calculus.midterm)

# (b) 兩次成績之 (皮爾森) 相關係數為何?
cor_mid_final <- cor(Calculus.midterm, Calculus.final, method="pearson")
cor_mid_final

# (c) 若每位同學的學期總成績為他們的期中及期末成績之平均，請問微積分總成
#     績及格之同學座號為何? 共有多少人及格?
score <- (Calculus.midterm + Calculus.final) / 2
pass_index <- which(score >= 60)
num <- length(pass_index)


# 1.45 資料 my.months 為某公司產品一年內的銷售月份 (1∼12) 紀錄，以阿拉伯數字登記。
# set.seed(12345)
# my.months <- sample(1:12, 50, replace = TRUE)
#                     
# (a) 請將此阿拉伯數字登記之資料轉成英文簡寫月份 (命名為 my.months.eng):
"Sep" "Nov" "Oct" ... "Jan" "Aug"。(提示: month.abb)
# (a) 轉成英文簡寫
my.months.eng <- month.abb[my.months]
my.months.eng

# (b) (承上小題) 各月份之銷售次數為何?
table(my.months.eng)

# (c) (承上小題) 下半年 (7∼12 月) 之總銷售次數為何?
sum(my.months.eng %in% month.abb[7:12])

# (e) (承上小題) 五月 (May) 至八月 (Aug) 的之總銷售次數為何?
sum(my.months.eng %in% month.abb[5:8])




