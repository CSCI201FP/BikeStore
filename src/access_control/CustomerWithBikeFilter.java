package access_control;

import objects.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Ensure it is a customer and has bike!
 */
@WebFilter(filterName = "CustomerWithBikeFilter")
public class CustomerWithBikeFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse rep = (HttpServletResponse) response;
        User user = (User) req.getSession().getAttribute("user");

        if (user.isManager()){
            req.setAttribute("warn", "Manager Cannot Access Customer Homepage !");
            req.getRequestDispatcher("/managerHomepage.jsp").forward(req,rep);
        } else {
            if ( user.getCurrentBikeID()==0 || user.isPending() ){
                req.setAttribute("warn", "You Must Reserve A Bike To Visit This Page !");
                req.getRequestDispatcher("/customerHomepage.jsp").forward(req,rep);
            }else {
                chain.doFilter(request, response);
            }
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
