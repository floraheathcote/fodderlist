import { Controller } from "stimulus"

// export default class extends Controller {

export default class ToggleController extends Controller {
  static targets = ["content"];

  connect() {
    console.log("The toggle controller is connected")
  }

  

  toggle() {
    // this.contentTarget.classList.toggle("hidden");
    // var x = document.getElementById("tohide");
    this.contentTarget.classList.add('d-none')
      // if (this.class === "d-none") {
      //   this.class = "d-block";
      // } else {
      //   this.class = "d-none";
      // }
  }

  showhide() {
    console.log("Click!")
  }

}
