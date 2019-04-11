package access_control;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.stream.Collectors;

@WebFilter(filterName = "LoggerFilter")
public class LoggerFilter implements Filter {
    private ServletContext context;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;

        Enumeration<String> params = req.getParameterNames();

        if (params.hasMoreElements()){
            this.context.log(req.getRemoteAddr() + "::Request Parameter::{\n" +
                    String.join("\n", Collections.list(params).stream().map((name) -> {
                        String value = req.getParameter(name);
                        return "\t" + name + " : " + value;
                    }).collect(Collectors.toList())) +"\n}" );
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

}
