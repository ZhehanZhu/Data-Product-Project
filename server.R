library(shiny)

shinyServer(
  function(input, output, session){
  
    ## generate a new number to be guessed
    ans <- reactive({sample(x = 10, size = 4, replace = FALSE) - 1})
  
    guess <- reactive({as.numeric(cbind(input$D1, input$D2, input$D3, input$D4))})
    
    values <- reactiveValues(history = vector(mode = "list"))
  
    output$currGuess <- renderText({
      input$Submit
      isolate(guess())
      })
    output$currResult <- renderText({
      input$Submit
      isolate(cbind(sum((ans() - guess()) == 0), "A",
             length(intersect(ans(), guess())) - sum((ans() - guess()) == 0), 
             "B"))
      })
    output$historyTable <- renderTable({
      if(input$Submit > 0 ){
        isolate(values$history <- rbind(values$history, cbind(input$D1, input$D2, input$D3, input$D4, 
                                                              "Result", sum((ans() - guess()) == 0), "A",
                                                              length(intersect(ans(), guess())) - sum((ans() - guess()) == 0), 
                                                              "B")))
        }
      })
    
    output$showAns <- renderText({
        if(input$Show > 0){
          ans()
          }
      })
  }

)