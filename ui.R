library(shiny)
library(leaflet)

shinyUI(fluidPage(
     
     titlePanel("Cleanpro Express Outlets"),
     
     sidebarLayout(
          sidebarPanel(
               h3("States and Locations"),
               br(),
               selectInput("States", label = h4("Select States"), 
                           choices = list("Selangor" = "Selangor", "Perak" = "Perak"), 
                              selected = "Selangor"),
               br(),
               h4("Project Information"),
               p("This project is an instance of location analytics that aims at predicting the sales of Cleanpro Express outlets in Malaysia. However, for this coursera Module 9 project purpose, the analytics engine has been disable. If you want to know more about the project, you may contact", a("Assoc Prof. Dr. CY Ting", href = "http://pesona.mmu.edu.my/~cyting", style = "color:red"),"Multimedia University, Cyberjaya, Malaysia ", style = "color:blue", align="justify"),
               img(src = "cyting_small.png", height = 86, width = 72) 
               
               ),
          mainPanel(
               tabsetPanel(type = "tabs", 
                           tabPanel("Map", leafletOutput("cleanpro")), 
                           tabPanel("Table", dataTableOutput("mytable")),
                           tabPanel("Documentation", textOutput("intro")))
     )
)))