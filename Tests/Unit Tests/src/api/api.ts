import axios from 'axios'

const BASE_URL = 'http://localhost:1323'

const api = axios.create({
  headers: {
    'Access-Control-Allow-Origin': BASE_URL,
    'Access-Control-Allow-Headers': 'Content-Type',
  },
  baseURL: BASE_URL,
})

export default api
