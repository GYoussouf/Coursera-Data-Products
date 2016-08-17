library(shiny)
shinyUI(pageWithSidebar(
#Application title
headerPanel("Mtcars Prediction"),

sidebarPanel(
numericInput('disp', 'Displacement',100,min=50,max=1000),
numericInput('cyl', 'Number of cylinder',6,min=2,max=10,step=2),
submitButton('Submit')),

mainPanel(
h3('Results of prediction'),
h4('You entered'),
verbatimTextOutput("oid1"),
h4('you entered'),
verbatimTextOutput("oid2"),
h4('Which resulted in a prediction of '),
verbatimTextOutput("prediction")
)
))
