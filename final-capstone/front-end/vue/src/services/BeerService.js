import axios from 'axios';

const http = axios.create({
  baseURL: "https://atlantiscoding.com:8443"
});

export default {

      getBeersByBrewery(breweryId) {
        return http.get(`/breweryfinder/breweries/${breweryId}/beerlist`);
      },

      getBeerInfo(beerId) {
        return http.get(`/breweryfinder/beers/${beerId}`);
      },

      addBeer(newBeer) {
        return http.post('/breweryfinder/beers/maintenance/addBeer', newBeer);
      },

      updateBeerStatus(newStatus) {
        return http.post('/breweryfinder/beers/maintenance/updateBeerStatus', newStatus);
      },

      deleteBeer(beerId) {
          return http.post(`/breweryfinder/beers/maintenance/deleteBeer/${beerId}`)
      },

      getBeerReviewsById(beerId) {
        return http.get(`/breweryfinder/reviews/${beerId}`)
    },
    
      addBeerReview(review) {
      return http.post('/breweryfinder/reviews/maintenance/addReview', review)
  },

      getAverageStarsById(beerId) {
        return http.get(`/breweryfinder/reviews/${beerId}/averageStars`)
    }

  }
