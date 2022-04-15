package edu.kdt.hygeia;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import edu.kdt.hygeia.food.FoodController;
import edu.kdt.hygeia.food.FoodDAO;
import edu.kdt.hygeia.review.ReviewController;
import edu.kdt.hygeia.review.ReviewDAO;

@SpringBootApplication
@ComponentScan(basePackageClasses = FoodController.class)
@ComponentScan(basePackageClasses = ReviewController.class)

@MapperScan(basePackageClasses = ReviewDAO.class)
@MapperScan(basePackageClasses = FoodDAO.class)//
public class HygeiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(HygeiaApplication.class, args);

	}

}
