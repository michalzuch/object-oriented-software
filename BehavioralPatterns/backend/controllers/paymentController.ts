import { Request, Response } from 'express'
import { Payment } from '../models/payment'

export const processPayment = (req: Request, res: Response): void => {
  const payment: Payment = req.body
  payment.success = true
  res.json(payment)
}
