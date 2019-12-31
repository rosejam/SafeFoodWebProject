package com.qna;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class VuebootqnalistApplication {

	public static void main(String[] args) {
		SpringApplication.run(VuebootqnalistApplication.class, args);
	}

}
