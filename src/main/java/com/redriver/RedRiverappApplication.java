package com.redriver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RedRiverappApplication {

	public static void main(String[] args) {
		SpringApplication.run(RedRiverappApplication.class, args);
	}
//	@Bean
//	public LocaleResolver localeResolver() {
//	    SessionLocaleResolver slr = new SessionLocaleResolver();
//	    slr.setDefaultLocale(Locale.US);
//	    return slr;
//	}
//	@Bean
//	public LocaleChangeInterceptor localeChangeInterceptor() {
//	    LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
//	    lci.setParamName("Accept-Language");
//	    return lci;
//	}
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//	    registry.addInterceptor(localeChangeInterceptor());
//	}
//	@InitBinder
//    public void initBinder(WebDataBinder binder) {
//        CustomDateEditor editor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
//        binder.registerCustomEditor(Date.class, editor);
//    }
}
