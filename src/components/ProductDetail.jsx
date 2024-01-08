import React, { useState, useEffect } from 'react';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faStar as solidStar } from '@fortawesome/free-solid-svg-icons';
import { faStar as regularStar } from '@fortawesome/free-regular-svg-icons';
const ProductDetail = () => {
  const [product, setProduct] = useState(null);
  const [currentImage, setCurrentImage] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/shops/1/products/1');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setProduct(data);
        console.log(product)
        setCurrentImage(data.images[0].image_url);
      } catch (error) {
        console.error('Error fetching product:', error);
      }
    };

    fetchData();
  }, []);

  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows:true,
    beforeChange: (current, next) => {
      setCurrentImage(product.images[next].image_url);
    },
  };

  if (!product) {
    return <div>Loading...</div>;
  }

  const stars = Array.from({ length: 5 }, (_, index) => (
    <FontAwesomeIcon
      icon={index < Math.floor(product.average_rating) ? solidStar : regularStar}
      key={index}
      className="text-yellow-500"
    />
  ));

  return (
    <div className="flex">
      {/* Slider with Thumbnails (Left) */}
      <div className="w-1/2 p-4 border-r border-gray-300">
        <Slider {...settings} className="rounded-lg  border border-gray-300 ">
          {product.images.map((image, index) => (
            <div key={index} className="slider-thumbnail cover">
              <img src={image.image_url} alt={`Product Image ${index + 1}`} className="w-full h-full object-cover max-h-[400px] " />
            </div>
          ))}
        </Slider>
      </div>

      {/* Product Information (Right) */}
      <div className="w-1/2 p-4">
        <h2 className="text-2xl font-bold mb-4">{product.product_name}</h2>
      
        <p className="text-lg font-semibold mb-2">Price: ${product.price}</p>
        <p className="mb-2">Stock Quantity: {product.stock_quantity}</p>
        <div className="mb-2">
          <p className="text-lg font-semibold mb-1">Average Rating:</p>
          {stars}
        </div>
        <div className="flex ">
        <p className="mb-2 text-blue-700">Total Ratings: <p className='text-red-700'>{product.total_ratings}</p></p>
        <p className="mb-2 px-3 text-blue-700">Total Reviews: <p className='text-red-700'>{product.reviews}</p> </p>
        </div>

        
      </div>
    </div>
  );
};

export default ProductDetail;
