import React, { useEffect, useState } from "react"

export default function Chat({ socket, username, room }) {
  const [currentMessage, setCurrentMessage] = useState("")
  const [messageList, setMessageList] = useState([])

  const sendMessage = async () => {
    if(currentMessage !== ""){
      const messageData  ={
        room,
        author: username,
        message: currentMessage,
        time: new Date(Date.now()).getHours() + ":" + new Date(Date.now()).getMinutes()
      }
      await socket.emit("send_message", messageData)
      setMessageList((prevMessages) => [...prevMessages, messageData])
    }
    setCurrentMessage("")
  }
  useEffect(() => {
    socket.on("receive_message", (data) => {
      setMessageList((prevMessages) => [...prevMessages, data])
    })
  }, [socket])

  return (
    <div>
      <div className="chat-header">
        <p>Live Chat</p>
      </div>
      <div className="chat-body">
      <div className="message_container">
        {messageList.map(m => {
          return <div className={`message_body ${username === m.author ? "me" : "you"}`}>
            <div>
              <div className="message_content">
                {m.message}
              </div>
              <div className="message_meta">
                <span>{m.time}</span>
                <span>&#183;</span>
                <span>{m.author}</span>
              </div>
            </div>
          </div>
        })}
        </div>
      </div>
      <div className="chat-footer">
      <input type="text" placeholder='hey...' onChange={e => setCurrentMessage(e.target.value)} />
        <button onClick={sendMessage}>&#9658;</button>
      </div>
    </div>
  )
}
