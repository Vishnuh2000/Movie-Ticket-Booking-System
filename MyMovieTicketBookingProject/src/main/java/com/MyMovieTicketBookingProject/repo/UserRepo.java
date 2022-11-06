package com.MyMovieTicketBookingProject.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.MyMovieTicketBookingProject.entites.User;


@Repository
public interface UserRepo extends JpaRepository<User, Integer>{

	
	public boolean existsByEmail(String email);
	
	public User findByEmailAndPassword(String email , String password);
	
	public User findByUsertype(String usertype);
	
	@Query("From User where usertype='user'")
	public List<User> findAll();
	
	/*
	 * @Modifying
	 * 
	 * @Query("update User set firstname=:firstname , lastname=:lastname ,email=:email password=:password where id=:id"
	 * ) public User saveProfile(String firstname , String lastname , String email ,
	 * String password , int id);
	 */
	
	
}
