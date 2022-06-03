const express = require("express")
const User = require("../models/user")
const bcryptjs = require('bcryptjs')
const authRouter = express.Router()

authRouter.post('/api/signup', async (req, res) => {
    
  const {name, email, password} = req.body 
 
  const existingUser = await User.findOne({email})
  if(existingUser){
      return res.status(400).json({msg: "User with same email already exists!"})
  }

  const hashedPassword = await bcryptjs.hash(password, 8)

 // create new user model
  const user =  new User({
  name,
  email,
  password: hashedPassword
  })
  // store that data in database
  await  user.save()
  res.json(user)

  // return taht data to the user

})

module.exports = authRouter