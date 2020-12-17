#Preparing mapping data of US states
states <- sf::st_as_sf(maps::map("state", plot = FALSE, fill = TRUE))

#adjusting fb_region tibble to match with us map data
fb_region_low <- fb_region %>% 
  mutate(Region = tolower(Region)) %>% 
  mutate(Region=replace(Region, Region == "washington, district of columbia", "district of columbia")) %>% 
  rename(ID = Region)

#Joining us map data and fb_region 
region_map <- tigris::geo_join(states, fb_region_low, by = "ID")

#Mapping with Leaflet
fb_map <- function() {
  palI <- colorNumeric(
    palette = "Blues",
    domain = region_map$Impressions)

  palR <- colorNumeric(
    palette = "Blues",
    domain = region_map$Reach)

  palCPC <- colorNumeric(
    palette = "Blues",
    domain = region_map$`CPC (All)`)
  
  palCTR <- colorNumeric(
    palette = "Blues",
    domain = region_map$`CTR (All)`)
  
  title <- "Darker shade indicates higher value"
  
  data_map <- leaflet() %>% 
    # addProviderTiles("CartoDB.Positron") %>% 
    #Impressions Map
    addPolygons(data = region_map,
                fillColor = ~palI(Impressions),
                color = "#b2aeae",
                fillOpacity = 1,
                weight = 2,
                smoothFactor = 0.2,
                group = "Impressions",
                popup = paste0("<b>",region_map$ID,"</b>",
                               "<br>","Impressions: ", region_map$Impressions)) %>% 
    #Reach
    addPolygons(data = region_map,
                fillColor = ~palR(Reach),
                color = "#b2aeae",
                fillOpacity = 1,
                weight = 2,
                smoothFactor = 0.2,
                group = "Reach",
                popup = paste0("<b>",region_map$ID,"</b>",
                               "<br>","Reach: ", region_map$Reach)) %>% 
    #CPC
     addPolygons(data = region_map,
                fillColor = ~palCPC(`CPC (All)`),
                color = "#b2aeae",
                fillOpacity = 1,
                weight = 2,
                smoothFactor = 0.2,
                group = "CPC",
                popup = paste0("<b>",region_map$ID,"</b>",
                               "<br>","CPC: ", region_map$`CPC (All)`)) %>% 
    #CTR
    addPolygons(data = region_map,
                fillColor = ~palCTR(`CTR (All)`),
                color = "#b2aeae",
                fillOpacity = 1,
                weight = 2,
                smoothFactor = 0.2,
                group = "CTR",
                popup = paste0("<b>",region_map$ID,"</b>",
                               "<br>","CTR: ", scales::percent(region_map$`CTR (All)`))) %>% 
    addControl(
      title, position = "bottomright"
    ) %>% 
    
    addLayersControl(
      baseGroups = c("Impressions","Reach","CPC","CTR"),
      options = layersControlOptions(collapsed = FALSE),
      position = "topright")
  
  return(data_map)
}
