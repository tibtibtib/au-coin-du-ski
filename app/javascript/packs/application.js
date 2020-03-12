import "bootstrap";

import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';
import { filtersProducts } from '../plugin/productFilter';
import { updatePriceOnDateClick } from '../plugin/calculate_price';

fixFooter();

onScrollNavBar();

filtersProducts();