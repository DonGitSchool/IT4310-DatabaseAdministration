db.movies.insertOne({
    "title": "Top Gun - Maverick",
    "plot": "After more than thirty years of service as one of the Navy's top aviators, Pete Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.",
    "genres": ["Action", "Drama"],
    "runtime": 131,
    "cast": ["Tom Cruise", "Jennifer Connelly", "Miles Teller"],
    "num_mflix_comments": 0,
    "poster": "https://m.media-amazon.com/images/M/MV5BMjA5OTYwNzY5Ml5BMl5BanBnXkFtZTgwMDg0NzkwMjE@._V1_SY1000_SX677_AL_.jpg",
    "fullplot": "After more than thirty years of service as one of the Navy's top aviators, Pete Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.",
    "languages": ["English"],
    "released": ISODate("2022-05-27T00:00:00Z"),
    "directors": ["Joseph Kosinski"],
    "writers": ["Ehren Kruger", "Eric Warren Singer", "Christopher McQuarrie"],
    "awards": "{\"wins\":0,\"nominations\":0,\"text\":\"\"}",
    "lastupdated": "2023-10-01 00:01:18.647000000",
    "year": 2022,
    "imdb": "{\"rating\":8.4,\"votes\":200000,\"id\":123456}",
    "countries": ["USA"],
    "type": "movie",
    "tomatoes": "{\"viewer\":{\"rating\":4.5,\"numReviews\":1000},\"production\":\"Paramount Pictures\",\"lastUpdated\":\"2023-10-01T17:46:19.000Z\"}"
});
db.movies.insertOne({
    "title": "An Imperfect Murder",
    "plot": "An actress's nightmare about killing her ex-boyfriend somehow becomes a reality.",
    "genres": ["Drama", "Thriller"],
    "runtime": 71,
    "cast": ["Sienna Miller", "Alec Baldwin", "Charles Grodin"],
    "num_mflix_comments": 0,
    "poster": "https://m.media-amazon.com/images/M/MV5BMjA5OTYwNzY5Ml5BMl5BanBnXkFtZTgwMDg0NzkwMjE@._V1_SY1000_SX677_AL_.jpg",
    "fullplot": "An actress's nightmare about killing her ex-boyfriend somehow becomes a reality.",
    "languages": ["English"],
    "released": ISODate("2017-10-27T00:00:00Z"),
    "directors": ["James Toback"],
    "writers": ["James Toback"],
    "awards": "{\"wins\":0,\"nominations\":0,\"text\":\"\"}",
    "lastupdated": "2023-10-01 00:01:18.647000000",
    "year": 2017,
    "imdb": "{\"rating\":3.2,\"votes\":500,\"id\":654321}",
    "countries": ["USA"],
    "type": "movie",
    "tomatoes": "{\"viewer\":{\"rating\":2.0,\"numReviews\":50},\"production\":\"Netflix\",\"lastUpdated\":\"2023-10-01T17:46:19.000Z\"}"
});
db.movies.updateMany(
    { "title": { $regex: "Star Wars", $options: "i" } },
    { $set: { "rated": "PG-13" } }
);
db.movies.deleteOne({ "title": "Top Gun" });
db.movies.deleteMany({ "title": { $regex: "Star Trek", $options: "i" } });


// Find the document for "Top Gun - Maverick"
db.movies.find({ "title": "Top Gun - Maverick" });

// Find the document for "An Imperfect Murder"
db.movies.find({ "title": "An Imperfect Murder" });

// Find all "Star Wars" movies to verify the rating change
db.movies.find({ "title": { $regex: "star wars", $options: "i" } })

// Verify that "Top Gun" has been deleted
db.movies.find({ "title": "Top Gun" });

// Verify that all "Star Trek" movies have been deleted
db.movies.find({ "title": { $regex: "Star Trek", $options: "i" } });

//Deletes
//db.movies.deleteOne({ "title": "Top Gun - Maverick" });
//db.movies.deleteOne({ "title": "An Imperfect Murder" });