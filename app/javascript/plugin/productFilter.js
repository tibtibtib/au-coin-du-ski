const countDivs = (div) => {
	const divsArray = [].slice.call(div);
	let count = 0;
	divsArray.forEach((a) => {
		if (a.style.display !== "none") {
			count++;
		}
	});
	return count;
};

const filtersProducts = () => {
	if (document.getElementById("products-selector")) {
		$("#product_category").change(function () {
			document.querySelectorAll(".col-12").forEach((doc) => {
				doc.style.display = "block";
			});
			const product = ( this ).value;
			$(".card-product").each(function () {
				const divProduct = $( this ).find("span").text();
				if(divProduct !== product) {
					$( this ).parent().css("display", "none");
				}
			});
			document.getElementById("product-count").innerHTML = `${countDivs(document.getElementsByClassName("card-product"))} annones trouvées`;
		});
	}
};

export { filtersProducts };