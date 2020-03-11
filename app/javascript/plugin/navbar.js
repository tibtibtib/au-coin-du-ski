const onScrollNavBar = () => {
	document.addEventListener("scroll", (e) => {
		let banner = document.getElementById("banner");
		const navbar = document.getElementById("navbar");
		if (banner) {
			if (174 < window.scrollY) {
				navbar.style.backgroundColor = "white";
			} else {
				navbar.style.backgroundColor = "rgba(0,0,0,0)";
			}
		} else {
			banner = document.getElementById("banner-concept");
			if (banner) {
				if (163 < window.scrollY) {
					navbar.style.backgroundColor = "white";
				} else {
					navbar.style.backgroundColor = "rgba(0,0,0,0)";
				}
			}
		}
	});
};

export { onScrollNavBar };