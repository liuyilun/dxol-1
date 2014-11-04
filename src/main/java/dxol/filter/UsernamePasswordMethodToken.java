package dxol.filter;

import org.apache.shiro.authc.UsernamePasswordToken;

public class UsernamePasswordMethodToken extends UsernamePasswordToken {
	private String method;

	public UsernamePasswordMethodToken(String username, char[] password, boolean rememberMe, String host, String method) {
		super(username, password, rememberMe, host);
		this.method = method;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

}
