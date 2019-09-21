package jee.support.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpResponse = (HttpServletResponse) resp;

        String user = (String) httpRequest.getSession().getAttribute(
                "adminname");
        if (user == null) {
            String dstUrl = httpRequest.getContextPath() + "/login.jsp";
            //重定向到登录页面
            httpResponse.sendRedirect(dstUrl);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("过滤器:"+this.getClass().getName() +" 初始化完成!");
    }

}
