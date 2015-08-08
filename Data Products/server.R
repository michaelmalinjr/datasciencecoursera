library(shiny)

# perYear <- function(miles) miles * 365

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

shinyServer(
        function(input, output) {
              
                output$inputValue <- renderPrint({bmi(input$feet, input$inches, input$weight)})
                output$prediction <- renderPrint({bmi.pred(input$feet, input$inches, input$weight)})
        }
)











