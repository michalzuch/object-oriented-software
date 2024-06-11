package com.example.mobilefirst

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.mobilefirst.ui.theme.MobileFirstTheme

class MainActivity : ComponentActivity() {
    private val categoryViewModel: CategoryViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MobileFirstTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    CategoryView(
                        categoryViewModel = categoryViewModel,
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}

@Composable
fun CategoryView(categoryViewModel: CategoryViewModel, modifier: Modifier = Modifier) {
    CategoryView(categoryViewModel = categoryViewModel)
}

@Preview(showBackground = true)
@Composable
fun CategoryViewPreview() {
    MobileFirstTheme {
        val viewModel = CategoryViewModel()
        CategoryView(viewModel)
    }
}
