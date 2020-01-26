package com.redriver;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import com.redriver.controllers.rest.MainMVCController;

@SpringBootTest
@AutoConfigureMockMvc

class RedRiverappApplicationTests {

	@Autowired
	private MainMVCController controller;
	
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	void contextLoads() {
		assertThat(controller).isNotNull();
	}
	@Test
	public void shouldReturnDefaultMessage() throws Exception {
		this.mockMvc.perform(get("/")).andDo(print()).andExpect(status().isOk());
				
	}
}
