import React from 'react';
import { IoIosGitCompare } from 'react-icons/io';

const NavInfor = () => {
  return (
    <div className='flex items-center'>
      <div className='flex items-center font-bold'>
        <div className='text-lg'> <IoIosGitCompare /></div>
        <div className='px-2'>So sánh giá</div>
      </div>
      <div className='flex items-center font-bold'>
        <div className='text-lg'> <IoIosGitCompare /></div>
        <div className='px-2'>Lịch sử giá</div>
      </div>
      <div className='flex items-center font-bold'>
        <div className='text-lg'> <IoIosGitCompare /></div>
        <div className='px-2'>Mô tả sản phẩm</div>
      </div>
      <div className='flex items-center font-bold'>
        <div className='text-lg'> <IoIosGitCompare /></div>
        <div className='px-2'>Comment</div>
      </div>
    </div>
  );
}

export default NavInfor;

