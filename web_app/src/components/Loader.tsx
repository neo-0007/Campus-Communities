import React, { useState, useEffect } from "react";
import "./Loader.css"; // Import the custom styles

const Loader = () => {
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    // Simulate progress
    const interval = setInterval(() => {
      setProgress((prev) => {
        if (prev < 100) return prev + 1;
        clearInterval(interval);
        return 100;
      });
    }, 30); // Adjust speed by changing the interval duration (30ms for smooth animation)

    return () => clearInterval(interval);
  }, []);

  return (
    <div className="loader-container">
      <div className="loader-logo">
        <img src="/logo.png" alt="Logo" className="logo-img" />
      </div>
      <div className="progress-bar">
        <div className="progress" style={{ width: `${progress}%` }}></div>
      </div>
      <div className="percentage">{progress}%</div>
    </div>
  );
};

export default Loader;
