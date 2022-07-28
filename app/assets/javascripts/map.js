// // Initialize and add the map
// function initMap() {
//   // The map center
  
//   var map = new google.maps.Map(document.getElementById("map"), {
//     zoom: 3.4,
//     center: { lat: gon.addresses[0].Lat, lng: gon.addresses[0].Lng }
//   });
  
//   // The markers position
//   for (i = 0; i < gon.buildings.length; i++) {
//     var marker = new google.maps.Marker({
//       position: { lat: gon.addresses[i].Lat, lng: gon.addresses[i].Lng },
//       map: map
//     });

//     marker.setMap(map);
//     console.log(gon.buildings[i].batteries)
//     var infowindow = new google.maps.InfoWindow({
//       content:
//         "Address: " + gon.addresses[i].Number_And_Street + ";" +
//         "Number of floors: " + gon.building_details[i].Value + ";" +
//         " Company name: " + gon.customers[i].Company_Name + ";" +
//         //" Number of battery: " + gon.buildings[i].batteries.count() + ";" +
//         //" Number of column: " + gon.buildings[i].batteries.count() + ";" +
//         //" Number of elevator: " + gon.customers[i].Company_Name + ";" +
//         " Technical contact name: " + gon.customers[i].Full_Name_Of_The_Company_Contact + ";",
//       maxWidth: 200,
//     });

//     //infowindow.open(map, marker);
//     marker.addListener("click", (i) => {
//     infowindow.open(map, marker);
//     });
//   }
// }

// window.initMap = initMap;