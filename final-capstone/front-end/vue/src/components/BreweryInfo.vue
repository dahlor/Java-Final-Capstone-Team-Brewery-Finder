<template>
 <div class="brewery-info">
  
 <div v-for="brewery in results" v-bind:key="brewery.name" class="brewery-information">
  
  <div class="brewery-name"> 
  <h1>{{brewery.name.toUpperCase()}}</h1>
  </div>
  <div class="brewery-address-etc">
  <h1>{{brewery.street.toUpperCase()}}</h1>
  <h1>{{brewery.city.toUpperCase()}}, 
      {{brewery.state.toUpperCase()}}
      {{brewery.postal_code.toUpperCase()}}</h1>
  <h1>{{brewery.website_url}}</h1>
  <h1>{{brewery.phone}}</h1>
  </div>
  <br>
 </div>


<!-- NEW CODE WENT HERE -->

<div>

<div v-for="details in detailResults" v-bind:key="details.obdb_id">
  <v-img v-bind:src="details.image_url" max-height="175"
  max-width="900" id="bar-image"></v-img>
  </div>
  
  <br>

<div v-for="details in detailResults" v-bind:key="details.obdb_id" id="history">
      <h1>{{details.history}}</h1>
      <br>
  </div>




<div v-for="details in detailResults" v-bind:key="details.obdb_id" id="history">
  
      <h1>{{details.hour_open.toUpperCase()}} - {{details.hour_closed.toUpperCase()}}</h1>
      <h1>WEDNESDAY THROUGH SUNDAY</h1>
<!--      <h1>{{details.open_sun}}</h1>      <h1>{{details.open_sun}}</h1>
      <h1>{{details.open_mon}}</h1>      <h1>{{details.open_mon}}</h1>
      <h1>{{details.open_tue}}</h1>      <h1>{{details.open_tue}}</h1>
      <h1>{{details.open_wed}}</h1>      <h1>{{details.open_wed}}</h1>
      <h1>{{details.open_thu}}</h1>      <h1>{{details.open_thu}}</h1>
      <h1>{{details.open_fri}}</h1>      <h1>{{details.open_fri}}</h1>
      <h1>{{details.open_sat}}</h1>      <h1>{{details.open_sat}}</h1> -->

<br>
</div>
</div>




 <div v-if="this.results[0].username == this.$store.state.user.username"    id="brewerybuttons">
   <div id="editbrewery">
      <v-dialog
        v-model="editdialog"
        persistent
        max-width="600px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Edit Brewery Details
          </v-btn>

        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Edit Brewery Details</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>










<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="image" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="imagedialog"
        persistent
        max-width="350px"
      >
        <template v-slot:activator="{ on, attrs }">

          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Image URL
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Image URL</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

                <v-col
                cols="12"
                md="12"
              >
                <v-text-field
                  label="New Image URL"
                  v-model="newImage.image_url"
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
              @click="imagedialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="updateImage"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>






















<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="history" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="historydialog"
        persistent
        max-width="350px"
      >
        <template v-slot:activator="{ on, attrs }">

          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Brewery History
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Brewery History</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

                <v-col
                cols="12"
                md="12"
              >
                <v-text-field
                  label="New Brewery History"
                  v-model="newHistory.history"
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
              @click="historydialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="updateHistory"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>








<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="houropen" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="houropendialog"
        persistent
        max-width="350px"
      >
        <template v-slot:activator="{ on, attrs }">

          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Hour Open
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Hour Open</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

                <v-col
                cols="12"
                md="12"
              >
                <v-text-field
                  label="New Hour Open"
                  v-model="newHourOpen.hour_open"
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
              @click="houropendialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="updateHourOpen"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>










<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="hourclosed" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="hourcloseddialog"
        persistent
        max-width="350px"
      >
        <template v-slot:activator="{ on, attrs }">

          <v-btn
          id="lastbutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Hour Closed
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Hour Closed</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

                <v-col
                cols="12"
                md="12"
              >
                <v-text-field
                  label="New Hour Closed"
                  v-model="newHourClosed.hour_closed"
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
              @click="hourcloseddialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="updateHourClosed"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>










































              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="#558B2F"
              text
              @click="editdialog = false"
            >
              Close
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>




 <template id="tapAndList">    

   <div class="brewery-information"> 
    <h1 id="ontap">ON TAP</h1>
   </div>














