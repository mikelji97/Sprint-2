--1--
db.restaurant.find{}
--2--
db.restaurants.find({},{_id:1, name:1, borough:1, cuisine:1})
--3--
db.restaurants.find({},{_id:0 ,name:1, borough:1, cuisine:1})
--4--
db.restaurants.find({},{_id: 0, restaurant_id:1, name:1, borough:1, "address.zipcode":1 })
--5--
db.restaurants.find({borough:"bronx"})
--6--
db.restaurants.find({borough:"bronx"}).limit(5)
--7--
db.restaurants.find({borough:"bronx"}).skip(5).limit(5)
--8--
db.restaurants.find({"grades.score"{$gt: 90}})
--9--
db.restaurants.find({"grades.score": {$gt: 80, $lt: 100}})
--10--
db.restaurants.find({"address.coord.0": {$lt: -95.754168}})
--11-- 
db.restaurants.find({"address.coord.0": {$lt: -95.754168}})
--12--
db.restaurants.find({cuisine: { $ne:"American" },"grades.score": {$gt: 70}, "address.coord.0": {$lt: -65.754168}})
--13--
db.restaurants.find({cuisine: { $ne:"American" },"grades.grade": {$eq: "A"}, borough: {$ne: "Brooklyn"} }).sort({cuisine: -1})
--14--
db.restaurants.find({name: {$regex: "^Wil"}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--15--
db.restaurants.find({name: {$regex: "ces^"}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--16--
db.restaurants.find({name: {$regex: "Reg"}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--17--
db.restaurants.find({borough: "Bronx", $or: [{cuisine: "American"}, {cuisine: "Chinese"}] })
