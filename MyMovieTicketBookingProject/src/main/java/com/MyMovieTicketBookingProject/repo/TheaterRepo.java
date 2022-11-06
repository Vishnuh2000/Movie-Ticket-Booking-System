package com.MyMovieTicketBookingProject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Theater;

@Repository
public interface TheaterRepo extends JpaRepository<Theater,Integer>{

	
	  @Query("From Theater where id=:id") 
	  List<Theater> theaters(@Param("id") int id);
	  
	 
	
	
}
