import React, { useState, useEffect } from 'react';

const ProductDescription = () => {
  const [productData, setProductData] = useState({
    description: '',
    otherInfo: '', // Include other fields as needed
  });

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/shops/1/products/1');
        const data = await response.json();
        setProductData({
          description: data.description,
          otherInfo: data.otherInfo, // Include other fields from the API response
        });
      } catch (error) {
        console.error('Error fetching product data:', error);
      }
    };

    fetchData();
  }, []);

  if (!productData.description) {
    // Loading state or error handling can be added here
    return <div>Loading...</div>;
  }

  return (
    <div >
      <h1  className='text-red-700 text-center'>Mô tả sản phẩm</h1>
      <div className='text-center' dangerouslySetInnerHTML={{ __html: productData.description }} />

      {/* Render other information */}
      <p>Other Info: {productData.otherInfo}</p>
    </div>
  );
};

export default ProductDescription;
