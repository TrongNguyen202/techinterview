import React, { useEffect, useState } from 'react';

const PriceCompare = () => {
  const [shops, setShops] = useState([]);
  const [pricesRange, setPricesRange] = useState([]);
  const [totalProducts, setTotalProducts] = useState(null);
  const [minPrice, setMinPrice] = useState(null);
  const [maxPrice, setMaxPrice] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/shops/search-products/ao');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }

        const data = await response.json();

        // Extract additional information
        setPricesRange(data.find(item => item.prices_range)?.prices_range || []);
        setTotalProducts(data.find(item => item.total_products)?.total_products || null);
        setMinPrice(data.find(item => item.min_price)?.min_price || null);
        setMaxPrice(data.find(item => item.max_price)?.max_price || null);

        // Extract shop and product information
        const shopsData = data.filter(item => item.shop_id && item.shop_name && item.products);
        setShops(shopsData);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="container mx-auto p-8">
      <h1 className="text-4xl font-bold mb-4">Price Compare</h1>
      <div className="additional-info flex items-center mb-4">
        <p className="mr-4 text-red-600">Total Products: <span className="font-bold">{totalProducts}</span></p>
        <div className="flex text-red-700">
          <p>Giá từ <span className="font-bold">{minPrice}</span> đến <span className="font-bold">{maxPrice}</span></p>
        </div>
      </div>

      {/* Display shops and products */}
      {shops.map(shop => (
        <div key={shop.shop_id} className="shop-container border p-4 mb-4">
          <h2 className="text-2xl font-bold mb-2">{shop.shop_name}</h2>
          <ul className="product-list">
            {shop.products.map(product => (
              <li key={product.product_id} className="product-item">
                <h3 className="text-lg font-semibold mb-1">{product.product_name}</h3>
                <p className="text-gray-700">Price: {product.price}</p>
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
}

export default PriceCompare;
