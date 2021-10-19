import { Controller } from "stimulus"

export default class PortionController extends Controller {

// connect() {
//     console.log("portion controller connected")
// }

double() {
    console.log("The portion controller double action is firing")

    fetch(this.data.get("update-url"), {
        // body: formData,
        method: 'GET',
        credentials: "include",
        dataType: "script",
        headers: {
            "X-CSRF-Token": document.getElementsByName(
                "csrf-token"
              )[0].content
        },
    })
}


}
