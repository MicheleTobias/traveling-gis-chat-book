#GOAL: process the list of cities for the Traveling GIS Chat Book to 
#   1. get lat/long coords
#   2. make a geojson file
#   3. make the javascript file the webmap needs.


# Set Up ------------------------------------------------------------------

# Libraries
library(tidygeocoder)
library(sf)
library(geojsonsf)


# read the data
locations<-read.csv("./data/locations.csv")

#add id column
#locations$id<-c(1:dim(locations)[[1]])



#  Geocode ---------------------------------------------------------------

# a table of rows that already have been geocoded
has_latlong<-locations[which(!is.na(locations$lat)),]

# a table of rows that need to be geocoded
to_geocode<-locations[which(is.na(locations$lat)), 1:3]

# geocode the new rows
new_latlong<-to_geocode %>% 
  geocode(city=city,
          state=state,
          country=country,
          method="osm"
          )

# combine the two tables to make one list of all the cities with their lat/longs
to_plot<-rbind(has_latlong, new_latlong)




# Create GeoJSON & Javascript ---------------------------------------------

# turn the points into an SF object
map_points<-st_as_sf(to_plot, coords=c("long", "lat"))

# convert the SF object to GeoJSON
geojson_map_points<-sf_geojson(map_points)

# wrap the GeoJSON text in the javascript declaration Leaflet needs to read GeoJSON
js_map_points<-paste0(
  "var locations=",
  geojson_map_points
)

# write the text to the javascript file
file_connection<-file("./data/locations.js")
writeLines(text=js_map_points, con=file_connection)
close(file_connection)




