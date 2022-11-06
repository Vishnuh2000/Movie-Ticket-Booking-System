package com.MyMovieTicketBookingProject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.MyMovieTicketBookingProject.entites.Book;
import com.MyMovieTicketBookingProject.entites.Payment;
import com.MyMovieTicketBookingProject.entites.User;
import com.MyMovieTicketBookingProject.repo.BookPayRepo;
import com.MyMovieTicketBookingProject.repo.BookRepo;
import com.MyMovieTicketBookingProject.repo.TheaterSeatRepo;
import com.MyMovieTicketBookingProject.repo.UserRepo;

@Service
public class UserServices {

	@Autowired
	UserRepo repo;

	@Autowired
	BookRepo bookRepo;
	
	@Autowired
	TheaterSeatRepo theaterSeatRepo;
	
	@Autowired
	BookPayRepo paymentRepo;
	

	public User RegisterUserData(User u) {

		return repo.save(u);

	}

	public boolean existsByEmail(String email) {

		return repo.existsByEmail(email);

	}

	public User getByEmailAndPassword(String email, String password) {

		return repo.findByEmailAndPassword(email, password);

	}

	public User getByUsertype(String usertype) {

		return repo.findByUsertype(usertype);

	}

	public User getUserById(int id) {

		return repo.findById(id).get();

	}

	public void updateUserProfile(User u) {

		repo.save(u);

	}

	public Book saveBook(Book b) {

		return bookRepo.save(b);

	}

	public int updateSeat(int seat, int id) {

		return theaterSeatRepo.reduceSeat(seat, id);

	}
	
	public Payment savePayment(Payment p) {
		
		return paymentRepo.save(p);
	}
	
	public List<Book> getOneBookingList(int id){
		
		return bookRepo.getBookingListStatus(id);
		
	}
	
	public Payment PaymentByid(int id) {
		
        return paymentRepo.getPaymentDetailsByid(id);
		
	}
	
	public User saveUserProfile(User user) {
		
		return repo.save(user);
		
	}
	
	public List<Book> findAllBookDetails(int id){
		
		return bookRepo.getAllUserBookingDetails(id);
		
	}

}
