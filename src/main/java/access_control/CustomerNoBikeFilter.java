package access_control;

import objects.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "CustomerNoBikeFilter")
public class CustomerNoBikeFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse rep = (HttpServletResponse) response;
        User user = (User) req.getSession().getAttribute("user");

        if (user.isManager()){
            req.setAttribute("warn", "Manager Cannot Access Customer Pages!");
            req.getRequestDispatcher("/managerHomepage.jsp").forward(req,rep);
        } else {
            if (user.getCurrentBikeID()!=0 || user.isPending()){
                req.setAttribute("warn", "You Can Only Reserve One Bike!");
                req.getRequestDispatcher("/bike.jsp").forward(req,rep);
            }else{
                chain.doFilter(request, response);
            }
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
