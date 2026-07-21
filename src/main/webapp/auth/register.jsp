<%
    request.setAttribute("pageTitle", "Register");
    request.setAttribute("activePage", "register");
%>
<%@ include file="../includes/header.jsp" %>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card gs-auth-card">

                <div class="card-body p-4">

                    <h2 class="mb-4">
                        Create Account
                    </h2>

                    <form action="<%= request.getContextPath() %>/register" method="post">

                        <input
                                type="text"
                                name="name"
                                class="form-control mb-3"
                                placeholder="Full Name"
                                required>

                        <input
                                type="email"
                                name="email"
                                class="form-control mb-3"
                                placeholder="Email"
                                required>

                        <div class="input-group mb-3">
                            <input
                                    type="password"
                                    name="password"
                                    id="regPassword"
                                    class="form-control"
                                    placeholder="Password"
                                    required>
                            <span class="input-group-text" style="cursor:pointer;">
                                <i class="bi bi-eye" data-toggle="password" data-target="#regPassword"></i>
                            </span>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small text-muted mb-2">I want to join as:</label>
                            <div class="d-flex gap-3">
                                <div class="form-check">
                                    <input
                                            class="form-check-input"
                                            type="radio"
                                            name="role"
                                            id="roleClient"
                                            value="CLIENT"
                                            checked>
                                    <label class="form-check-label" for="roleClient">
                                        Client
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input
                                            class="form-check-input"
                                            type="radio"
                                            name="role"
                                            id="roleFreelancer"
                                            value="FREELANCER">
                                    <label class="form-check-label" for="roleFreelancer">
                                        Freelancer
                                    </label>
                                </div>
                            </div>
                        </div>

                        <button
                                type="submit"
                                class="btn btn-primary w-100">

                            Register

                        </button>

                    </form>

                    <p class="text-center small text-muted mt-3 mb-0">
                        Already have an account?
                        <a href="<%= request.getContextPath() %>/auth/login.jsp">Log in</a>
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
