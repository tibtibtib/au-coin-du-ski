const filtersProducts = () => {
	if (document.getElementById("products-selector")) {
		let selector = document.getElementById("product_category");
		selector.addEventListener("change", (e) => {
			const parentNode = document.getElementsByClassName("row")[0];
			let childrens = [].slice.call(document.getElementsByClassName("row")[0].children);
			childrens.forEach((children) => {
				console.log(children.children.querySelector("span").innerText);
			});
		});
	}
};

export { filtersProducts };