--1--
db.restaurants.find({})
--2--
db.restaurants.find({},{_id:1,restaurante_id:1, name:1, borough:1, cuisine:1})
--3--
db.restaurants.find({},{_id:0 ,restaurante_id:1, name:1, borough:1, cuisine:1})
--4--
db.restaurants.find({},{_id: 0, restaurant_id:1, name:1, borough:1, "address.zipcode":1 })
--5--
db.restaurants.find({borough:"Bronx"})
--6--
db.restaurants.find({borough:"Bronx"}).limit(5)
--7--
db.restaurants.find({borough:"Bronx"}).skip(5).limit(5)
--8--
db.restaurants.find({"grades.score": {$gt: 90}})
--9--
db.restaurants.find({"grades.score": {$gt: 80, $lt: 100}})
--10--
db.restaurants.find({"address.coord.0": {$lt: -95.754168}})
--11-- 
db.restaurants.find({$and:[{cuisine: {$ne:"American"}}, {"grades.score": {$gt: 70}}, {"address.coord.1": {$lt: -65.754168}}]})
--12--
db.restaurants.find({cuisine: { $ne:"American" },"grades.score": {$gt: 70}, "address.coord.0": {$lt: -65.754168}})
--13--
db.restaurants.find({cuisine: { $ne:"American" },"grades.grade": {$eq: "A"}, borough: {$ne: "Brooklyn"} }).sort({cuisine: -1})
--14--
db.restaurants.find({name: {$regex: /^Wil/}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--15--
db.restaurants.find({name: {$regex: /ces$/}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--16--
db.restaurants.find({name: {$regex: /Reg/}}, {restaurant_id: 1,name :1, borough: 1, cuisine: 1})
--17--
db.restaurants.find({borough: "Bronx", $or: [{cuisine: "American"}, {cuisine: "Chinese"}] })
--18--
db.restaurants.find({borough: {$in: ["Staten Island","Queens","Bronx","Brooklyn"]}}, {restaurant_id:1,name:1,borough:1,cuisine:1})
--19--
db.restaurants.find({borough: {$nin: ["Staten Island","Queens","Bronx","Brooklyn"]}}, {restaurant_id:1,name:1,borough:1,cuisine:1})
--20--
db.restaurants.find({"grades.score": {$lt:10}},{restaurante_id:1, name:1, borough:1,cuisine:1})
--21--
db.restaurants.find({$and:[{cuisine: "seafood"},{cuisine: {$nin:["American", "Chinese"]}},{name: {$not:/^Will/ }}]},{restaurant_id:1,name:1,borough:1,cuisine:1})
--22--
db.restaurants.find({grades: {$elemMatch: {grades :"A", score:11, date:ISODate("2014-08-11T00:00:00Z")}}}, {restaurant_id:1,name:1,borough:1,cuisine:1})