package com.redriver.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	@ExceptionHandler(Exception.class)
	public String handleSQLException(HttpServletRequest request, Exception ex){
		logger.error("Exception Occured:: URL="+request.getRequestURL() + " -" + ex.getLocalizedMessage());
		request.setAttribute("servererror", "Internal Server Error.Please contact System Administrator for assistance!!");
		return "index";
	}
}
