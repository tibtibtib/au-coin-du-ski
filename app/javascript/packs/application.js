import "bootstrap";

import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';
import { filtersProducts } from '../plugin/productFilter';

fixFooter();

onScrollNavBar();

filtersProducts();