// app/javascript/controllers/archive_controller.js

// Used to update the relation of an assistant to an archive

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["checkbox"]

    connect() {

        console.log('connect archive')
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
