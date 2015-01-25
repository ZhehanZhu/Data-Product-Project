Developing Data Products Project Presentation
========================================================
author: Zhehan Zhu
date: Sun Jan 25 14:50:17 2015

Introduction
========================================================

[Make a Guess](https://zhehanzhu.shinyapps.io/Project/) is a game in which each player guess a four-digit number withou replacement, e.g. 0123, 7256.

- Each round, a new number is generated until the player starts a new game.
- After clicking the "Submit" button, the player can see the current result as well as the history records. $A$ means both the number and its position is correct, while $B$ means only the number is correct.
- If the player gives up and wants to see the answer, he or she can click "Show Answer".

Algorithm
========================================================

- We use $sample()$ to generate a new four-digit number without replacement.

```r
sample(x = 10, size = 4, replace = FALSE) - 1
```
- $sum((ans() - guess()) == 0)$ calcualtes $A$, which indicates the number of digits whose values and positions are both correct.
- $length(intersect(ans(), guess())) - sum((ans() - guess()) == 0)$ calculates $B$, which indicates the number of digits whose values are right only.

Algorithm Continued
========================================================

Also, for convenience, the history records of each guess per round are shown, like

```
     [,1]   [,2]     [,3] [,4] [,5] [,6]
[1,] "6012" "Result" "0"  "A"  "1"  "B" 
[2,] "3760" "Result" "1"  "A"  "1"  "B" 
[3,] "0495" "Result" "0"  "A"  "3"  "B" 
[4,] "2386" "Result" "0"  "A"  "0"  "B" 
[5,] "4032" "Result" "0"  "A"  "1"  "B" 
```
The answer is 5970.

More information
========================================================

Here is some code for your reference.

```r
    ...
    output$currResult <- renderText({
      input$Submit
      isolate(cbind(sum((ans()-guess()) == 0),"A",length(intersect(ans(), guess())) - sum((ans() - guess()) == 0),"B"))
      })
    output$historyTable <- renderTable({
      if(input$Submit > 0 ){
        isolate(values$history <- rbind(values$history, cbind(input$D1, input$D2, input$D3, input$D4,"Result", sum((ans() - guess()) == 0), "A", length(intersect(ans(), guess())) - sum((ans() - guess()) == 0), "B")))
        }
      })
    ...
```
