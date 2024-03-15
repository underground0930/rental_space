import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-map"
export default class extends Controller {

  static values = { latitude: Number, longitude: Number }

  connect() {
    this.initMap();
  }

  async initMap() {
    const initLatlng = { lat: this.latitudeValue, lng: this.longitudeValue };
    const { Map } = await google.maps.importLibrary("maps");

    this.map = new Map(this.element, {
      center: initLatlng,
      zoom: 13,
    });

    this.marker = new google.maps.Marker({
      position: initLatlng,
      map:this.map,
      title: "Click to zoom",
    });

  }
}
