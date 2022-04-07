package edu.kdt.hygeia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HygeiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(HygeiaApplication.class, args);
		// conflict test 1
		// git test
<<<<<<< HEAD
		// conflict test 3
=======
		// conflict test 2
>>>>>>> dev
	}

}
