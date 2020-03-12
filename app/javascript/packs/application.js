import "bootstrap";

import { fixFooter } from '../plugin/footer';
import { onScrollNavBar } from '../plugin/navbar';
import { updatePriceOnDateClick } from '../plugin/calculate_price';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugin/init_mapbox';


fixFooter();

onScrollNavBar();

initMapbox();
