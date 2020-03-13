import { datePickerProduct } from '../plugin/datepickr';

const updateForm = () => {
  const start_date_btn = document.getElementById('booking_start_date');
  const split_date = start_date_btn.value.split(" to ")

  const start_date = new Date(split_date[0]);
  const end_date = new Date(split_date[1]);

  const nb_days = (end_date - start_date) / (24 * 60 * 60 * 1000);
  const unit_price = Number.parseInt(document.getElementById('hidden').dataset.price, 10);
  const price = unit_price * nb_days;
  const price_field = document.getElementById('price-tag');

  if (price > 0) {
    price_field.innerHTML = `<p> <b>Durée:</b> ${nb_days} jours &nbsp &nbsp <b> Total: </b> ${price} €  </p> `;
  }
};

const updatePriceOnDateClick = (date_button) => {
  date_button.addEventListener('change', updateForm);
};


const priceUpdate = () => {
  const start_date_input = document.getElementById('booking_start_date');

  if (start_date_input) {
    datePickerProduct();
    updatePriceOnDateClick(start_date_input);
  };
};


export { priceUpdate };
