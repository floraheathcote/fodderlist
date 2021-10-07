import { Controller } from "stimulus"

// export default class extends Controller {

export default class ToggleController extends Controller {
  static targets = ["content", "buttonText"];
  static values  = { visible: Boolean }

  connect() {
    console.log("The toggle controller is connected")
  }

  

  // toggle() {
  //   this.contentTarget.classList.toggle('d-none') 
  // }

  // showhide() {
  //   console.log("Click!")
  // }

  connect() {
    this.updateHiddenClass()
    this.updateButtonText()
  }

  toggle() {
    this.flipState()
    this.updateHiddenClass()
    this.updateButtonText()
  }
    
  flipState() {
    this.visibleValue = !this.visibleValue
  }

  updateHiddenClass() {
    this.contentTarget.classList.toggle("d-none", !this.visibleValue)
  }

  newText() {
    return this.visibleValue ? "Hide" : "Show"
  }

  updateButtonText() {
    this.buttonTextTarget.innerText = this.newText()
  }



}
