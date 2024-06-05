import { Controller } from "@hotwired/stimulus"
import "html2pdf.js";

// Connects to data-controller="downloadable"
export default class extends Controller {
  static targets = ["content"];

  download(event) {
    const element = this.contentTarget;

    const tables = element.querySelectorAll('table');
    tables.forEach(t => {
      t.setAttribute('border', '1');
      const rows = t.querySelectorAll('tr');
      rows.forEach(row => {
        const cells = row.querySelectorAll('td, th');
        cells.forEach(cell => {
          cell.style.border = '1px solid black';
        });
      });
    });

    const filename = event.target.dataset.downloadableFilename || 'greenminds.pdf';

    console.log('oi');
    console.log(element);

    const options = {
      margin: 1,
      filename: filename,
      image: { type: 'jpeg', quality: 0.98 },
      html2canvas: { scale: 1, scrollY: 0 },
      jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
      pagebreak: { mode: ['avoid-all', 'css', 'legacy'] }
    };
    html2pdf().set(options).from(element).save();
  }
}
