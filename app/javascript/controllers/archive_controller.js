// app/javascript/controllers/archive_controller.js


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["checkbox"]

    connect() {
        // You can set up any additional connection logic here if needed
    }

    toggleArchive(event) {
        const checkbox = event.target
        const archiveId = checkbox.value
        const assistantId = this.element.dataset.assistantId
        const checked = checkbox.checked

        fetch(`/admin/assistants/${assistantId}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ archive_id: archiveId, checked: checked })
        })
    }
}