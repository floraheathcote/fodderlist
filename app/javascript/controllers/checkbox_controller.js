import { Controller } from "stimulus"

// export default class extends Controller {

export default class extends Controller {
  static targets = [ "ticked" ]

  toggle(event) {
      // Code to follow

      let formData = new FormData()
      formData.append("shopping_list_item[ticked]", this.tickedTarget.checked);

      fetch(this.data.get("updateUrl"), {
        body: formData,
        method: 'PATCH',
        credentials: "include",
        dataType: "script",
        headers: {
                "X-CSRF-Token": document.getElementsByName(
                  "csrf-token"
                )[0].content
         },
      })
      .then(function(response) {
        if (response.status != 204) {
            event.target.checked = !event.target.checked 
        }
      })


  }

}
