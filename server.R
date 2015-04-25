library(shiny)

calculateEMI <- function(principal, rate, period){
    no_of_payments <- 12 * as.integer(period)
    int_rate <- as.double(rate)
    numtr <- as.double(principal) * (int_rate/1200) * ((1+(int_rate/1200)) ^ no_of_payments)
    deno <- ((1+(int_rate/1200)) ^ no_of_payments) - 1
    emival <- round(numtr / deno)
    return(emival)
}

shinyServer(
    function(input,output){
        output$principal <- renderPrint({input$principal})
        output$interest <- renderPrint({input$interest_rate})
        output$period <- renderPrint({input$period})
        output$emival <- renderPrint({calculateEMI(input$principal,
                                                   input$interest_rate,
                                                   input$period)})
    }
)