<!-- BREWER BUTTONS START HERE -->












 <template>
   <v-row
   id="brewerybuttons"
    align="center"
    justify="space-around"
  >

  <div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="addbeer" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="adddialog"
        persistent
        max-width="600px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Add New Beer
          </v-btn>

        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Add New Beer</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col
                  cols="12"
                  md="6"
                >
                  <v-text-field
                    label="Beer Name*"
                    v-model="newBeer.name"
                    required
                  ></v-text-field>
                </v-col>
                <v-col
                  cols="12"
                  md="6"
                >
                  <v-text-field
                    label="Brewery Name*"
                    v-model="newBeer.brewery"
                    required
                  ></v-text-field>
                </v-col>
                <v-col
                  cols="12"
                  md="12"
                >
                  <v-text-field
                    label="Beer Description*"
                    v-model="newBeer.description"
                    required
                  ></v-text-field>
                </v-col>
                <v-col
                  cols="12"
                  md="12"
                >
                  <v-text-field
                    label="Brewery Image URL*"
                    v-model="newBeer.image"
                    required
                  ></v-text-field>
                </v-col>
                  <v-col
                  cols="12"
                  md="4"
                >
                  <v-text-field
                    label="ABV*"
                   v-model="newBeer.abv"
                    required
                  ></v-text-field>
                </v-col>
                 <v-col
                  cols="12"
                  md="4"
                >
                  <v-text-field
                    label="Beer Type*"
                   v-model="newBeer.type"
                    required
                  ></v-text-field>
                </v-col>
                <v-col
                  cols="12"
                  sm="4"
                >
                  <v-select
                    :items="ddItems"
                    item-text="type"
                    item-value="ddValue"
                    v-model="newBeer.active"
                    label="Active*"
                    required
                  ></v-select>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="red"
              text
              @click="adddialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="addBeer"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>





<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="removebeer" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="deletedialog"
        persistent
        max-width="250px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
          id="singlebutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Remove Beer
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Remove A Beer</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

          <v-radio-group v-model="deleteId">
            <v-radio
             v-for="beer in beerResults"
            :key="beer"
            :label="beer.name"
            :value="beer.beer_id"
           ></v-radio>
          </v-radio-group>


              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="red"
              text
              @click="deletedialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="deleteBeer"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>



<div v-if="this.results[0].username == this.$store.state.user.username">
   <div id="activebeer" v-for="brewery in results" v-bind:key="brewery.obdb_id">
      <v-dialog
        v-model="activedialog"
        persistent
        max-width="350px"
      >
        <template v-slot:activator="{ on, attrs }">

          <v-btn
          id="lastbutton"
            color="#558B2F"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Update Beer Status
          </v-btn>
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Update Beer Status</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>

          <v-radio-group v-model="beerStatus.beer_id">
            <v-radio
             v-for="beer in beerResults"
            :key="beer"
            :label="beer.name"
            :value="beer.beer_id"
           ></v-radio>
          </v-radio-group>

                    <v-select
                    :items="ddItems"
                    color="#558B2F"
                    item-text="type"
                    item-value="ddValue"
                    v-model="beerStatus.active"
                    label="Active*"
                    required
                  ></v-select>


              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="red"
              text
              @click="activedialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="#558B2F"
              text
              @click="updateBeerStatus"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
</div>
</div>

</v-row>
</template>














<!-- END OF BREWER BUTTONS-->


















      <v-app id="inspire">
        <v-data-table
          :headers="headers"
          :items="beerResults"
          :single-expand="true"
          :items-per-page="10"
          item-key="name"
          show-expand
          hide-default-header
          hide-default-footer
          @item-expanded="getBeerReviews"
          class="elevation-1"
          >

          <template v-slot:[`item.active`]="{ item }">

              <div v-if="item.active == 'Y'">  
                Active
              </div>

              <div v-if="item.active == 'N'">  
                Inactive
              </div>

          </template>
  
          <template v-slot:expanded-item="{ headers, item }">
            <td :colspan="headers.length" id="expander">
              <div id="beerimageandinfo">
            <div class="beer-image">
                <img v-bind:src="item.image" id="beer-image">
            </div>
              <div>
                 <p class="text-info">
                   {{item.name}} 
                   {{item.type}} <br>
                   {{item.description}}
                  </p>
              </div>
            
              <p><span id="bflogotext">BreweryFinder</span>&nbsp;Average Beer Lover Rating:</p>
              <v-rating
      v-model="avgStarRating"
      background-color="green lighten-3"
      color="green"
      readonly
      medium
    ></v-rating>
    <p>from {{numberOfReviews}} <span v-if="numberOfReviews !== '1'">ratings</span><span v-if="numberOfReviews == '1'">rating</span></p>
