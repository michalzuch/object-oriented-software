package com.example.mobilefirst.view

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.mobilefirst.viewmodel.CartViewModel

@Composable
fun CartScreen(cartViewModel: CartViewModel, onNavigateBack: () -> Unit) {
    Column(
        modifier = Modifier.fillMaxSize(), horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(modifier = Modifier.weight(1f)) {
            CartView(cartViewModel.cartItems)
        }
        Button(
            onClick = onNavigateBack, modifier = Modifier.padding(16.dp)
        ) {
            Text(text = "Go Back")
        }
    }
}