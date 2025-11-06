# 2.20 某班學生 (student.id) 某科期中考成績 (score) 資料如下:
#   student.id <- paste("student", 1:50, sep=".")
#   p <- dnorm(seq(-3,3,length=101))
#   my.p <- p/sum(p)
#   set.seed(123456)
#   score <-sample(0:100, length(student.id), replace = TRUE, prob=my.p)
# 大學生課業成績以 60 分為及格，以 100 分為滿分，請寫一 R 函式，以「開根號再
# 乘以 10」為調分方式，輸入為某科之成績，回傳:
#   (a) 分數調整前，不及格學生之比例。
#   (b) 分數調整前，最高成績之學生座號。
#   (c) 分數調整後，全班成績之平均數及標準差。
     student.id <- paste("student", 1:50, sep=".")
     p <- dnorm(seq(-3,3,length=101))
     my.p <- p/sum(p)
     set.seed(123456)
     score <- sample(0:100, length(student.id), replace = TRUE, prob=my.p)
     
     adjust_score <- function(score, student.id) {
       adj <- sqrt(score) * 10
       list(
         fail_rate_before = mean(score < 60),
         top_student = student.id[which.max(score)],
         mean_after = mean(adj),
         sd_after = sd(adj)
       )
     }
     
     adjust_score(score, student.id)
