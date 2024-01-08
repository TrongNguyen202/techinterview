import React from 'react';
import Breadcrumb from './Breadcrumb';
// import {useLocation} from 'react-router-dom'
// const location = useLocation()
const Header = () => {

  const breadcrumbPaths = [
    { text: 'Trang chủ', url: '/' },
    { text: 'Phụ kiện', url: '/' },
    { text: 'Bộ Hub mở rộng Baseus Metal Gleam 2 Series 4K60Hz', url: '/' },
  ];

  return (
    <div>
      <div className="bg-gray-800 text-white p-4 flex justify-between items-center">
        {/* Logo */}
        <div className="flex items-center">
          <img
            src='https://lh3.googleusercontent.com/pw/ADCreHd5PMvwKUSbjtSRpUfeyDaazAbdXF1H0arvHtS62AyfivDEAN6hRSq-GTJ6wKiyn-9IEr63aaiNtFq6J2fP_I6VtpGAIwqAQu4B2mL64M2h2HHkPY4VhRWoDpag5VXN3Dxtwb277ZDkXPa0mnDxTTGL=w512'
            alt="Logo"
            className="h-10 w-40 mr-2"
          />
        </div>

        {/* Search Input */}
        <div className="flex items-center">
          <input
            type="text"
            placeholder="Search..."
            className="px-10 py-1 border border-white rounded-l"
          />
          <button className="bg-blue-500 px-4 py-1 rounded-r">
            Search
          </button>
        </div>

        {/* Category Icon */}
        <div className="flex items-center">
          <span className="mr-2">Categories</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="M19 9l-7 7-7-7"
            />
          </svg>
        </div>

        {/* Blog Icon */}
        <div className="flex items-center">
          <span className="mr-2">Blog</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="M9 5l7 7-7 7"
            />
          </svg>
        </div>
      </div>

      {/* Breadcrumb */}
      <div className='mt-5'>
        <Breadcrumb paths={breadcrumbPaths} />
      </div>
    </div>
  );
};

export default Header;
