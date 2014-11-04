package dxol.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String method = getMethod(request);
		System.out.println("FormAuthenticationFilter =============" + method);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		return new UsernamePasswordMethodToken(username, password.toCharArray(), rememberMe, host, method);
	}

	private String getMethod(ServletRequest request) {
		return WebUtils.getCleanParam(request, "method");
	}

}
