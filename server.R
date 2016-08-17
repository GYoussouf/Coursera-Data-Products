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
)