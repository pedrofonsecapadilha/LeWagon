import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["word", "longLat"]

  connect() {}

  search(event) {
    event.preventDefault();
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${this.wordTarget.value}.json?access_token=pk.eyJ1IjoicGVkcm9mcGFkaWxoYSIsImEiOiJjbGFiYzU1ODAwYW84M3FvNTV1cmt4bXo4In0.-JwNzS04SLqwEvJ4vw4a-Q`)
      .then(response => response.json())
      .then((data) => {
        console.log(data.features[0].bbox[1]);
        let longitude = data.features[0].bbox[1];
        console.log(data.features[0].bbox[0]);
        let latitude = data.features[0].bbox[0];
        this.longLatTarget.innerText = `${longitude} , ${latitude}`;
      });
  }
}
