package edu.kdt.hygeia;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import edu.kdt.hygeia.review.ReviewController;
import edu.kdt.hygeia.review.ReviewDAO;
import edu.kdt.hygeia.food.FoodController;
import edu.kdt.hygeia.member.MemberController;
import edu.kdt.hygeia.member.MemberDAO;

@SpringBootApplication
@ComponentScan // 같은 패키지
@ComponentScan(basePackageClasses = ReviewController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = FoodController.class)

@MapperScan(basePackageClasses = MemberDAO.class)
@MapperScan(basePackageClasses = ReviewDAO.class)
public class HygeiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(HygeiaApplication.class, args);

	}

}
