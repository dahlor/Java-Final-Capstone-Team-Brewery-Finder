import axios from 'axios';

const http = axios.create({
  baseURL: "https://atlantiscoding.com:8443"
});

export default {

      getSingleBreweryInfo(obdbId){
        return http.get(`/breweryfinder/breweries/${obdbId}`)
      },

      getBreweriesByName(name) {
        return http.get(`/breweryfinder/breweries/name/${name}`);
      },

      getBreweriesByCity(city) {
        return http.get(`/breweryfinder/breweries/location/city/${city}`);
      },

      getBreweriesByState(state) {
        return http.get(`/breweryfinder/breweries/location/state/${state}`);
      },

      getBreweriesByZipCode(zipCode) {
        return http.get(`/breweryfinder/breweries/location/zip/${zipCode}`);
      },

      addBrewery(newBrewery) {
        return http.post('/breweryfinder/addBrewery', newBrewery);
      },

      getBreweryDetailsById(obdbId){
        return http.get(`/breweryfinder/breweries/${obdbId}/details`)
      },

      addBreweryDetails(addDetails) {
        return http.post('/breweryfinder/breweries/addDetails', addDetails);
      },


      
      assignBrewer(updateDetails) {
        return http.post('/breweryfinder/breweries/assignBrewer', updateDetails);
      },



      updateBreweryHistory(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/history', updateDetails);
      },
      
      updateBreweryImage(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/image', updateDetails);
      },

      updateBreweryHourOpen(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/hourOpen', updateDetails);
      },

      updateBreweryHourClosed(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/hourClosed', updateDetails);
      },

      updateBreweryOpenSun(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openSun', updateDetails);
      },

      updateBreweryOpenMon(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openMon', updateDetails);
      },

      updateBreweryOpenTue(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openTue', updateDetails);
      },

      updateBreweryOpenWed(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openWed', updateDetails);
      },

      updateBreweryOpenThu(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openThu', updateDetails);
      },

      updateBreweryOpenFri(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openFri', updateDetails);
      },

      updateBreweryOpenSat(updateDetails) {
        return http.post('/breweryfinder/breweries/addDetails/openSat', updateDetails);
      },
  }
