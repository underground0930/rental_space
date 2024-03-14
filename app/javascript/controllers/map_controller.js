import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  connect() {
    alert("aaa")
    let map;

    async function initMap() {
      const { Map } = await google.maps.importLibrary("maps");
    
      map = new Map(document.getElementById("map"), {
        center: { lat: -34.397, lng: 150.644 },
        zoom: 8,
      });
    }
    
    initMap();

  }
}
