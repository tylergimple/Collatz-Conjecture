i=1
checks<-100
x <- vector(length=checks)
while (i<checks) {
startnum<-i
  new_num<-if (startnum %% 2 ==0) {
  startnum/2
} else {
  (startnum*3)+1
}
its<-1000
y<-seq(1:its)

z<-as.data.frame(capture.output(for (val in y) {
  if(new_num %% 2 == 0){
    new_num = ((new_num)/2)
  print(new_num)}
  if(new_num %% 2 != 0){
    new_num = ((new_num*3)+1)
  print(new_num)}
}))


colnames(z) <- c("yvals")
cleanz = as.data.frame(as.numeric(substring(z$yvals,5)))
colnames(cleanz)<- c("yvals")

df1 <- as.data.frame(cleanz[cleanz$yvals != 1, ])
colnames(df1)<- c("yvals")
df2 <- as.data.frame(df1[df1$yvals != 2, ])
colnames(df2)<- c("yvals")
df3 <- as.data.frame(df2[df2$yvals != 4, ])
colnames(df3)<- c("yvals")
j<-as.data.frame(as.numeric(c(4,2,1)))
colnames(j)<- c("yvals")

df4<-as.data.frame(rbind(df3,j))

q<-as.data.frame(seq(1:nrow(df4)))
colnames(q)<-c("xvals")

graph<-as.data.frame(cbind(df4,q))

print(nrow(graph)+1)
x[i] <- as.numeric(print(nrow(graph)+1))
i=i+1
}

Results<-as.data.frame(x)
t<-as.data.frame(as.numeric(seq(1:i)))
colnames(t)<-c("xvals")
results_graph<-as.data.frame(cbind(Results,t))

ggplot(data = results_graph, aes(x = xvals, y=x)) + geom_point(size=1, colour="darkgreen") + geom_line()+geom_text(label=results_graph$x, nudge_y = 1, nudge_x = 1,)


plot_ly(data = results_graph, x = ~xvals, y = ~x, type = "scatter", mode = "lines", marker = list(size = 1, color = "pink"))
