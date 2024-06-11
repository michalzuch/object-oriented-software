package com.example.mobilefirst

import androidx.compose.runtime.mutableStateListOf
import androidx.lifecycle.ViewModel

class CategoryViewModel : ViewModel() {
    private val _categories = mutableStateListOf<Category>()
    val categories: List<Category> get() = _categories

    init {
        _categories.addAll(getData())
    }
}
