import React from 'react';
import { IoIosGitCompare } from 'react-icons/io';
import { AiOutlineStock } from "react-icons/ai";
import { GrCircleInformation } from "react-icons/gr";
import { FaComments } from "react-icons/fa";

const NavInfor = () => {
  return (
    <div className='flex items-center max-w-100 px-5 py-10'>
      <NavItem icon={<IoIosGitCompare />} text="So sánh giá" />
      <NavItem icon={<AiOutlineStock />} text="Lịch sử giá" />
      <NavItem icon={<GrCircleInformation />} text="Mô tả sản phẩm" />
      <NavItem icon={<FaComments />} text="Comment" />
    </div>
  );
}

const NavItem = ({ icon, text }) => {
  return (
    <div className='flex items-center font-bold hover:underline hover:text-yellow-500 hover:cursor-pointer px-2 border-b-2 border-transparent hover:border-yellow-500'>
      <div className='text-lg'>{icon}</div>
      <div className='px-2'>{text}</div>
    </div>
  );
}

export default NavInfor;
