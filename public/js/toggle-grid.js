$(document).ready(function () {
  $(document).bind("keydown", function (event) {
    if (event.which == 27) {
      event.preventDefault();
      $(document.body).toggleClass("show-grid");
    }
  });
});