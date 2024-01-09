import React, { useState, useEffect } from 'react';
import { IoIosGitCompare } from 'react-icons/io';
import { AiOutlineStock } from "react-icons/ai";
import { GrCircleInformation } from "react-icons/gr";
import { FaComments } from "react-icons/fa";

const NavInfor = () => {
  const [scrollAmount, setScrollAmount] = useState(0);

  const handleItemClick = (amount) => {
    setScrollAmount(amount);
  };

  return (
    <div className='flex items-center max-w-100 px-5 py-10'>
      <NavItem icon={<IoIosGitCompare />} text="So sánh giá" onClick={() => handleItemClick(500)} />
      <NavItem icon={<AiOutlineStock />} text="Lịch sử giá" onClick={() => handleItemClick(1000)} />
      <NavItem icon={<GrCircleInformation />} text="Mô tả sản phẩm" onClick={() => handleItemClick(1500)} />
      <NavItem icon={<FaComments />} text="Comment" onClick={() => handleItemClick(2000)} />
      
      {/* Render the section based on the state */}
      {scrollAmount !== 0 && <ScrollToSection scrollAmount={scrollAmount} />}
    </div>
  );
}

const NavItem = ({ icon, text, onClick }) => {
  return (
    <div
      className='flex items-center font-bold hover:underline hover:text-yellow-500 hover:cursor-pointer px-2 border-b-2 border-transparent hover:border-yellow-500'
      onClick={onClick}
    >
      <div className='text-lg'>{icon}</div>
      <div className='px-2'>{text}</div>
    </div>
  );
}

const ScrollToSection = ({ scrollAmount }) => {
  useEffect(() => {
    window.scrollBy({
      top: scrollAmount,
      behavior: 'smooth',
    });
  }, [scrollAmount]);

  return null;
}

export default NavInfor;
