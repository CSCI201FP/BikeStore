package access_control;

import objects.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ManagerGroupFilter")
public class ManagerGroupFilter implements Filter {
    private ServletContext context;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        User user = (User) session.getAttribute("user");

        if (user.isManager()){
            chain.doFilter(request, response);
        } else {
            req.setAttribute("warn", "Do not have the privilege to visit the page");
            RequestDispatcher dispatcher = context.getRequestDispatcher("/customerHomepage.jsp");
            dispatcher.forward(request,response);
        }

    }

    public void init(FilterConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

}