</div>


              <v-divider></v-divider>

<div id="review-container">

      <v-dialog
        v-model="reviewdialog"
        persistent
        max-width="600px"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="#33691E"
            id="review-button"
            dark
            outlined
            v-bind="attrs"
            v-on="on"
          >
            REVIEW THIS BEER
          </v-btn>
        </template>
        <v-card>
          <v-card-text>
            <v-container>
                <v-col cols="12">
                  <v-text-field
                    label="Write your review*"
                    v-model="newReview.review_text"
                    required
                  ></v-text-field>
                </v-col>
                <v-rating
      v-model="newReview.star_rating"
      background-color="green lighten-3"
      color="green"
      large
    ></v-rating>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="blue darken-1"
              text
              @click="reviewdialog = false"
            >
              Close
            </v-btn>
            <v-btn
              color="blue darken-1"
              text
              @click="addReview"
            >
              Save
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

<template>
  <v-simple-table>
    <template v-slot:default>
      <tbody>
        <tr
          v-for="review in reviewResults"
          :key="review.username"
          >
                <td>{{review.username}} said "{{review.review_text}}"</td>

                    <td><v-rating
                :value='review.star_rating'
                :readonly="true"
                background-color="green lighten-3"
                color="green"
                size="20"
        ></v-rating></td>

        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
</div>


            </td>
          </template>
        </v-data-table>
      </v-app>
    </template>
 </div>
</template>





<script>

import BreweryServices from '@/services/BreweryServices';
import BeerService from '@/services/BeerService';


 


 export default{ 


   name: "brewery-informazione",

    data (){
        return{

          newImage: {
            obdb_id: this.$route.params.id,
            image_url: ""
          },

          newHistory: {
            obdb_id: this.$route.params.id,
            history: ""
          },

          newHourOpen: {
            obdb_id: this.$route.params.id,
            hour_open: ""
          },

          newHourClosed: {
            obdb_id: this.$route.params.id,
            hour_closed: ""
          },
          avgStarRating: "0",
          numberOfReviews: "0",
          imagedialog: false,
          historydialog: false,
          houropendialog: false,
          hourcloseddialog: false,
          editdialog: false,
          deleteId: "",
          ddItems: [
        { type: 'Yes', ddValue: 'Y' },
        { type: 'No', ddValue: 'N' }
      ],
        newBeer: {
        obdb_id: this.$route.params.id,
        name: "",
        brewery: "",
        description: "",
        image: "",
        abv: "",
        type: "",
        active: ""
       },  
          currentBrewery: "",
          beerStatus: {
            beer_id: "",
            active: ""
          },
          newReview: {
            beer_id: "",
            review_text: "",
            star_rating: "",
            username: this.$store.state.user.username,
       },
            activedialog: false,
            adddialog: false,
            reviewdialog: false,
            deletedialog: false,
            results: [],
            beerResults: [],
            detailResults:[],
            reviewResults:[],
            avgStarResults: [],
            headers: [
        {
          text: 'Beer',
          align: 'start',
          sortable: false,
          value: 'name'
        },
        { text: 'Brewery', value: 'brewery' },
        { text: 'ABV', value: 'abv' },
        { text: 'Type', value: 'type'},
        { text: 'Active', value: 'active'},    
            ]
        }
    },

    methods: {

      updateImage(){            
          this.imagedialog = false;
          this.editdialog = false
      BreweryServices.updateBreweryImage(this.newImage).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your image URL has been updated.",
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
    )},

      updateHistory(){            
          this.historydialog = false;
          this.editdialog = false
      BreweryServices.updateBreweryHistory(this.newHistory).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your brewery history has been updated.",
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
    )},

    updateHourOpen(){            
          this.houropendialog = false;
          this.editdialog = false
      BreweryServices.updateBreweryHourOpen(this.newHourOpen).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your brewery opening hours have been updated.",
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
    )},

      updateHourClosed(){            
          this.hourcloseddialog = false;
          this.editdialog = false
      BreweryServices.updateBreweryHourClosed(this.newHourClosed).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your brewery closing hours have been updated.",
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
    )},

          addReview(){            
          this.reviewdialog = false;
      BeerService.addBeerReview(this.newReview).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your review has been added.",
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
          title: "You're not logged in!",
          text: "Please login or register for a Beer Lover account.",
          type: "error",
          timer: 300000
        })
      }
    )},

      deleteBeer(){            
          this.deletedialog = false;
      BeerService.deleteBeer(this.deleteId).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "The beer has been removed and your tap list updated.",
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
    )},

    updateBeerStatus(){            
          this.updatedialog = false;
      BeerService.updateBeerStatus(this.beerStatus).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your beer status has been updated.",
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
    )},


      tokenCheck() {
      return this.$store.state.token;
    },

      userRoleCheck() {
      return this.$store.state.user.authorities[0].name;
      },

      usernameCheck(){
      return this.$store.state.user.username;
      },

      breweryOwnerCheck(){
      return this.results[0].username;
      },

      addBeer(){
        this.adddialog = false;
        BeerService.addBeer(this.newBeer).then(response => {
        console.log(response);
        this.$fire({
          title: "Success!",
          text: "Your new beer has been added.",
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
          text: "Please check your new beer information and try again.",
          type: "error",
          timer: 300000
        })
      }
    )
  },

      getBeerReviews({item}){
        this.newReview.beer_id = item.beer_id; /* Populate review with beerId when looking at each Beer page */
        BeerService.getBeerReviewsById(item.beer_id).then(response => {
        this.reviewResults = response.data;
        })
        BeerService.getAverageStarsById(item.beer_id).then(response => {
        this.avgStarResults = response.data;
        this.avgStarRating = this.avgStarResults[0].star_rating;
        this.numberOfReviews = this.avgStarResults[0].review_text;
        })
      },
    },

    created() {
        BreweryServices.getSingleBreweryInfo(this.$route.params.id).then(response => {
        this.results = response.data;
        })
        BreweryServices.getBreweryDetailsById(this.$route.params.id).then(response => {
        this.detailResults = response.data;
        })
        BeerService.getBeersByBrewery(this.$route.params.id).then(response => {
        this.beerResults = response.data;
        })
    },
    }

