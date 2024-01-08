import React, { useState, useEffect } from 'react';
import '../App.css'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faStar as solidStar } from '@fortawesome/free-solid-svg-icons';
import { faStar as regularStar } from '@fortawesome/free-regular-svg-icons';
const ReviewsComponent = () => {
  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    const fetchReviews = async () => {
      try {
        const response = await fetch('http://localhost:8000/api/shops/products/1/reviews');
        const data = await response.json();
        setReviews(data.reviews);
      } catch (error) {
        console.error('Error fetching reviews:', error);
      }
    };

    fetchReviews();
  }, []);
  const stars = Array.from({ length: 5 }, (_, index) => (
    <FontAwesomeIcon
      icon={index < Math.floor(reviews.rating) ? solidStar : regularStar}
      key={index}
      className="text-yellow-500"
    />
  ));
  return (
    <div className="reviews-container">
      <h2 className="reviews-heading">Product Reviews</h2>
      {reviews.length > 0 ? (
        <ul className="reviews-list">
          {reviews.map((review) => (
            <li key={review.id} className="review-item">
              <div className="review-header">
                <p className="review-rating">Rating: {review.rating}</p>
                {stars}
                <p className="review-created-at">Created At: {review.created_at}</p>
              </div>
              <p className="review-comment">{review.review_comment}</p>
              
              {review.images && (
                <div className="review-images">
                  <p>Images:</p>
                  <ul className="image-list">
                    {review.images.map((image) => (
                      <li key={image.id}>
                        <img src={image.image_url} alt={`Review Image ${image.id}`} className="review-image" />
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </li>
          ))}
        </ul>
      ) : (
        <p>No reviews available.</p>
      )}
    </div>
  );
};

export default ReviewsComponent;
