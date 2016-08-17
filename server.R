<<<<<<< HEAD
library(shiny)
library(datasets)
library(xtable)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
model<-lm(mpg~cyl+disp,data=mtcars)
#fit<-predictor(model,new.data=mtcars)
#predictor<-renderDataTable(data.frame("cyl","disp"))
fit<-reactive({
cyl=input$cyl
disp=input$disp
predictor<-data.frame(cyl,disp)
predict(model,predictor)})
output$oid1 = renderPrint({input$disp})
output$oid2 = renderPrint({input$cyl})
output$prediction <- renderPrint({fit()})
output$box1 <- renderPrint({summary(model)})
output$box<-renderText({print('The application fits a linear regression model to predict mpg based  
on the variables cylinder (cyl) and displacement (disp).The data provided from the mtcars datasets.
The application can be accessed at the following URL: https://gyoussouf.shinyapps.io/project2/.

Change the input data value of cylinders,displacement and the prediction of mpg (Miles/(US) gallon) will be give to you.') })
output$plot<-renderPlot({mtcars$cyl <- as.factor(mtcars$cyl)
ggplot(mtcars, aes(x=disp, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm)})
}
=======
library(shiny)
library(datasets)
library(xtable)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
model<-lm(mpg~cyl+disp,data=mtcars)
#predictor<-renderDataTable(data.frame("cyl","disp"))
fit<-reactive({
cyl=input$cyl
disp=input$disp
predictor<-data.frame(cyl,disp)
predict(model,predictor)})
output$oid1 = renderPrint({input$disp})
output$oid2 = renderPrint({input$cyl})
output$prediction <- renderPrint({fit()})
}
>>>>>>> 6eeee757923e195b7cf796ac6d00cf0ec17a1f59
)