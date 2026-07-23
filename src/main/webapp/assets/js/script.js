// =========================================================
// GigSphere — Cyber Interactive Script
// =========================================================

document.addEventListener("DOMContentLoaded", function () {

    // --- Auto-dismiss Flash Alerts ---
    document.querySelectorAll(".alert").forEach(function (alertEl) {
        setTimeout(function () {
            var closeBtn = alertEl.querySelector(".btn-close");
            if (closeBtn) closeBtn.click();
        }, 4000);
    });

    // --- Password Field Toggle ---
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

    // --- Auto Growing Textarea ---
    document.querySelectorAll("textarea").forEach(function (textarea) {
        textarea.addEventListener("input", function () {
            this.style.height = "auto";
            this.style.height = this.scrollHeight + "px";
        });
    });

    // --- Image Upload Preview ---
    const imageInput = document.getElementById("imageInput");
    if (imageInput) {
        imageInput.addEventListener("change", function () {
            const preview = document.getElementById("imagePreview");
            if (preview && this.files.length > 0) {
                preview.src = URL.createObjectURL(this.files[0]);
                preview.style.display = "block";
            }
        });
    }

    // --- Cyber Card Hover Elevation Light Tracker ---
    const cards = document.querySelectorAll(".card, .gs-card");
    cards.forEach((card) => {
        card.addEventListener("mousemove", (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            card.style.setProperty("--mouse-x", `${x}px`);
            card.style.setProperty("--mouse-y", `${y}px`);
        });
    });

});