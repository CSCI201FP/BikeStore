package filters;

import objects.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    private ServletContext context;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession session = req.getSession(false);

        if (session!=null && session.getAttribute("user")!=null  ){
            chain.doFilter(request, response);
        }else {
            request.setAttribute("Message", "Must login to visit this page");
            RequestDispatcher dispatcher = context.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request,response);
        }

    }

    public void init(FilterConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

}
