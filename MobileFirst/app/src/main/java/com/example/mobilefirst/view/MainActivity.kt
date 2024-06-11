package com.example.mobilefirst.view

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.mobilefirst.viewmodel.CartViewModel
import com.example.mobilefirst.viewmodel.CategoryViewModel
import com.example.mobilefirst.ui.theme.MobileFirstTheme

class MainActivity : ComponentActivity() {
    private val categoryViewModel: CategoryViewModel by viewModels()
    private val cartViewModel: CartViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MobileFirstTheme {
                val navController = rememberNavController()
                NavHost(navController = navController, startDestination = "categoryView") {
                    composable("categoryView") {
                        CategoryView(
                            categoryViewModel = categoryViewModel,
                            cartViewModel = cartViewModel,
                            onNavigateToCart = { navController.navigate("cartView") })
                    }
                    composable("cartView") {
                        CartScreen(
                            cartViewModel = cartViewModel,
                            onNavigateBack = { navController.popBackStack() })
                    }
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
