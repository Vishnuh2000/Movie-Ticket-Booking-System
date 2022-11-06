package com.MyMovieTicketBookingProject.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Payment;

@Repository
@EnableJpaRepositories
public interface BookPayRepo extends JpaRepository<Payment,Integer>{

	@Query("From Payment where user_id=:id")
	public Payment getPaymentDetailsByid(int id);
	
}
