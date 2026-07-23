</main>

<footer class="gs-footer-compact mt-auto py-3">
    <div class="container-fluid px-lg-5">
        <div class="row align-items-center gy-2">

            <!-- Brand & Status -->
            <div class="col-md-4 d-flex align-items-center gap-2">
                <span class="fw-bold text-info" style="font-family: 'Orbitron', sans-serif; letter-spacing: 1px;">
                    <i class="bi bi-cpu-fill me-1"></i>GIGSPHERE
                </span>
                <span class="text-secondary">|</span>
                <span class="small text-light opacity-75" style="font-family: 'JetBrains Mono', monospace;">
                    SYS.ONLINE
                </span>
            </div>

            <!-- Navigation Links -->
            <div class="col-md-4 text-center">
                <div class="d-flex justify-content-center gap-3">
                    <a href="<%= request.getContextPath() %>/index.jsp">// HOME</a>
                    <a href="<%= request.getContextPath() %>/auth/login.jsp">// AUTH</a>
                    <a href="<%= request.getContextPath() %>/auth/register.jsp">// REGISTER</a>
                </div>
            </div>

            <!-- System Info -->
            <div class="col-md-4 text-end">
                <span class="small text-light opacity-75" style="font-family: 'JetBrains Mono', monospace;">
                    USJ OOP PROJECT &bull; <span class="text-info">12ms</span>
                </span>
            </div>

        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/script.js?v=2.0"></script>

</body>
</html>