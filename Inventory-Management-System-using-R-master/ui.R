library(shiny)


shinyUI(fluidPage(
  
  headerPanel(span("Inventory Management System", style = "color:blue")),br(),
  
  
  selectInput(inputId = "product_id", label = h4("Select Product:"),
              c("Juice" = 1,
                "Sweets" = 2,
                "French Fries" = 3,
                "Vegetables" = 4,
                "Snacks" = 5,
                "Nutrients products" = 6,
                "Boost"= 7,
                "Milk" = 8,
                "Bread" = 9,
                "Fruits" = 10,
                "Chocolates" = 11,
                "Household Products" = 12,
                "Cleaning Agents" = 13)), br(),
  
  
  titlePanel(h3(textOutput("product_text"))), br(),
  
  sidebarPanel(
    radioButtons("method", h4( "Forecast Technique: ", style = "color:blue"),
                 c("Naive" = "naive",
                   "Moving Average" = "ma",
                   "Exponential Smoothing" = "es")), 
    br(),
    
    h4("Calculation", style = "color:blue"), br(),
    
    strong(textOutput("lead_time")),br(),
    
    strong(textOutput("safety_stock")),br(),
    
    strong(textOutput("reorder_point")),br(),
    class = 'leftAlign'
  ),
  
  sidebarPanel(
    plotOutput("product_plot"),
    width = 8,
    class = 'leftAlign'
  ),
  
  
  mainPanel(
    
    
    
    tabsetPanel(type = "tabs", 
                tabPanel("Forecast",
                         strong("Naive"),verbatimTextOutput("forecast_naive_output"),
                         strong("Moving Average"),verbatimTextOutput("forecast_sma_output"),
                         strong("Exponential Smoothing"),verbatimTextOutput("forecast_es_output")
                ), 
              
                tabPanel("Plots", 
                         plotOutput("naive_plot"),
                         plotOutput("sma_plot"),
                         plotOutput("es_plot"),
                         class = 'rightAlign'), 
                tabPanel("Data",
                         dataTableOutput("product_dataHead")
                )
    )
  )
)
)
