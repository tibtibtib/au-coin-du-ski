import "bootstrap";
import { toggleTransparentNav } from "../plugin/navbar";

document.addEventListener("DOMContentLoaded", function (event) {
  var element = document.querySelector("body");
  var height = element.offsetHeight;
  if (height < screen.height) {
      document.getElementById("footer").classList.add('stikybottom');
  }
}, false);

toggleTransparentNav();