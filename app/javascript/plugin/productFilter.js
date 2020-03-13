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
		});
	}
};

export { filtersProducts };