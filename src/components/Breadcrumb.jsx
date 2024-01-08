import React from 'react';
import { AiOutlineRight, AiOutlineHome } from 'react-icons/ai';

const Breadcrumb = ({ paths }) => {
  const breadcrumbStyle = {
    display: 'flex',
    alignItems: 'center',
    fontSize: '18px', 
  };

  const breadcrumbItemStyle = {
    display: 'flex',
    alignItems: 'center',
    margin: '0 5px', 
  };

  return (
    <nav aria-label="breadcrumb">
      <ol className="breadcrumb" style={breadcrumbStyle}>
        <li className="breadcrumb-item" style={breadcrumbItemStyle}>
          <a href="/">
            <AiOutlineHome size={20} /> 
          </a>
        </li>
        {paths.map((path, index) => (
          <li className={`breadcrumb-item ${index === paths.length - 1 ? 'active' : ''}`} key={index} style={breadcrumbItemStyle}>
            {index === paths.length - 1 ? (
              path.text
            ) : (
              <>
                <a href={path.url} style={{ marginRight: '5px' }}>{path.text}</a> 
                <AiOutlineRight size={20} /> 
              </>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
};

export default Breadcrumb;
