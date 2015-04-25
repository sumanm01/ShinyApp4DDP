library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Shiny App to Calculate Home Loan EMI (Equated Monthly Installments)"),
    sidebarPanel(
        p('Please enter the values as given below to know the EMI that you have 
          to pay to the bank for your home loan...'),
        numericInput('principal', 'Total Home Loan Amount (Local Currency)', 200000, min = 100000, max = 1000000, step = 10000),
        numericInput('interest_rate', 'Annual Rate of Interest (%)', 4, min = 3, max = 15, step = 0.5),
        radioButtons("period", "Total Loan Period (Years)",
                     c("5 years" = "5",
                       "10 years" = "10",
                       "15 years" = "15",
                       "20 years" = "20",
                       "25 years" = "25")),
        submitButton('Calculate EMI')
    ),
    mainPanel(
        h4('Your Principal Loan Amount :'),
        verbatimTextOutput("principal"),
        h4('Your Annual Rate of Interest(%) :'),
        verbatimTextOutput("interest"),
        h4('Your Loan Period in Years :'),
        verbatimTextOutput("period"),
        h4('Your Estimated Home Loan EMI in Local Currency is :'),
        verbatimTextOutput("emival")
    )
)
)