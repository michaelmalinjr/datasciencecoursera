library(shiny)

shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Body Mass Index(BMI) calculator"),
                sidebarPanel(
                        numericInput('feet', 'Feet', 5, min = 3, max = 7, step = 5),
                        numericInput('inches', 'Inches', 5, min = 1, max = 12, step = 5),
                        numericInput('weight', 'Weight', 150, min = 75, max = 300, step = 5),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('Results:'),
                        
                        h4('Your BMI is:'),
                        verbatimTextOutput("inputValue"),
                        
                        h4('Weight Category:'),
                        verbatimTextOutput("prediction")
                )
        )
)