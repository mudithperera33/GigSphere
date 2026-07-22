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

                    <h3 class="mb-4">
                        Create Your Account
                    </h3>

                    <form action="<%= request.getContextPath() %>/register" method="post">

                        <div class="mb-3">
                            <label class="form-label">
                                Full Name
                            </label>
                            <input
                                    type="text"
                                    name="name"
                                    class="form-control"
                                    required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                Email
                            </label>
                            <input
                                    type="email"
                                    name="email"
                                    class="form-control"
                                    required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">
                                Password
                            </label>
                            <input
                                    type="password"
                                    name="password"
                                    class="form-control"
                                    required>
                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Location
                            </label>

                            <input
                                    type="text"
                                    name="location"
                                    class="form-control"
                                    required>

                        </div>

                        <button
                                type="submit"
                                class="btn btn-primary w-100">

                            Register

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
