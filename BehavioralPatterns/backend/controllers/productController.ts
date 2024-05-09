import { Request, Response } from 'express'

import { Product } from '../models/product';

export const products: Product[] = [
    { id: 1, name: "Laptop", description: "Powerful laptop for work and gaming", price: 999.99, stock: 10 },
    { id: 2, name: "Tablet", description: "Portable tablet for entertainment and productivity", price: 399.99, stock: 15 },
    { id: 3, name: "Watch", description: "Elegant timepiece for a classic look", price: 199.99, stock: 25 },
    { id: 4, name: "Running Shoes", description: "Comfortable shoes for your daily runs", price: 79.99, stock: 30 },
    { id: 5, name: "Sunglasses", description: "Stylish sunglasses to protect your eyes", price: 49.99, stock: 18 },
    { id: 6, name: "Smartphone", description: "Latest smartphone with great features", price: 599.99, stock: 20 },
    { id: 7, name: "Cookware Set", description: "Complete set for your kitchen needs", price: 129.99, stock: 22 },
    { id: 8, name: "Backpack", description: "Durable backpack for travel and everyday use", price: 59.99, stock: 20 },
    { id: 9, name: "Yoga Mat", description: "Non-slip mat for your yoga practice", price: 29.99, stock: 15 },
    { id: 10, name: "Headphones", description: "Noise-cancelling headphones for an immersive experience", price: 99.99, stock: 30 }
];


export const getAllProducts = (req: Request, res: Response): void => {
  res.json(products)
}

export const getProductById = (req: Request, res: Response): void => {
  const id = Number(req.params.id)
  const product = products.find((p) => p.id === id)
  if (product) {
    res.json(product)
  } else {
    res.status(404).send('Product not found')
  }
}
