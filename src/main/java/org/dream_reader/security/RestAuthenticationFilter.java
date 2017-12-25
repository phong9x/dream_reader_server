package org.dream_reader.security;

import org.dream_reader.bean.UserItem;
import org.springframework.stereotype.Service;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.dream_reader.web.common.Login;
import java.io.IOException;

/**
 * Created by Kenny Phong .
 */
@Service
public class RestAuthenticationFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(true);
		String path = ((HttpServletRequest) request).getRequestURI();
		
		if (httpRequest.isRequestedSessionIdFromURL()) {
			if (session != null) {
				session.invalidate();
			}
		}

		if (path.startsWith("/auth")) {
			UserItem user = Login.getUserLogin(session);
			System.out.println("path: "+path);
			if (user == null) {
				System.out.println("No session");
				((HttpServletResponse) response).sendRedirect("/login");
				return;
			}
		}

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
