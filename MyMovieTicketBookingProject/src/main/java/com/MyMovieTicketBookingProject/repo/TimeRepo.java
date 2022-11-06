package com.MyMovieTicketBookingProject.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Time;

@Repository
public interface TimeRepo extends JpaRepository<Time,Integer> {

	@Query("From Time where th_id=:id")
	public List<Time> getTimeSchedule(@Param("id") int id);
	

	@Modifying
	@Transactional
	@Query("delete Time where id=:id")
	public int deleteTimeById(@Param("id") int id);
}
