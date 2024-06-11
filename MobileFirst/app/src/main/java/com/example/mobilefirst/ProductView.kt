package com.example.mobilefirst

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun ProductView(product: Product, onAddToCart: (Product) -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(8.dp), shape = RoundedCornerShape(8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(text = product.name, modifier = Modifier.padding(bottom = 8.dp))
            Text(text = product.description, modifier = Modifier.padding(bottom = 8.dp))
            Text(text = "Price: $${product.price}", modifier = Modifier.padding(bottom = 8.dp))
            Text(text = "Stock: ${product.stock}", modifier = Modifier.padding(bottom = 8.dp))
            Button(onClick = { onAddToCart(product) }) {
                Text(text = "Add to Cart")
            }
        }
    }
}