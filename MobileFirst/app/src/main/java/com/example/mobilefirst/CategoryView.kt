package com.example.mobilefirst

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun CategoryView(
    categoryViewModel: CategoryViewModel,
    cartViewModel: CartViewModel,
    onNavigateToCart: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = Modifier.fillMaxSize(), horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(modifier = Modifier.weight(1f)) {
            LazyColumn {
                items(categoryViewModel.categories) { category ->
                    Text(
                        text = category.name,
                        style = MaterialTheme.typography.headlineSmall,
                        modifier = Modifier.padding(16.dp)
                    )
                    category.products.forEach { product ->
                        ProductView(product, cartViewModel::addToCart)
                    }
                }
            }
        }
        Button(
            onClick = onNavigateToCart, modifier = Modifier.padding(16.dp)
        ) {
            Text(text = "Go to Cart")
        }
    }
}