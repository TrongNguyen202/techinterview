import React, { useState, useEffect } from 'react';
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

const options = {
  responsive: true,
  plugins: {
    legend: {
      position: 'top' ,
    },
    title: {
      display: true,
      text: 'Lịch sử biến động giá',
    },
  },
};

const PriceHistoryChart = () => {
  const [priceHistory, setPriceHistory] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/shops/1/products/1/price_history');
        const data = await response.json();
        setPriceHistory(data.price_history);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  const labels = priceHistory.map(entry => entry.updated_at);
  const datasets = [
    {
      label: 'Price History',
      data: priceHistory.map(entry => entry.price),
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgba(255, 99, 132, 0.5)',
    },
  ];

  const data = { labels, datasets };

  return <Line options={options} data={data} />;
};

export default PriceHistoryChart;
