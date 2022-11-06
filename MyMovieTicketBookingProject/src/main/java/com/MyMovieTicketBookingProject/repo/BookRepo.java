package com.MyMovieTicketBookingProject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.MyMovieTicketBookingProject.entites.Book;

@Repository
public interface BookRepo extends JpaRepository<Book,Integer>{

	
	@Query(nativeQuery = true, value="SELECT *FROM bookmovie WHERE user_id=:id ORDER BY id DESC LIMIT 1")
	public List<Book>getBookingListStatus(@Param("id") int id);	
	
	
	
	@Query("From Book where user.id=:id")
	public List<Book> getAllUserBookingDetails(int id);
	
}
