package org.example.creationalpatterns.controllers

import org.example.creationalpatterns.models.AuthRequest
import org.example.creationalpatterns.models.products
import org.example.creationalpatterns.services.AuthSingleton
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

@RestController
class ProductController(private val authSingleton: AuthSingleton) {
    @GetMapping("/products")
    fun getUsers(@RequestBody authRequest: AuthRequest): ResponseEntity<Any> {
        return if (authSingleton.authenticate(authRequest.username, authRequest.password)) {
            ResponseEntity.ok().body(products)
        } else {
            ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Not authorized")
        }
    }

    @GetMapping("/products/{id}")
    fun getUserById(@RequestBody authRequest: AuthRequest, @PathVariable id: Int): ResponseEntity<Any> {
        return if (authSingleton.authenticate(authRequest.username, authRequest.password)) {
            ResponseEntity.ok().body(products.find { it.id == id })
        } else {
            ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Not authorized")
        }
    }
}