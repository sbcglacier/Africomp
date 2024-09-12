MyData<- read.csv(file="C:/Users/18507522/Downloads/R/AllFingers_P_A_Values_EDIT.csv", header=TRUE, sep=",")
header <-read.table("C:/Users/18507522/Downloads/R/AllFingers_P_A_Values_EDIT.csv",nrows=1,header = FALSE,sep=',',stringsAsFactors=FALSE)

polyord = 2

polyord2 = 1
what <-names(MyData)[1:length(header)]
ind <- what[1:3]
# 5 to 32
dep <- what[5:32]
mat <- matrix(,nrow = length(dep),ncol = length(ind))	
str(summary(x1))
summary(x1)$r.squared
summary(x1)$df[1]
lmp <- function (modelobject) {
    if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
    f <- summary(modelobject)$fstatistic
    p <- pf(f[1],f[2],f[3],lower.tail=F)
    attributes(p) <- NULL
    return(p)
}

mat2 <- matrix(,nrow = length(dep),ncol = 3)	

i = 1
for(d in seq_along(dep)){
	eq = paste("polym(",ind[i],",","degree=",polyord,",","raw=TRUE)"
	  ,"+polym(",ind[i+1],",","degree=",polyord,",","raw=TRUE)"
	  ,"+polym(",ind[i+1],",","degree=",polyord,",","raw=TRUE)"
	  ,sep="")
	lmod<-lm(reformulate(eq,dep[d]),data=MyData)
	var1 = paste(signif(summary(lmod)$r.squared,4),",",signif(summary(lmod)$adj.r.squared,4),",(",signif(lmp(lmod),4),")",sep = "")
      mat2[d,i] <-var1
      print(paste("d",d))
      print(paste("i",i))
	eq1 = eq
}

i = 1


for(d in seq_along(dep)){
	eq = paste("polym(",ind[i],",",ind[i+1],",",ind[i+2],",","degree=",polyord,",","raw=TRUE)"
	 ,sep="")
	lmod<-lm(reformulate(eq,dep[d]),data=MyData)
	var1 = paste(signif(summary(lmod)$r.squared,4),",",signif(summary(lmod)$adj.r.squared,4),",(",signif(lmp(lmod),4),")",sep = "")
      mat2[d,i+1] <-var1
      print(paste("d",d))
      print(paste("i",i))
      eq2 = eq
}

i = 1
for(d in seq_along(dep)){
	eq = paste("polym(",ind[i],",",ind[i+1],",",ind[i+2],",","degree=",polyord,",","raw=TRUE)"
      ,"+polym(",ind[i],",degree=",polyord2,",raw=TRUE",")",":polym(",ind[i+1],",degree=",polyord2,",raw=TRUE",")",":polym(",ind[i+2],",degree=",polyord2,",raw=TRUE",")"
	,sep="")
	lmod<-lm(reformulate(eq,dep[d]),data=MyData)
	var1 = paste(signif(summary(lmod)$r.squared,4),",",signif(summary(lmod)$adj.r.squared,4),",(",signif(lmp(lmod),4),")",sep = "")
      mat2[d,i+2] <-var1
      print(paste("d",d))
      print(paste("i",i))
      eq3 = eq
}

indm <-matrix(,nrow=1,ncol= 3)
indm[1] ="D+L+B"
indm[2] = "D+L+B+DL+BL+BD"
indm[3] = "D+L+B+DL+BL+BD+DLB"

colnames(mat2)<-indm
rownames(mat2)<-dep

stargazer(mat2,type='text',out='out.txt')

sb<-lm(reformulate(eq2,dep[1]),data=MyData)
