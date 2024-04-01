package org.example.creationalpatterns.controllers

import org.example.creationalpatterns.models.Product
import org.example.creationalpatterns.models.products
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController

@RestController
class ProductController {
    @GetMapping("/products")
    fun getUsers(): List<Product> {
        return products
    }

    @GetMapping("/products/{id}")
    fun getUserById(@PathVariable id: Int): Product? {
        return products.find { it.id == id }
    }
}