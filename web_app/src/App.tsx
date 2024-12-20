import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import { Join } from "./pages/Join"
import Register from "./pages/Register";
import Login from "./pages/Login";

function App() {

  return (
    <>
    <Router>
      <Routes>
        <Route path="/" element={<Join/>} />
        <Route path="/user/register" element={<Register/>} />
        <Route path="/user/login" element={<Login />} />
      </Routes>
    </Router>

     {/* Toastify Container */}
     <ToastContainer 
        position="top-right" // You can change to 'top-left', 'bottom-right', etc.
        autoClose={3000} // Auto close after 3 seconds
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light" // Use 'dark' for dark mode
      />
    </>
  )
}

export default App
