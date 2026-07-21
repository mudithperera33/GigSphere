<%-- Closes the <div class="container"> and <main> opened in header.jsp, then renders the site footer. --%>
    </div>
</main>

<footer class="gs-footer mt-5">
    <div class="container py-4">
        <div class="row gy-3">

            <div class="col-md-4">
                <h5 class="gs-footer-brand">
                    <i class="bi bi-lightning-charge-fill"></i>
                    GigSphere
                </h5>
                <p class="text-muted small mb-0">
                    A freelance marketplace connecting clients and freelancers.
                </p>
            </div>

            <div class="col-md-4">
                <h6 class="text-uppercase small fw-bold">Platform</h6>
                <ul class="list-unstyled small">
                    <li>
                        <a href="<%= request.getContextPath() %>/index.jsp" class="gs-footer-link">
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/auth/login.jsp" class="gs-footer-link">
                            Login
                        </a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/auth/register.jsp" class="gs-footer-link">
                            Sign Up
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-md-4">
                <h6 class="text-uppercase small fw-bold">GigSphere</h6>
                <p class="text-muted small mb-0">
                    University of Sri Jayewardenepura &mdash; OOP Course Project
                </p>
            </div>

        </div>

        <hr class="border-secondary">

        <p class="text-center text-muted small mb-0">
            &copy; <%= java.time.Year.now().getValue() %> GigSphere. All rights reserved.
        </p>
    </div>
</footer>

<!-- Bootstrap 5 JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- GigSphere custom JS -->
<script src="<%= request.getContextPath() %>/assets/js/script.js"></script>

</body>
</html>
