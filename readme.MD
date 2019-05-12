Data Wrangling Proposal
-Yue Guo, Anqi Li

Proposal: People’s Ancestry and Yelp Restaurants.

For the final assignment, we’d like to explore the spatial relationship of people’s reported ancestry in a neighborhood, and the concentration of restaurants serving that group of people according to Yelp.
	Our data would come from:
	ACS: Reported ancestry of people. (Pulled using Census API)
	Yelp: Restaurant data. (Pulled using API)
	Zillow neighborhood boundaries.

We would plot the concentration of people reporting a specific ancestry (ex: Russian) and send a data request to the Yelp API asking for Russian restaurants in the area, and visualize these data on the map over Zillow boundaries. The user would be allowed to select from a list of ancestries to plot (the exact list would require some experiment, as not all ancestries would be good for plotting based on data availability.)

We would probably plot New York City instead of Philadelphia, as the racial mix of New York would provide us with more opportunities.
For now, we would imagine plotting the racial mix as a Choropleth and Yelp restaurant locations as dots, color-coded by star ratings.
