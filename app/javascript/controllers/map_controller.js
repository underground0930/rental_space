import { Controller } from "@hotwired/stimulus"

const myLatlng = { lat: 35.686067, lng: 139.760296 };

export default class extends Controller {
  static targets = ['map','latitude','longitude']

  connect() {
    this.initMap();
  }

  async initMap() {
    const target = this.mapTarget;
    const { Map } = await google.maps.importLibrary("maps");

    this.map = new Map(target, {
      center: myLatlng,
      zoom: 13,
    });

    this.marker = new google.maps.Marker({
      position: myLatlng,
      map:this.map,
      title: "Click to zoom",
    });

    this.map.addListener("click", (e) => {
      this.marker.setPosition(e.latLng)
      this.map.panTo(e.latLng);
      this.latitudeTarget.value = e.latLng.lat();
      this.longitudeTarget.value = e.latLng.lng();
    });
    
  }

}
