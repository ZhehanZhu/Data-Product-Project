library(shiny)

shinyUI(
  pageWithSidebar(
    
    headerPanel("Make a Guess"),
    
    sidebarPanel(
      h4("Rules: guess a four-digit number without replacement, e.g. 0123."),
      textInput("D1","Digit 1"),
      textInput("D2","Digit 2"),
      textInput("D3","Digit 3"),
      textInput("D4","Digit 4"),
      actionButton("Submit", label = "Submit"),
      actionButton("Show", label = "Show Answer")
      ),
    
    mainPanel(
      h4("Your Guess"),
      verbatimTextOutput(outputId = "currGuess"),
      h4("Result: A: both the number and its position are correct, B: only the number is correct."),
      verbatimTextOutput(outputId = "currResult"),
      h4("Answer"),
      verbatimTextOutput(outputId = "showAns"),
      h4("History"),
      tableOutput(outputId = "historyTable")
      )
    )
   )