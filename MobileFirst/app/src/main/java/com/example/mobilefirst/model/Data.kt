package com.example.mobilefirst.model

data class Category(val id: Int, val name: String, val products: List<Product>)
data class Product(
    val id: Int, val name: String, val description: String, val price: Double, val stock: Int
)

fun getData(): List<Category> {
    return listOf(
        Category(
            1, "Electronics", listOf(
                Product(1, "Laptop", "Powerful laptop for work and gaming", 999.99, 10),
                Product(2, "Smartphone", "Latest smartphone with great features", 599.99, 20),
                Product(
                    3,
                    "Headphones",
                    "Noise-cancelling headphones for immersive experience",
                    99.99,
                    30
                )
            )
        ), Category(
            2, "Clothing", listOf(
                Product(4, "T-Shirt", "Casual cotton t-shirt for everyday wear", 19.99, 50),
                Product(5, "Jeans", "Classic denim jeans in various sizes", 39.99, 40),
                Product(6, "Sneakers", "Comfortable sneakers for an active lifestyle", 59.99, 30)
            )
        ), Category(
            3, "Books", listOf(
                Product(7, "The Alchemist", "A philosophical novel by Paulo Coelho", 12.99, 60),
                Product(8, "The Great Gatsby", "Classic novel by F. Scott Fitzgerald", 9.99, 70),
                Product(9, "To Kill a Mockingbird", "Harper Lee's timeless masterpiece", 14.99, 50)
            )
        )

    )
}
