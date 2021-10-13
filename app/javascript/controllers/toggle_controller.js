import { Controller } from "stimulus"

// export default class extends Controller {

export default class ToggleController extends Controller {
  static targets = ["content", "buttonText"];
  static values  = { visible: Boolean, hideOnLoad: Boolean }


  

  // toggle() {
  //   this.contentTarget.classList.toggle('d-none') 
  // }

  // showhide() {
  //   console.log("Click!")
  // }

  connect() {
    console.log("The toggle controller is connected")
    this.updateHiddenClass()
    // this.updateButtonText()
    if (this.hideOnLoadValue) {this.showhide()}
    window.scrollTo(0,0)
    console.log("hideOnLoad value:") 
    console.log(this.hideOnLoadValue)
  }

  showhide() {
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
    return this.visibleValue ? this.data.get("hideText") : this.data.get("showText")
  }

  updateButtonText() {
    this.buttonTextTarget.innerText = this.newText()
  }

  // tickUntick() {
  //   item = ShoppingListItem.find(this.contentTarget.id)
  //   item.toggle( false , true )
  // }

}
