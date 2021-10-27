import { Controller } from "stimulus"

export default class ToggleController extends Controller {
  static targets = ["hiddenOnLoad", "visibleOnLoad", "buttonText"];
  static values  = { visible: Boolean }

  initialize() {
    this.visible = false
  }

  connect() {
    // console.log("The toggle controller is connected")
        // this.updateHiddenClass()
        // if (this.hideOnLoadValue) {this.showhide()}
        // window.scrollTo(0,0)
    // console.log("hideOnLoad value:") 
    // console.log(this.hideOnLoadValue)
  }

  showhide() {
    console.log("showHide")
    this.flipState()
    this.updateHiddenClass()
    // this.updateButtonText()
  }
    
  flipState() {
    this.visible = !this.visible
    // this.initialvisibleValue = !this.initialvisibleValue
    // this.hiddenvisibleValue = !this.hiddenvisibleValue
  }

  updateHiddenClass() {
    this.hiddenOnLoadTarget.classList.toggle("d-none", !this.visible)
    this.visibleOnLoadTarget.classList.toggle("d-none", this.visible)
  }

  // newText() {
  //   return this.visible ? this.data.get("hideText") : this.data.get("showText")
  // }

  // updateButtonText() {
  //   this.buttonTextTarget.innerText = this.newText()
  // }



}
