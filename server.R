library(shiny)
library(leaflet)

shinyServer(function(input,output)
{
     output$intro <- renderText({ 
          "This simple app aims at providing information about the location of Cleanpro Express outlets in Malaysia. Some of them are dirty, while another are very clean. An example that is very clean is the one in Dengkil, Selangor, Malaysia. If one day you are in Malaysia and you stay at Dengkil, please give it a try."})
     
     dt <- read.csv("data/data.csv")
     
     output$cleanpro <- renderLeaflet({
          if(input$States=="Selangor"){
          leaflet(data = dt[dt$state=="Selangor",]) %>% 
                    addTiles() %>%
               addMarkers(~long, ~lat, popup = ~as.character(name)) %>% 
               setView(101.667526, 2.962195, zoom=10)}
          else if(input$States=="Perak"){
               leaflet(data = dt[dt$state=="Perak",]) %>% addTiles() %>%
                    addMarkers(~long, ~lat, popup = ~as.character(name)) %>%
               setView(100.740669, 4.851619, zoom=10)}
     })
      
     
     output$mytable = renderDataTable({dt[,-c(3,4)]})
})