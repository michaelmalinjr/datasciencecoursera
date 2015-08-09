

bmiApp <- function(feet, inches, weight) {
        require(shiny)
        shinyApp(
                ui = pageWithSidebar(
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
                ),                 
                
                server = function(input, output) {
                        # BMI calculation
                        bmi = function(feet, inches, weight){
                                w = weight * 703
                                h.Inches = (feet * 12) + inches
                                h.square = h.Inches * h.Inches
                                calc = w/h.square  
                                print(calc)
                        }
                        bmi.pred = function(feet, inches, weight){
                                w = weight * 703
                                h.Inches = (feet * 12) + inches
                                h.square = h.Inches * h.Inches
                                calc = w/h.square
                                
                                if(calc <= 18.5){
                                        print("Underweight")                        
                                } else if(calc >= 18.5 & calc <= 24.9){
                                        print("Normal weight")                        
                                } else if(calc >= 25 & calc <= 29.9){
                                        print("Overweight")                        
                                } else{
                                        print("Obesity")}
                                
                        }
                        output$inputValue <- renderPrint({bmi(input$feet, input$inches, input$weight)})
                        output$prediction <- renderPrint({bmi.pred(input$feet, input$inches, input$weight)})
                }
                
        )        
        
}