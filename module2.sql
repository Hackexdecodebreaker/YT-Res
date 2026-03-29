-- Bulkwriting
db.products.insertMany([
  { product_id: "P004", name: "Eggs 12pcs", category: "Dairy", price: 20, stock: 300 },
  { product_id: "P005", name: "Sugar 5kg", category: "Grains", price: 60, stock: 120 },
  { product_id: "P006", name: "Butter 500g", category: "Dairy", price: 35, stock: 80 },
  { product_id: "P007", name: "Apples 1kg", category: "Fruits", price: 25, stock: 200 },
  { product_id: "P008", name: "Chicken 2kg", category: "Meat", price: 90, stock: 50 }
])



-- Aggregation
db.products.aggregate([
  {
    $group: {
      _id: "$category",
      totalStock: { $sum: "$stock" }
    }
  }
])


db.products.bulkWrite([
  
  {
    insertOne: {
      document: {
        product_id: "P009",
        name: "Orange Juice 1L",
        category: "Beverages",
        price: 30,
        stock: 100
      }
    }
  },

  
  {
    updateOne: {
      filter: { product_id: "P001" },
      update: { $inc: { stock: 50 } }
    }
  },

 
  {
    deleteOne: {
      filter: { product_id: "P003" }
    }
  }
])






--  Create a new collection for suppliers
db.createCollection("suppliers")

-- Insert supplier documents
db.suppliers.insertMany([
  { supplier_id: "S001", name: "Fresh Farms", contact: "123-456-7890" },
  { supplier_id: "S002", name: "GrainHub", contact: "987-654-3210" }
])


--  Create an index on category for faster queries
db.products.createIndex({ category: 1 })

--  Create a compound index on category and price
db.products.createIndex({ category: 1, price: -1 })

--  Index on product name for text search
db.products.createIndex({ name: "text" })



-- usage
db.products.find({ category: "Dairy" })
db.products.find({ $text: { $search: "Rice" } }) 




--  Using cursor to iterate through results
var cursor = db.products.find({category: "Dairy"})
cursor.forEach(doc => print(doc.name, doc.price))


-- Demonstraton in python
cursor = db.products.find({"category": "Dairy"})

total_stock = 0
for product in cursor:
    total_stock += product["stock"]

print("Total Dairy Stock:", total_stock)



-- Mongo connection
from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["AeroMart"]

products = db["products"]
for product in products.find({"category": "Dairy"}):
    print(product["name"], product["price"])




