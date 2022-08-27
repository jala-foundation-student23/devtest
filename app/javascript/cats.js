window.addEventListener("scroll", () => {
  const scrollable = document.documentElement.scrollHeight - window.innerHeight;
  const scrolled = window.scrollY;

  if (scrolled === scrollable) {
    alert("This is a scroll trigger!");
  }
});
