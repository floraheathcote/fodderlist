import { Controller } from "stimulus"
export default class extends Controller {
    static targets = [ "completed" ]
    toggle(event) {
        let formData = new FormData()
        formData.append("todo[completed]", this.completedTarget.checked);

        fetch(this.data.get("update-url"), {
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