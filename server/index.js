// imports from packages
const express = require('express')
const mongoose = require('mongoose')


// imports from files
const authRouter = require('./routes/auth')
const adminRouter = require('./routes/admin')
const uri = require('./uri')

// init
const PORT = 3000
const app = express()
const DB = uri

// middleware
app.use(express.json())
app.use(authRouter)
app.use(adminRouter)

// connections
mongoose.connect(DB).then(() => console.log('connection successful')).catch((e) => console.log(e))

app.listen(PORT,"0.0.0.0", () => {
console.log(`connected at port ${PORT}`)
})