package com.project.npnc.error;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyErrorController implements ErrorController {

	 @RequestMapping(value = "/error", method = {RequestMethod.GET, RequestMethod.POST})
	    public String handleError(HttpServletRequest request) {
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

	        if (status != null) {
	            Integer statusCode = Integer.valueOf(status.toString());

	            if (statusCode == HttpStatus.NOT_FOUND.value()) {
	                return "error/404"; // 404.jsp
	            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
	                return "error/403"; // 403.jsp
	            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	                return "error/500"; // 500.jsp
	            } else if (statusCode == HttpStatus.PAYMENT_REQUIRED.value()) {
	                return "error/402"; // 402.jsp
	            }
	            
	            
	        }
	        return "error/error"; // 기본 에러 페이지
	    }


	    public String getErrorPath() {
	        return "/error";
	    }
	
	
	
	
}
