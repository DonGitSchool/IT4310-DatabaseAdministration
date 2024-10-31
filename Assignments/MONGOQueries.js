use sample_restaurants

db.restaurants.countDocuments({ "borough": "Manhattan" })
db.restaurants.countDocuments({ "borough": "Queens" })
db.restaurants.countDocuments({ "borough": "Manhattan", "cuisine": "Jewish/Kosher" })
db.restaurants.countDocuments({ "borough": "Queens", "cuisine": "Jewish/Kosher" })
db.restaurants.countDocuments({ "borough": "Manhattan", "cuisine": "Jewish/Kosher", "grades.grade": "A" })

use sample_airbnb

db.listingsAndReviews.countDocuments({ "accommodates": { $gte: 8 } })
db.listingsAndReviews.countDocuments({ "accommodates": { $lte: 3} })

use sample_analytics
db.customers.countDocuments({ "address": /CO/ })

use sample_mflix
db.movies.find({ "title": "Star Trek" }, { "title": 1, "rated": 1, "_id": 0 })
