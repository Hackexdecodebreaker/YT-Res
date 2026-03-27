-- Introduction

{
  "product_id": "P001",
  "name": "Milk 1L",
  "category": "Dairy",
  "price": 15,
  "stock": 200
}

-- 1.Inserting Documents

db.products.insertMany([
  { product_id: "P001", name: "Milk 1L", category: "Dairy", price: 15, stock: 200 },
  { product_id: "P002", name: "Bread", category: "Bakery", price: 10, stock: 150 },
  { product_id: "P003", name: "Rice 25kg", category: "Grains", price: 250, stock: 50 }
])

-- 2.Approaches to finding Documents
db.products.find({category: "Dairy"})


db.products.find({price: {$gt: 100}})
db.products.find({price: {$lt: 50}})
db.products.find({price: {$gte: 10, $lte: 100}})


-- 3.Operators and complex queries
db.products.find({$or: [{category:"Dairy"}, {price:{$lt:20}}]})


db.products.find({name: {$regex: "Rice"}})


db.products.find({category: {$in: ["Dairy","Bakery"]}})

-- 5.Sorting  and limiting
db.products.find().sort({price:1})


db.products.find().sort({name:-1})



db.products.find().limit(2)


db.products.find().sort({price:-1}).limit(3)


-- 1.Updating documents
db.products.updateOne(
  {product_id:"P001"},
  {$set:{price:18, stock:180}}
)


db.products.updateMany(
  {category:"Bakery"},
  {$inc:{stock:50}}
)

-- Updating documents
db.products.deleteOne({product_id:"P002"})

db.products.deleteMany({category:"Grains"})


-- Next
-- 5.Aggregation
-- 6 Bult Writing
-- 8.Indexing
-- 9.Cursor and fetching
-- 10.Connecting mongo db with programming languages




