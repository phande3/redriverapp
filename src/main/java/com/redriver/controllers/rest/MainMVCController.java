package com.redriver.controllers.rest;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.redriver.dto.PageHolder;
import com.redriver.dto.Student;

@Controller
public class MainMVCController {
	
	@Value("${redriver.student.api.endpoint}")
	private String apiUrl;

	private final RestTemplate restTemplate ;
	public MainMVCController(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }
//	//@GetMapping("/")
//	public String getAll(@RequestParam(required = false) Integer page ,HttpServletRequest request) {
//		RestTemplate restTemplate = new RestTemplate();
//		String rrapiResourceUrl
//		  = "http://localhost:9090/rest/v1/students/paginated?firstName=&pageNumber=0";
////		Student[] students
////		  = restTemplate.getForObject(rrapiResourceUrl , Student[].class);
////		List <Student> lStudents =  Arrays.asList(students);
////		PagedListHolder<Student> pagedListHolder = new PagedListHolder<>(lStudents);
////		pagedListHolder.setPageSize(5);
////		
////		
////		request.setAttribute("students", lStudents);
//		
//		PageHolder pageHolder
//		  = restTemplate.getForObject(rrapiResourceUrl , PageHolder.class);
//	
//		request.setAttribute("pageHolder", pageHolder);
//		request.setAttribute("mode", "view");
//		return "index";
//	}
	@GetMapping("/")
	public String init(HttpServletRequest request) {
		
		//RestTemplate restTemplate = new RestTemplate();
		String pageNumber = request.getParameter("pageNumber");
		if(StringUtils.isEmpty(pageNumber))
			pageNumber = "0" ;
		String searchName = request.getParameter("searchName");
		String rrapiResourceUrl
		  = apiUrl +"paginated?searchName=" 
		+ (StringUtils.isEmpty(searchName)?"":searchName)
		  		+ "&pageNumber="+pageNumber;
//		Student[] students
//		  = restTemplate.getForObject(rrapiResourceUrl , Student[].class);
//		List <Student> lStudents =  Arrays.asList(students);
//		
//		request.setAttribute("students", lStudents);
		
		PageHolder pageHolder
		  = restTemplate.getForObject(rrapiResourceUrl , PageHolder.class);
	
		request.setAttribute("pageHolder", pageHolder);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("searchName", searchName);
		request.setAttribute("servermsg", "");
		request.setAttribute("mode", "view");
		return "index";
	}
	@GetMapping("/update")
	public String update(@RequestParam(name = "studentId") Long id , HttpServletRequest request ,
			HttpServletResponse resp) throws IOException {
		
		//RestTemplate restTemplate = new RestTemplate();
		String rrapiResourceUrl
		  = apiUrl+id;
		ResponseEntity<Student> response
		  = restTemplate.exchange(rrapiResourceUrl, HttpMethod.GET,null,Student.class);
			
		request.setAttribute("student", response.getBody());
		request.setAttribute("mode", "edit");
		//resp.sendRedirect("/");
		return "index";
	}
	@PostMapping("/save")
	public String save(  @ModelAttribute Student student, HttpServletRequest request,HttpServletResponse resp) throws IOException {
		
		//RestTemplate restTemplate = new RestTemplate();
//		String rrapiResourceUrl
//		  = "http://localhost:9090/rest/v1/students/";
//		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		//set your entity to send
		HttpEntity<Student> entity = new HttpEntity<Student>(student,headers);
		ResponseEntity<Student> response
		  = restTemplate.exchange(apiUrl, HttpMethod.POST ,entity,Student.class);
		
		
		//resp.sendRedirect("/");	
		init( request);
		if(response.getStatusCodeValue()==200) {
			request.setAttribute("servermsg", "Student saved successfully!!");
		} else {
			request.setAttribute("servermsg", "Internal Server Error!!");
		}
		return "index";
	}
	@PostMapping("/delete")
	public String delete(@RequestParam(name = "studentId") Long id , HttpServletRequest request ,
			HttpServletResponse resp) throws IOException {
		
		//RestTemplate restTemplate = new RestTemplate();
		String rrapiResourceUrl
		  = apiUrl+id;
		ResponseEntity<Student> response
		  = restTemplate.exchange(rrapiResourceUrl, HttpMethod.DELETE,null,Student.class);
		
		
		//resp.sendRedirect("/");
		init( request);
		if(response.getStatusCodeValue()==200) {
			request.setAttribute("servermsg", "Student Deleted successfully!!");
		} else {
			request.setAttribute("servermsg", "Internal Server Error");
		}
		return "index";
	}
}
