// =========================================================
// GigSphere — shared front-end behavior
// =========================================================

document.addEventListener("DOMContentLoaded", function () {

  // Auto-dismiss flash alerts after 4 seconds
  document.querySelectorAll(".gs-alert").forEach(function (alertEl) {
    setTimeout(function () {
      var closeBtn = alertEl.querySelector(".btn-close");
      if (closeBtn) closeBtn.click();
    }, 4000);
  });

  // Toggle password visibility: add data-toggle="password" to an icon/button
  // and data-target="#idOfPasswordInput" pointing at the input.
  document.querySelectorAll('[data-toggle="password"]').forEach(function (btn) {
    btn.addEventListener("click", function () {
      var targetSel = btn.getAttribute("data-target");
      var input = document.querySelector(targetSel);
      if (!input) return;
      var isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";
      btn.classList.toggle("bi-eye");
      btn.classList.toggle("bi-eye-slash");
    });
  });

  // Bootstrap client-side validation styling
  var forms = document.querySelectorAll(".needs-validation");
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener(
      "submit",
      function (event) {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add("was-validated");
      },
      false
    );
  });

  // Highlight active sidebar link based on current URL, as a fallback
  // to the JSP-side "activePage" check in header.jsp.
  var path = window.location.pathname.split("/").pop();
  document.querySelectorAll(".gs-sidebar .nav-link").forEach(function (link) {
    if (link.getAttribute("href") && link.getAttribute("href").endsWith(path)) {
      link.classList.add("active");
    }
  });

});
// ============================================
// Delete Confirmation
// ============================================

document
    .querySelectorAll(".gs-delete-btn")
    .forEach(function (btn) {

      btn.addEventListener(
          "click",
          function (event) {

            if (!confirm(
                "Are you sure you want to delete this item?"
            )) {

              event.preventDefault();
            }
          }
      );

    });


// ============================================
// Auto Growing Textarea
// ============================================

document
    .querySelectorAll("textarea")
    .forEach(function (textarea) {

      textarea.addEventListener(
          "input",
          function () {

            this.style.height = "auto";
            this.style.height =
                this.scrollHeight + "px";

          }
      );

    });


// ============================================
// Preview Uploaded Image
// ============================================

const imageInput =
    document.getElementById("imageInput");

if (imageInput) {

  imageInput.addEventListener(
      "change",
      function () {

        const preview =
            document.getElementById(
                "imagePreview"
            );

        if (
            preview &&
            this.files.length > 0
        ) {

          preview.src =
              URL.createObjectURL(
                  this.files[0]
              );

          preview.style.display =
              "block";
        }
      }
  );

}