package com.seatech.student_manager.controller.auth_controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {

	@Autowired
	HttpServletRequest req;

	@RequestMapping(path = {"/login","/{locale:en|fr|vi}/login"}, method = RequestMethod.GET)
	public String loginproccess() {
		System.out.println(((Locale)req.getSession().getAttribute("URL_LOCALE_ATTRIBUTE_NAME")).getLanguage());
		return "auth/login";
	}
}
