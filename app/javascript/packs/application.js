import "bootstrap";

import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';
import { datePicker } from '../plugin/datepickr';
import { updatePriceOnDateClick } from '../plugin/calculate_price';

fixFooter();

onScrollNavBar();

datePicker();

