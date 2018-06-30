package com.seatech.student_manager.resolver;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.LocaleResolver;

public class UrlLocaleResolver implements LocaleResolver {
	
	public static Locale locale;
	private static final String URL_LOCALE_ATTRIBUTE_NAME = "URL_LOCALE_ATTRIBUTE_NAME";

	@Override
	public Locale resolveLocale(HttpServletRequest request) {
		// ==> /StudentManager/en/...
		// ==> /StudentManager/fr/...
		// ==> /StudentManager/WEB-INF/pages/...
		String uri = request.getRequestURI();
		System.out.println("URI = " + uri);
		String prefixEn = request.getServletContext().getContextPath() + "/en/";
		String prfixVi = request.getServletContext().getContextPath() + "/vi/";

		// English
		if (uri.startsWith(prefixEn)) {
			locale = Locale.US;
		}
		// Vietnamese
		else if (uri.startsWith(prfixVi)) {
			locale = new Locale("vi", "VN");
		}
		if (locale != null) {
			request.getSession().setAttribute(URL_LOCALE_ATTRIBUTE_NAME, locale);
		}
		if (locale == null) {
			locale = (Locale) request.getSession().getAttribute(URL_LOCALE_ATTRIBUTE_NAME);
			if (locale == null) {
				locale = Locale.US;
			}
		}
		return locale;
	}

	@Override
	public void setLocale(HttpServletRequest arg0, HttpServletResponse arg1, Locale arg2) {
		
	}

}
