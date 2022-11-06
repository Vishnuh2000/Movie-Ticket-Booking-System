package com.MyMovieTicketBookingProject.repo;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Movie;

@Repository
public interface MovieRepo extends JpaRepository<Movie,Integer>{
	
	@Modifying
	@Transactional
	@Query("delete Movie where id=:id")
	public int deleteMoviesById(@Param("id")int id);

}
