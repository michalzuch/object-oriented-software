package org.example.creationalpatterns.models

data class Product(
    val id: Int,
    val name: String,
    val description: String,
    val price: Double,
    val stock: Int
)

var products: List<Product> = listOf(
    Product(1, "Laptop", "Powerful laptop for work and gaming", 999.99, 10),
    Product(2, "Smartphone", "Latest smartphone with great features", 599.99, 20),
    Product(3, "Headphones", "Noise-cancelling headphones for immersive experience", 99.99, 30)
)