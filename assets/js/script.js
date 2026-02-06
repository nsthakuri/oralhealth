/* ======================================================
   DARK MODE TOGGLE
====================================================== */
function toggleDarkMode() {
    document.body.classList.toggle("dark-mode");
    localStorage.setItem("dark-mode", document.body.classList.contains("dark-mode"));
}

window.onload = () => {
    if (localStorage.getItem("dark-mode") === "true") {
        document.body.classList.add("dark-mode");
    }
};

/* ======================================================
   ENABLE BOOTSTRAP DROPDOWN + SUBMENU
====================================================== */

// Enable Bootstrap dropdowns normally
document.querySelectorAll('.dropdown-toggle').forEach(function (dropdown) {
    new bootstrap.Dropdown(dropdown);
});

/* --- SUBMENU FIX (Bootstrap 5 does NOT support nested dropdowns) --- */
document.querySelectorAll(".dropdown-submenu").forEach(function (element) {

    element.addEventListener("mouseenter", function (e) {
        const submenu = this.querySelector(".dropdown-menu");
        if (submenu) {
            submenu.classList.add("show");
            submenu.style.display = "block";
        }
    });

    element.addEventListener("mouseleave", function (e) {
        const submenu = this.querySelector(".dropdown-menu");
        if (submenu) {
            submenu.classList.remove("show");
            submenu.style.display = "none";
        }
    });

    // Mobile click support
    element.querySelector("a").addEventListener("click", function (e) {
        const submenu = element.querySelector(".dropdown-menu");

        // Only block link if submenu exists
        if (submenu) {
            e.preventDefault();
            submenu.classList.toggle("show");
            submenu.style.display =
                submenu.classList.contains("show") ? "block" : "none";
        }
    });
});

/* ======================================================
   CLOSE SUBMENU WHEN DROPDOWN CLOSES
====================================================== */
document.querySelectorAll(".dropdown").forEach(function (dropdown) {
    dropdown.addEventListener("hidden.bs.dropdown", function () {
        this.querySelectorAll(".dropdown-menu.show").forEach(function (submenu) {
            submenu.classList.remove("show");
            submenu.style.display = "none";
        });
    });
});
