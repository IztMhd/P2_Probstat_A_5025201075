#======================= NOMOR 1 =======================#
#input data
data1=read.delim("clipboard")
data1

#a
stDeviasi = sd(data.frame(data1)$x-data.frame(data1)$y)
stDeviasi

#b
n = 9
dBar = sum(data.frame(data1)$y-data.frame(data1)$x) / n
t = dBar / stDeviasi
pValue = 2 * pt(-abs(t), df = n - 1)
pValue

#c
install.packages("BSDA")
library(BSDA)
t.test((data.frame(data1)$x-data.frame(data1)$y), alternative = 'two.sided', var.equal = TRUE)
#didapatkan p-value < H0  yang berarti H0 ditolak. yang berarti bahwa tidak terdapat pengaruh yang signifikan


#======================= NOMOR 2 =======================#
rerata = 23500
rata = 20000
n = 100
stdev2 = 3900
#a
#setuju

#b
tsum.test(mean.x=23500, sd(3900), n.x=100, var.equal = TRUE)

#c
z = (rerata - rata) / (stdev2 / sqrt(n))
p = dnorm(z)
p
#dapat dilihat bahwa nilai dari pnya sangatlah kecil yaitu sebesar 1.294382e-18 yang berarti bahwa mobil
#yang dikemudikan memiliki rata-rata > 20000 km/tahun


#======================= NOMOR 3 =======================#
shmBdg = 19
shmBl = 27
mBdg = 3.64
mBl = 2.79
stdevBdg = 1.67
stdevBl = 1.32
#a
h0 = mBdg / (stdevBdg / sqrt(shmBdg))
h1 = mBl / (stdevBl / sqrt(shmBl))
h0
h1

#b
tsum.test(mean.x = mBdg, s.x = stdevBdg, n.x = shmBdg, mean.y = mBl, s.y = stdevBl, n.y = shmBl, alternative = "greater", var.equal = TRUE)

#c
qt(p = .05 / 2, df = 2, lower.tail = FALSE)

#d
qchisq(p = .05 / 2, df = 2, lower.tail = FALSE)


#======================= NOMOR 4 =======================#
#a
data4=read.delim("clipboard")
data4$Group = as.factor(data4$Group)
data4$Group = factor(data4$Group, labels = c("kucing oren", "kucing hitam", "kucing putih"))
grup1 = subset(data4, Group == "kucing oren")
grup2 = subset(data4, Group == "kucing hitam")
grup3 = subset(data4, Group == "kucing putih")
qqnorm(grup1$Length)
qqnorm(grup2$Length)
qqnorm(grup3$Length)

#b
bartlett.test(Length~Group, data = data4)

#c
model1 = aov(Length~Group, data = data4)

#e
TukeyHSD(model1)

#f
library("ggplot2")
ggplot(data4, aes(x = Group, y = Length)) + geom_boxplot(fill = "white", colour = "black") + scale_x_discrete() + xlab("Group") + ylab("Length")

#======================= NOMOR 5 =======================#

