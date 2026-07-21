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

                    <h2 class="mb-4">
                        Login
                    </h2>

                    <form action="<%= request.getContextPath() %>/login" method="post">

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
                                    id="loginPassword"
                                    class="form-control"
                                    placeholder="Password"
                                    required>
                            <span class="input-group-text" style="cursor:pointer;">
                                <i class="bi bi-eye" data-toggle="password" data-target="#loginPassword"></i>
                            </span>
                        </div>

                        <button
                                type="submit"
                                class="btn btn-success w-100">

                            Login

                        </button>

                    </form>

                    <p class="text-center small text-muted mt-3 mb-0">
                        Don't have an account?
                        <a href="<%= request.getContextPath() %>/auth/register.jsp">Sign up</a>
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="../includes/footer.jsp" %>
