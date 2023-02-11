# The Fellowship of the Traveling #GISChat Book
A web map of where the Traveling GIS Chat Book has been: https://micheletobias.github.io/traveling-gis-chat-book/

## Contribute

The [Issues List](https://github.com/MicheleTobias/traveling-gis-chat-book/issues) is a good place to list ideas or report issues. It's also a good place to find out what the community wants to add or improve on the map, as well as have discussions about how to approach each task and let people know what you're working on.

New to Leaflet? Get an introduction to making a web map with Leaflet with DataLab's [Building Web Maps with Leaflet Workshop](https://ucdavisdatalab.github.io/workshop_web_maps/).

New to HTML? W3Schools has a great [tutorial and reference for HTML](https://www.w3schools.com/html/default.asp).

## Updating the Map's Locations

As the book travels to new locations, this web map can be updated by adding new locations to the dataset.

Edit the `locations.csv` file, adding the city, state, and country information. **Leave the lat and long columns blank** if you don't have the lat/longs handy. The GitHub action on this repository will automatically geocode any blank lat/long columns.
