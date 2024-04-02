package org.example.creationalpatterns.services

import org.springframework.stereotype.Component

@Component
class LazyAuthSingleton private constructor() {
    private val username: String = "admin"
    private val password: String = "admin"

    companion object {
        private val instance = LazyAuthSingleton()

        fun getInstance(): LazyAuthSingleton {
            return instance
        }
    }

    fun authenticate(username: String, password: String): Boolean {
        return username == this.username && password == this.password
    }

}
