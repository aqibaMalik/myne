const express = require("express")
const app = express()
const { Server } = require("socket.io")
const http = require("http")
const cors = require("cors")

app.use(cors)

const server = http.createServer(app)
const io = new Server(server, {
  cors: { origin: "http://localhost:5173", methods: ["GET", "POST"] },
})

io.on("connection", (socket) => {
  console.log(`Socket connected: ${socket.id}`)
  socket.on("join_room", (data) => {
    socket.join(data)
    console.log(`User with id ${socket.id} joined room ${data}`)
  })
  socket.on("send_message", (data) => {
    socket.to(data.room).emit("receive_message", data)
  })
})

server.listen(3001, () => console.log("Server is listening on Port 3001"))
