package org.example.creationalpatterns.services

import org.springframework.stereotype.Component

@Component
object EagerAuthSingleton {
    private const val USERNAME: String = "admin"
    private const val PASSWORD: String = "admin"
    fun authenticate(username: String, password: String): Boolean {
        return username == this.USERNAME && password == this.PASSWORD
    }
}