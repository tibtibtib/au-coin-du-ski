import "bootstrap";
import { initStarRating } from '../plugins/init_star_rating';
import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';
import { datePicker } from '../plugin/datepickr';
import { updatePriceOnDateClick } from '../plugin/calculate_price';

fixFooter();

onScrollNavBar();

initStarRating();
datePicker();

