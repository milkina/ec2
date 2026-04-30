function toggleRoadmap(showText, hideText) {
  const hidden = document.querySelector(".roadmap-hidden");
  const btn = event.target;

  const isVisible = hidden.style.display === "grid";

  // Set button text based on language


  hidden.style.display = isVisible ? "none" : "grid";
  btn.innerText = isVisible ? showText : hideText;
}