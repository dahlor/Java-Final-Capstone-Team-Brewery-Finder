<template>
   <div id='brewery-list'>
     <br>
     <br>
     <br>
     <br>
     <br>
     <br>
     <img id="hopimg" src="@/assets/hops.png" style="width: 40px"><br>
     <div id="breweryfinderlogo">BreweryFinder</div>
     <br>
     <br>

     <v-container>
       <div id="dropdown-and-search">
           <v-select
             v-model="dropdown"
             :items="ddItems"
              item-text="type"
              item-value="ddValue"
              label="Please select search type"
              filled
              background-color="#FFFFFF"
              persistent-hint
              return-object
              single-line
           ></v-select>
 
    
              <div v-if="this.dropdown.ddValue > 1">
                <v-form v-on:submit.prevent="textSearch"> 
                  
                  <v-text-field id="searchField" background-color="#FFFFFF" type="text" v-model="searchText" filled label="Enter search information"></v-text-field>
                  
                  <v-btn v-on:click="textSearch" color="#9CCC65">{{buttonText}}</v-btn>
                  <br>
                  <br>
                  <br>
                </v-form>
              </div>
    </div>

    <template>      
      <v-app id="inspire" app>
        <v-data-table v-if="resultsNotHidden"
          :headers="headers"
          :items="results"
          :single-expand="singleExpand"
          :items-per-page="10"
          item-key="name"
          show-expand
          class="elevation-1"
          >


            <template v-slot:[`item.name`]="{ item }">

              <div v-if="item.website_url !== null">  
               <a target="_blank" :href="item.website_url"> 
                {{ item.name }}
              </a>
              </div>

              <div v-if="item.website_url == null">  
                {{ item.name }}
              </div>
            </template>


          <template v-slot:[`item.username`]="{ item }">
      
            <router-link :to="{ name: 'breweryinfo', params: { id: item.obdb_id }}" @click.native="scrollToTop">
              <v-btn
              v-if="item.username !== null"
              small
              color="#1B5E20"
              width="85"
              dark
              >
              <img id="buttonicon" src="../assets/hops.png"><br> 
              <div id="profilebuttontext">PROFILE</div>
            </v-btn>
            </router-link>







           <v-tooltip top color="#212121" nudge-right="326" nudge-bottom="10">
           <template v-slot:activator="{ on, attrs }">
            <v-btn
              v-if="item.username == null"
              small
              outlined
              color="#616161"
              width="85"
              v-on="on"
              v-bind="attrs"
              dark
              @click.stop="dialog = true; assignDetails.obdb_id = item.obdb_id; templateDetails.obdb_id = item.obdb_id;"
              >
              UNCLAIMED
            </v-btn>
           </template>
           <span>Is this your brewery? Sign up for a Brewer account and claim your Brewery Profile.</span>
            </v-tooltip>
     
     
     
     </template>
     






          <template v-slot:expanded-item="{ headers, item }">
            <td :colspan="headers.length">
              <iframe
                width=100%
                height="250"
                style="border:0"
                loading="lazy"
                id="google-maps"
                allowfullscreen
                v-bind:src="googleMapsAPI + item.street + '+' + item.city + '+' + item.state + '+' + item.postal_code + '+USA'">
              </iframe>
            </td>
          </template>
        </v-data-table>
      </v-app>
    </template>  

<template>
 
   <v-dialog
        v-model="dialog"
        persistent
        max-width="350px">

        <v-card>
          <v-card-title>
            <span class="headline">Assign Brewer Account</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

                <v-col
                cols="12"
                md="12"
              >
                <v-text-field
                  label="Brewer Username"
                  v-model="assignDetails.username"
                  required
                ></v-text-field>
              </v-col>


              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="red"
              text
              @click="dialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="assignBrewer"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

</template>
  </v-container>
  </div>
</template>

<script>
import BreweryServices from '@/services/BreweryServices';