</script>

<style scoped>
#inspire {
  font-family: "Archivo Narrow";
  max-width: 675px;
  margin: auto;

}
#beer-image {
  margin-left: 20px;
  margin-bottom: 15px;
  height: 220px;
  float: left;
  position: relative;
  margin-top: 15px;
}

#text-center {
  height: 30px;
  margin-top: 15px;
}

.brewery-information{
    font-family: "Syncopate";
    color: white;
    font-size: 15px;
    position: relative;
}

.brewery-address-etc{
  font-family: "Abel";
  font-size: 60%;
}

.brewery-name {
  font-family: "Syncopate";
  font-size: 200%;

}
.brewery-phone {
  font-family: "Syncopate";
  font-size: 60%

}
.text-info{
  font-family: "Archivo Narrow";
  font-size: 15px;
  padding-top: 40px;
}

.week-hours {
  font-family: "Archivo Narrow";
  font-size: 12px;
  height: 40px;
  left: 87.75%;
  position: relative;
}

#bar-image {
margin: auto;
}

#history {
  font-family: "Archivo Narrow";
  position: relative;
  font-size: 12px;
  color: white;
  max-width: 700px;
  margin: auto;

}


#brewerybuttons {
  font-family: "Archivo Narrow";
  position: relative;
  margin-top: 6px;
  margin-bottom: 18px;
  justify-content: center;
}

#singlebutton {
  margin-top: 5px;
  margin-right: 10px;
}

#lastbutton{
  margin-top: 5px;
}


#beerimageandinfo {
  padding-bottom: 30px;
}

#reviewbutton {
  position: relative;
  margin: auto;
  padding-right: 100px;
}

#review-container {
 position: relative;
 padding: 9px;
}

#review-button{
  margin-top: 7px;
  margin-bottom: 5px;
}

#bflogotext {
    font-family: chango;
    font-size: 16.5px;
    color:black;
}

</style>
