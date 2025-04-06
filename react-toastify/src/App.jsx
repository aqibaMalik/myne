
import { ToastContainer, toast } from "react-toastify"
import 'react-toastify/dist/ReactToastify.css'
import "./App.css"
function App() {
  const notify = () => toast('لیپ ٹاپ کی اطلاع', {
    position: "bottom-left",
    autoClose: 5000,
    hideProgressBar: false,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
    progress: undefined,
  })
  return (
    <div className='App'>
     <h1>Toast Library</h1>
     <button onClick={notify}>Show Toast</button>
     <ToastContainer 
      position="top-left"
      autoClose={5000}
      hideProgressBar={false}
      newestOnTop={false}
      closeOnClick
      rtl={true}
      pauseOnFocusLoss
      draggable
      pauseOnHover
      limit={5}
      // transition : Bounce
     />
    </div>
  )
}

export default App
