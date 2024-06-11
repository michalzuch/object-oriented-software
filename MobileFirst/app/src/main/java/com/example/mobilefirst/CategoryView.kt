package com.example.mobilefirst

import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun CategoryView(categoryViewModel: CategoryViewModel) {
    LazyColumn {
        items(categoryViewModel.categories) { category ->
            Text(
                text = category.name,
                style = MaterialTheme.typography.headlineSmall,
                modifier = Modifier.padding(16.dp)
            )
            category.products.forEach { product ->
                ProductView(product)
            }
        }
    }
}