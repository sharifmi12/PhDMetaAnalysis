df=fracture_by_exposure
library(tidyverse)
library(meta)

library(metafor)
view(df)
df$lnhr <- log(df$hr)
df$se <- (log(df$uhr) - log(df$lhr))/1.96*2


df$author<- as.character(df$author)
df
summary(df)



library(metafor)

res <- rma(lnhr, sei=se, data=df, method="DL")
res
### for a random effects model, could use:
##res <- rma(lnhr, sei=se, data=dfo, method="REML")

par(mar = c(6, 6, 3, 3))
forest(df$hr, ci.lb = df$lhr, ci.ub=df$uhr, addpred = FALSE, annotate= TRUE, at=seq(0,5,by=1),  
       order= order(df$code_expocom), rows=c(3:12,14:17, 19:22),
       addfit=FALSE,
       showweights=TRUE,
       #ilab=cbind(expo, com), ilab.xpos=c(-3, -1.5), mlab = "", xlab= " ",
       cex=1.1, xlim=c(8, 4), alim = c(-6, 10),
       refline=1,
       slab=paste(df$author)
)

forest(hr, ci.lb = lhr, ci.ub=uhr, addpred = FALSE, annotate= TRUE, at=seq(0,6,by=1),
       order= dfoc$exo, rows=c(19:20, 14:15, 9:10, 3:5), addfit=FALSE,
       showweights=FALSE,
       ilab=cbind(expo, com), ilab.xpos=c(-3, -0.7), mlab = "", xlab= " ",
       cex=1.1,  xlim=c(8, 2), alim = c(-6, 6),
       refline=1,
       slab=paste(dfoc$author)
)

op <- par(cex=0.85, font=2)
text(c(-5.0, -3, -1.5, 1, 11.8), 21.8, c("Author(s) and Year", "Exposure", "Comparison", "Random effect model", "Effect estimate [95% CI]"))


op <- par(cex=0.85, font=4)
text(-6.0, c(20.5, 16, 11, 6), c("Hys with/without BO  (Pre and post-menopausal)", "Hys with BO  (Pre and post-menopausal)",
                                 "Hys without BO  (Pre and post-menopausal)", "BO with/wothout hys  (Pre-menopausal)")
     ,  pos = 4)



### set par back to the original settings
par(op)

### fit random-effects model in the three subgroups
res.bo1 <- rma(lnhr, sei=se, data=df, subset=(code_expocom==1), method="DL")
res.bo2 <- rma(lnhr, sei=se, data=df, subset=(code_expocom==2), method="DL")
res.bo3 <- rma(lnhr, sei=se, data=df, subset=(code_expocom==3), method="DL")



### add summary polygons for the three subgroups
addpoly(res.bo2, row= 13, cex=0.95,  transf=transf.exp.int, mlab="DL Model for hys with BO")
addpoly(res.bo1, row= 2, cex=0.95,  transf=transf.exp.int, mlab="DL Model for BO with/without hys")
addpoly(res.bo3, row= 18, cex=0.95,  transf=transf.exp.int, mlab="DL Model hys with/without BO")

str(df)