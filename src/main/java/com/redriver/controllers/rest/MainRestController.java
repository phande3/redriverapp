package com.redriver.controllers.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.redriver.dto.PageHolder;
import com.redriver.dto.Student;

@RestController
public class MainRestController {
	
	@Value("${redriver.student.api.endpoint}")
	private String apiUrl;
//	@Autowired
//	private RestTemplate restTemplate ;
//	
//	@GetMapping(value = "/")
//	public String hello() {
//		return "Hello World!!";
//	}
	@GetMapping(value = "/getAll")
	public PageHolder getAllStudents() {
		RestTemplate restTemplate = new RestTemplate();
		String rrapiResourceUrl
		  = apiUrl + "paginated";
		PageHolder pageHolder
		  = restTemplate.getForObject(rrapiResourceUrl , PageHolder.class);
		return pageHolder;
	}
	@RequestMapping( method = RequestMethod.GET , value = "/get/{studentId}" , produces = { MimeTypeUtils.APPLICATION_JSON_VALUE} )
	public ResponseEntity<Student> get(@PathVariable(value = "studentId") Long id , HttpServletRequest request) {
		ResponseEntity<Student> response;
		
		try {
			RestTemplate restTemplate = new RestTemplate();
			String rrapiResourceUrl
			  = apiUrl+id;
			response  = restTemplate.exchange(rrapiResourceUrl, HttpMethod.GET,null,Student.class);
		} catch(Exception ex) {
			response = new ResponseEntity<Student>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
			
		return response;
	}
}
