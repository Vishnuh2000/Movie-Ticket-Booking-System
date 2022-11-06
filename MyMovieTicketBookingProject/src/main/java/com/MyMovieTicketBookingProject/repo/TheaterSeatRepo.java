package com.MyMovieTicketBookingProject.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Seats;

@Repository
public interface TheaterSeatRepo extends JpaRepository<Seats,Integer>{

	
	@Query("From Seats where th_id=:id")
	public List<Seats> findAllSeatById(@Param("id")int id);
	
	
	@Query("From Seats where id=:id")
	public List<Seats> findAllSeat(@Param("id")int id);
	
	@Modifying
	@Transactional
	@Query("update Seats set totalSeats=:seat where id=:id")
	public int reduceSeat(int seat , int id);
	
	@Modifying
	@Transactional
	@Query("delete Seats where id=:id")
	public int deleteSeatById(@Param("id") int id);
	
}
