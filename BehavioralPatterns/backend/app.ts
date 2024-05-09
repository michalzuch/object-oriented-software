import cors = require('cors')
import express = require('express')
import routes from './routes/routes'

const app = express()
const PORT = 3000

app.use(cors({ origin: 'http://localhost:5173' }))
app.use(express.json())
app.use('/', routes)

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
