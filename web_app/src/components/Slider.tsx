import React, { useState, useEffect } from "react";

interface ImageSliderProps {
  images: string[]; // Array of image URLs
  length: number; // Number of images
  autoSlideInterval?: number; // Optional interval for auto-sliding (in ms)
}

const ImageSlider: React.FC<ImageSliderProps> = ({
  images,
  length,
  autoSlideInterval = 3000, // Default interval is 3 seconds
}) => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  // Move to the next slide
  const handleNext = () => {
    setCurrentIndex((prevIndex) => (prevIndex + 1) % length);
  };

  // Move to the previous slide
  const handlePrev = () => {
    setCurrentIndex((prevIndex) => (prevIndex - 1 + length) % length);
  };

  // Automatic sliding with useEffect
  useEffect(() => {
    if (length > 1) {
      const intervalId = setInterval(handleNext, autoSlideInterval);
  
      // Clear interval on component unmount
      return () => clearInterval(intervalId);
    }
  }, [autoSlideInterval, length]);

  // Handle dot click
  const handleDotClick = (index: number) => {
    setCurrentIndex(index);
  };

  return (
    <div className="relative  mx-auto overflow-hidden">
      {/* Slider Container */}
      <div
        className="flex transition-transform duration-500"
        style={{
          transform: `translateX(-${currentIndex * 100}%)`,
        }}
      >
        {images.map((image, index) => (
          <img
            key={index}
            src={image}
            alt={`Slide ${index + 1}`}
            className="w-full flex-shrink-0"
          />
        ))}
      </div>

      {/* Navigation Buttons */}
      <button
        onClick={handlePrev}
        className="absolute left-2 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white p-2 rounded-full hover:bg-gray-600"
      >
        &#8592;
      </button>
      <button
        onClick={handleNext}
        className="absolute right-2 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white p-2 rounded-full hover:bg-gray-600"
      >
        &#8594;
      </button>

      {/* Dots */}
      <div className="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
        {images.map((_, index) => (
          <button
            key={index}
            onClick={() => handleDotClick(index)}
            className={`w-3 h-3 rounded-full ${
              currentIndex === index ? "bg-blue-500" : "bg-gray-300"
            }`}
          ></button>
        ))}
      </div>
    </div>
  );
};

export default ImageSlider;
