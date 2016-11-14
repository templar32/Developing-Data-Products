source("./bmi.r")

shinyServer(function(input, output) {
  output$input <- renderText({
    if (input$units == METRIC) {
      unit.weight = "kg"
      unit.height = "m"
    } else {
      unit.weight = "lb"
      unit.height = "in"
    }
    
    paste0("You are ", "<strong>",input$mass, " ", unit.weight, " @ ", input$height, " ", unit.height, "</strong>")
  })
  
  output$result <- renderText({
    bmi = bmi(mass = input$mass, height = input$height, units = input$units)
    
    if      (bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>"
    else if (bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
    else if (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
    else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else if (bmi <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
    else if (bmi <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>"
    else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
    
    paste0("Your BMI is ", "<code>", round(bmi, 2), "</code>", ", which is: ", info)
  })
  
  output$graph <- renderText({
    "<img style='width: 40em; margin-top: 1em' src='https://upload.wikimedia.org/wikipedia/commons/e/e9/Body_mass_index_chart.svg' title='Body mass index chart (Wikipedia)' />"
  })
  
    output$fork <- renderText({
  ##  '<a href="https://github.com/aseifert/shiny-bmi"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/e7bbb0521b397edbd5fe43e7f760759336b5e05f/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677265656e5f3030373230302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_green_007200.png"></a>'
  })
  
})