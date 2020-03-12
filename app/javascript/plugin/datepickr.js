import flatpickr from 'flatpickr';
import "flatpickr/dist/themes/material_red.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const datePicker = () => {
  flatpickr("#start_date", {
    altInput: true,
    altFormat: "d/m/Y",
    allowInput: true,
    "plugins": [new rangePlugin({ input: "#end_date"})]
  });
};


export { datePicker };
