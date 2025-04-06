import { useEffect, useState } from 'react'
import './App.css'
import io from 'socket.io-client'
const socket = io.connect('http://localhost:3001')
import Chat from './Chat'

function App() {
  const [username, setUsername] = useState("")
  const [room, setRoom] = useState("")
  const [showChat, setShowChat] = useState(false)

  const joinRoom = () => {
    if(username !== "" && room !== ""){
      socket.emit("join_room", room)
      setShowChat(true)
    }
  }
  
  return (
    <>
    {!showChat ? <div className='chat_join__room'>
        <h3>Join a Chat</h3>
        <input type="text" placeholder='John...' onChange={e => setUsername(e.target.value)} />
        <input type="text" placeholder='Room Id...' onChange={e => setRoom(e.target.value)} />
        <button onClick={joinRoom}>Join A Room</button>
      </div>
      :
      <Chat socket={socket} username={username} room={room} />}
  </>
  )
}

export default App
