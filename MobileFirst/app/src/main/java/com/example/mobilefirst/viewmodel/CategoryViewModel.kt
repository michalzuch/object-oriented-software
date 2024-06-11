package com.example.mobilefirst.viewmodel

import androidx.compose.runtime.mutableStateListOf
import androidx.lifecycle.ViewModel
import com.example.mobilefirst.model.Category
import com.example.mobilefirst.model.getData

class CategoryViewModel : ViewModel() {
    private val _categories = mutableStateListOf<Category>()
    val categories: List<Category> get() = _categories

    init {
        _categories.addAll(getData())
    }
}
