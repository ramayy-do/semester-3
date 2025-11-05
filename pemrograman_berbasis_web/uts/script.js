// DARK / LIGHT THEME TOGGLE
const toggleBtn = document.getElementById("themeToggle");
const body = document.body;
const logo = document.getElementById("logoMaido");

// Fungsi untuk update tema + logo + localStorage
function updateTheme(isLight) {
  if (isLight) {
    body.classList.add("light-theme");
    logo.src = "img/logoGold.png";
    localStorage.setItem("theme", "light");
  } else {
    body.classList.remove("light-theme");
    logo.src = "img/logoMaido.png";
    localStorage.setItem("theme", "dark");
  }
}

// Load theme dari localStorage saat halaman dibuka
if (localStorage.getItem("theme") === "light") {
  updateTheme(true);
} else {
  updateTheme(false);
}

// Toggle theme ketika tombol diklik
toggleBtn.addEventListener("click", () => {
  const isLight = !body.classList.contains("light-theme");
  updateTheme(isLight);
});
