import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import { Join } from "./pages/Join";
import Register from "./pages/Register";
import Login from "./pages/Login";
import { Home } from "./pages/Home";
import useAuth from "./components/useAuthRedirect";
import { useEffect, useState } from "react";
import Loader from "./components/Loader";

function App() {
  const { status, isAuthenticated  } = useAuth()
  const [isAppLoading, setIsAppLoading] = useState(true);

  useEffect(() => {
    const handlePageLoad = () => {
      setIsAppLoading(false); // Stop showing loader once page has loaded
    };

    // Set a small delay to mimic realistic loading behavior
    const timeout = setTimeout(handlePageLoad, 5000); 

    return () => clearTimeout(timeout); // Cleanup timeout on component unmount
  }, []);

  if (status === "loading" || status === "idle" || isAppLoading) {
    return <Loader />
  }

  return (
      <>
      <Router>
        <Routes>
          <Route path="/" element={isAuthenticated ? <Home /> : <Join />} />
          <Route path="/user/register" element={<Register />} />
          <Route path="/user/login" element={<Login />} />
          {/* <Route
            path="/home"
            element={isAuthenticated ? <Home /> : <Navigate to="/user/login" />}
          /> */}
        </Routes>
      </Router>

      {/* Toastify Container */}
      <ToastContainer
        position="top-right"
        autoClose={3000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
      />
    </>
  );
}

export default App;
