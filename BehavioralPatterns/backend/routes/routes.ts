import { Router } from 'express'
import { getAllProducts, getProductById } from '../controllers/productController'
import { processPayment } from '../controllers/paymentController'

const router = Router()

router.get('/products', getAllProducts)
router.get('/products/:id', getProductById)
router.post('/payments', processPayment)

export default router
