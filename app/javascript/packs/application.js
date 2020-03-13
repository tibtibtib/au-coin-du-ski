import "bootstrap";
import { initStarRating } from '../plugins/init_star_rating';
import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';

import { filtersProducts } from '../plugin/productFilter';

import { datePicker, datePickerProduct } from '../plugin/datepickr';
// import { updatePriceOnDateClick } from '../plugin/calculate_price';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugin/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

fixFooter();

onScrollNavBar();

filtersProducts();

initMapbox();

initStarRating();

datePicker();
datePickerProduct();

initAutocomplete();
