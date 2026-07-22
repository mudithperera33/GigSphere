<%
request.setAttribute("pageTitle", "Login");
request.setAttribute("activePage", "login");
%>

<%@ include file="../includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card gs-auth-card">
                <div class="card-body p-4">
                    <h3 class="mb-4">Login</h3>

                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email"
                                   id="email"
                                   name="email"
                                   class="form-control"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password"
                                   id="password"
                                   name="password"
                                   class="form-control"
                                   required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">
                            Login
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>