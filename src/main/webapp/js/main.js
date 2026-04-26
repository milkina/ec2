function toggleRoadmap() {
  const hidden = document.querySelector(".roadmap-hidden");
  const btn = event.target;

  const isVisible = hidden.style.display === "grid";

  hidden.style.display = isVisible ? "none" : "grid";
  btn.innerText = isVisible ? "Показать все" : "Скрыть";
}