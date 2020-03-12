const updateForm = () => {
  const end_date_btn = document.getElementById('booking_end_date');
  const start_date_btn = document.getElementById('booking_start_date');
  const end_date = new Date(end_date_btn.value);
  const start_date = new Date(start_date_btn.value);
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


const end_date_input = document.getElementById('booking_end_date');
const start_date_input = document.getElementById('booking_start_date');


if (end_date_input && start_date_input) {
  updatePriceOnDateClick(start_date_input);
  updatePriceOnDateClick(end_date_input);
}

export { updatePriceOnDateClick };