export default{
name: 'brewery-info',

data () {
    return {
        assignedUser: "",
        dialog: false,
        userRole: "",
        googleMapsAPI: "https://www.google.com/maps/embed/v1/place?key=AIzaSyCA0ZsJtAez-gVSYp1Z8Blv5N1iFiLu1Ug&q=",
        singleExpand: true,
        resultsNotHidden: false,
        searchBarNotHidden: false,
        buttonText: "Search",
        searchText: "",
        selectedValue: 1,
        expanded: [],
        results: [],

        assignDetails:
        {
          obdb_id: "",
          username: ""
        },

        templateDetails:
        {
          obdb_id: "",
          history: "Edit this section to explain to readers some of the history of your brewery.",
          image_url: "http://www.ll-mm.com/images/placeholders/image-placeholder.jpg",
          hour_open: "12:00 AM",
          hour_closed: "12:00 AM",
          open_sun: true,
          open_mon: true,
          open_tue: true,
          open_wed: true,
          open_thu: true,
          open_fri: true,
          open_sat: true
        },


        headers: [
        {
          text: '',
          align: 'start',
          sortable: false,
          value: 'username'
        },
        { text: 'Brewery', value: 'name', width: "24%"},
        { text: 'Address', value: 'street'},
        { text: 'City', value: 'city' },
        { text: 'State', value: 'state' },
        { text: 'Zip Code', value: 'postal_code' },
        { text: 'Phone', value: 'phone', width: "14%"}
      ],
        dropdown: { type: '', ddValue: '1' },
        ddItems: [
        { type: 'City', ddValue: '2' },
        { type: 'State', ddValue: '3' },
        { type: 'Zip Code', ddValue: '4' },
        { type: 'Brewery Name', ddValue: '5' },
      ],
    }
},

computed:  {

roleCheck() {
      return this.$store.state.user.authorities[0].name;
    },

    tokenCheck() {
      return this.$store.state.token;
    }

},

methods: {

      assignBrewer(){            
          this.dialog = false
          if (this.tokenCheck && this.$store.state.user.authorities[0].name == 'ROLE_ADMIN') {
          BreweryServices.assignBrewer(this.assignDetails).then(response => {
          console.log(response);
          this.$fire({
          title: "Success!",
          text: "This brewery has been assigned.",
          type: "success",
          timer: 300000
            }).then(r => {
             console.log(r);
             location.reload();      
      BreweryServices.addBreweryDetails(this.templateDetails).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Brewery details have been autopopulated.",
          type: "success",
          timer: 300000
            }).then(r => {
             console.log(r);
            location.reload();
            })
            })
        .catch((error) => {
        console.log(error);
        this.$fire({
          title: "Something went wrong!",
          text: "Verify that your server is running or please try again later.",
          type: "error",
          timer: 300000
        })
      }
    )


            })
            })
        .catch((error) => {
        console.log(error);
        this.$fire({
          title: "Something went wrong!",
          text: "Verify that your server is running or please try again later.",
          type: "error",
          timer: 300000
        })
      }
    )
    } else {

      this.$fire({
          title: "Invalid Credentials!",
          text: "Only Administrator can assign Brewer Profiles.",
          type: "error",
          timer: 300000
            }).then(r => {
             console.log(r);
            location.reload();
            })




    }
    
    
    },

  scrollToTop() {
      window.scrollTo(0,0);
           },

    buttonToggle(){
      if (this.buttonText == "Search"){
        this.buttonText = "Reset"
      } else
      if (this.buttonText == "Reset")  {
        this.searchText = "";
        this.buttonText = "Search"
      }
    },

    textSearch(){
        this.buttonToggle();
        this.resultsNotHidden = !this.resultsNotHidden;
        if (this.dropdown.ddValue == 2){
            this.citySearch();
        }
        if (this.dropdown.ddValue == 3){
            this.stateSearch();
        }
        if (this.dropdown.ddValue == 4){
            this.zipSearch();
        }
        if (this.dropdown.ddValue == 5){
            this.nameSearch();
        }
    },

    zipSearch(){
        BreweryServices.getBreweriesByZipCode(this.searchText).then(response => {
        this.results = response.data;
        })
    },

    citySearch(){
        BreweryServices.getBreweriesByCity(this.searchText).then(response => {
        this.results = response.data;
        })
    },

    nameSearch(){
        BreweryServices.getBreweriesByName(this.searchText).then(response => {
        this.results = response.data;
        })
    },

    stateSearch(){
        BreweryServices.getBreweriesByState(this.searchText).then(response => {
        this.results = response.data;
        })
    },
    }
}
</script>

<style scoped>

#SearchForm {
  display: inline
}

#google-maps {
  margin-top: 15px;
  margin-bottom: 9px;
}

#dropdown-and-search {
  text-align: center;
  font-family: "Fira Sans";
  font-size: 75%;
margin: 0 auto;
width: 40%;
}

#buttonicon {
  width: 11px;
}

#inspire {
  text-align: left;
  font-family: "Fira Sans";
  font-size: 60%;
}

#breweryfinderlogo {
    font-family: chango;
    font-size: 40px;
    position: relative;
    margin: auto;
    color: white;
}

#profilebuttontext{
  padding-top: 2px;
  padding-left: 3px;
  text-decoration: none;

}

#hopimg{
  position: relative;
  margin: auto;
}

a { 
  text-decoration: none; }


</style>
