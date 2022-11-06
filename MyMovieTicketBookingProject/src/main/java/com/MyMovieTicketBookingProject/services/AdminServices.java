package com.MyMovieTicketBookingProject.services;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.MyMovieTicketBookingProject.entites.Book;
import com.MyMovieTicketBookingProject.entites.Movie;
import com.MyMovieTicketBookingProject.entites.Seats;
import com.MyMovieTicketBookingProject.entites.Theater;
import com.MyMovieTicketBookingProject.entites.Time;
import com.MyMovieTicketBookingProject.entites.User;
import com.MyMovieTicketBookingProject.repo.MovieRepo;
import com.MyMovieTicketBookingProject.repo.TheaterRepo;
import com.MyMovieTicketBookingProject.repo.TheaterSeatRepo;
import com.MyMovieTicketBookingProject.repo.TimeRepo;
import com.MyMovieTicketBookingProject.repo.UserRepo;

@Service
public class AdminServices {

	@Autowired
	UserRepo userRepo;

	@Autowired
	MovieRepo movieRepo;

	@Autowired
	TheaterRepo theaterRepo;
	
	@Autowired
	TheaterSeatRepo theaterSeatRepo;
	
	@Autowired
	TimeRepo timeRepo;
	
	
	

	public List<User> getAllUser() {

		return userRepo.findAll();

	}

	public Movie SavaAllMovies(MultipartFile file, Movie m) {

		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if (fileName.contains("..")) {

			System.out.println("Not a valid image");
		}

		try {
			m.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return movieRepo.save(m);
	}

	public List<Movie> getAllMovies() {

		return movieRepo.findAll();

	}

	public int deleteMoviesByid(int id) {

	   return movieRepo.deleteMoviesById(id);

	}

	public Movie movieViewByid(int id) {

		return movieRepo.findById(id).get();

	}

	public Theater saveTheater(Theater t) {

		return theaterRepo.save(t);

	}

	public List<Theater> getTheater() {

		return theaterRepo.findAll();

	}

	public void deleteTheaterById(int id) {

		theaterRepo.deleteById(id);

	}

	public Theater TheaterById(int id) {

		return theaterRepo.findById(id).get();
	}

	
	
//	public Theater TheaterSeatsById(int id) {
//
//	
//		return theaterRepo.findById(id).get();
//		
//		
//	}

	public Seats saveSeats(Seats s) {

		return theaterSeatRepo.save(s);
	}

	public List<Seats> listSeatsById(int id) {

		return theaterSeatRepo.findAllSeatById(id);
	}
	
	public List<Seats> seatList(){
		
		 return theaterSeatRepo.findAll();
		
	}
	
	public Theater updateTheater(Theater t) {
		
		return theaterRepo.save(t);
		
	}
	
	public Time saveTime(Time time) {
		
		return timeRepo.save(time);
		
	}
	
	public List<Time> getTime(int id){
		
		return timeRepo.getTimeSchedule(id);
		
	}
	
	public Theater TheaterListByid(int id){
		
		return theaterRepo.getById(id);
	}
	
	public Seats getseats(int id) {
		
		return theaterSeatRepo.findById(id).get();
	}
	
	
	
      public List<Seats> getSeatListById(int id){
		
		return theaterSeatRepo.findAllSeat(id);
		
	}
      
      public Movie UpdateMovie(Movie m) {
    	  
    	  return movieRepo.save(m);
    	  
      }
      
      public int deleteSeatsById(int id) {
    	  
    	  return theaterSeatRepo.deleteSeatById(id);
    	  
      }
      
      public void deleteTimeById(int id) {
    	  
    	 timeRepo.deleteTimeById(id);
    	  
      }
      
 
	

}
