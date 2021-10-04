import { Controller } from "stimulus"

// export default class extends Controller {

export default class ToggleController extends Controller {
  // connect() {
  //   this.element.textContent = "Hello World!"
  // }

//   connect() {
//     console.log("The controller is connected")
//   }

  showhide() {
    console.log("Click!")
  }

}
