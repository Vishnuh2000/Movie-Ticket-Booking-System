package com.MyMovieTicketBookingProject.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MyMovieTicketBookingProject.entites.Movie;
import com.MyMovieTicketBookingProject.entites.Seats;
import com.MyMovieTicketBookingProject.entites.Theater;
import com.MyMovieTicketBookingProject.entites.Time;
import com.MyMovieTicketBookingProject.entites.User;
import com.MyMovieTicketBookingProject.services.AdminServices;
import com.google.gson.Gson;

@Controller
public class AdminController {

	@Autowired
	AdminServices adminServices;
	

	@GetMapping("/admin")
	public String AdminHome(Model m) {

		List<User> user = adminServices.getAllUser();

		m.addAttribute("user", user);

		return "admin-head";

	}

	@GetMapping("/movielist")
	public String AddmovieList(Model m) {

		List<Movie> li = adminServices.getAllMovies();
		m.addAttribute("movie",li);
		return "addmovie";

	}
	
	@GetMapping("/addmovies")
	public String Addmovie(Model m)
   
	{
		      List<Theater> theater = adminServices.getTheater();
		      m.addAttribute("theater",theater);
			 
		      m.addAttribute("movies" , new Movie());
			  return "movieform";

	}

	@PostMapping("/savemovies")
	public String Addmovies( @RequestParam("file") MultipartFile file,Model m, @ModelAttribute("movies") Movie movie) {
		
	    adminServices.SavaAllMovies(file, movie);
	    
		return "redirect:/addmovies";
		
		
	}
	
	@GetMapping("/delete/{id}")
	public String removeMovies(@PathVariable("id") int id) {
		
		adminServices.deleteMoviesByid(id);
		
		return "redirect:/movielist";
		
	}
	
	@GetMapping("/view/{id}")
	public String viewMovies(@PathVariable("id") int id , Model model) {
		
		Movie m = adminServices.movieViewByid(id);
		model.addAttribute("movie",m);
		return "movie-view";
		
	}
	
	@GetMapping("/theater-list")
	public String TheaterList(Model m) {
		List<Theater> li = adminServices.getTheater();
		m.addAttribute("theater",li);
		return "Theaterlist";
		
	}
	
	@GetMapping("/addtheater")
	public String AddTheater(Model model) {
		
		model.addAttribute("theater", new Theater());
		
		return "theater";
		
	}
	
	@PostMapping("/saveTheater")
	public String saveTheaterData(@ModelAttribute("th") Theater t) {
		
		adminServices.saveTheater(t);
		
		return "redirect:/theater-list";
		
	}
	
	@GetMapping("/delete-theater/{id}")
	public String removeTheater(@PathVariable("id") int id) {
		
	        adminServices.deleteTheaterById(id);
	        
	        return "redirect:/theater-list";
		
	}
	
	@GetMapping("/theater/{id}")
	public String TheaterByid(@PathVariable("id")int id,Model m) {
		
		Theater theater=adminServices.TheaterById(id);
		List<Seats> seat  = adminServices.listSeatsById(id);
		m.addAttribute("th", theater);
		m.addAttribute("seat",seat);
		return "time";
		
	}
	
	
	
	@GetMapping("/seats")
	public String addTheaterSeats(Model m) {
		List<Theater> li = adminServices.getTheater();
		m.addAttribute("theater",li);
		return "seat";
	}
	
	@GetMapping("/theater-seat/{id}")
	public String TheaterSeatByid(@PathVariable("id")int id,Model m) {
		
		Theater theater=adminServices.TheaterById(id);
		List<Seats> seat  = adminServices.listSeatsById(id);
		m.addAttribute("th", theater);
		m.addAttribute("seat",seat);
		return "addseats";
		
	}
	
	@PostMapping("/saveseats")
	public String addSeat(@ModelAttribute("seat")Seats s) {
		adminServices.saveSeats(s);
		return "redirect:/seats";
	}
	
	@GetMapping("theater-view/{id}")
	public String Theater(@PathVariable("id") int id , Model m) {
		
		Theater theater=adminServices.TheaterById(id);
		m.addAttribute("th", theater);
		m.addAttribute("theater", new Theater());
		return "edit-theater";
		
	}

	@PostMapping("/updateTheater")
	public String updateTheaters(@ModelAttribute("theater") Theater t) {
		
		adminServices.updateTheater(t);
		return "redirect:/theater-list";
		
	}
	
	@GetMapping("/theater-time/{id}")
	public String TheaterTimeByid(@PathVariable("id")int id,Model m) {
		
		Theater theater=adminServices.TheaterById(id);
		List<Time> li = adminServices.getTime(id);
		m.addAttribute("th", theater);
		m.addAttribute("time", li);
		return "time";
	}
	
	@PostMapping("/saveTime")
	public String saveTime(@ModelAttribute("time") Time time , Model m) {
		adminServices.saveTime(time);
		return "redirect:/theater-list";
		
	}
	
	@GetMapping("/edit-movie/{id}")
	public String editMovies(@PathVariable("id") int id,Model model) {
		 List<Theater> li = adminServices.getTheater();
		Movie movie = adminServices.movieViewByid(id);
		model.addAttribute("movie",movie);
		model.addAttribute("theater",li);
		return "edit-movies";
		
	}
	
	@PostMapping("/updateMovie")
	public String updateMovies(@ModelAttribute("movies") Movie m) {
		
	     adminServices.UpdateMovie(m);
	     
	     return "redirect:/addmovies";
		
	}
	
	@GetMapping("/delete/seat/{id}")
	public String deleteSeat(@PathVariable("id") int id) {
		
		adminServices.deleteSeatsById(id);
		return "redirect:/seats";
		
	}
	
	@GetMapping("/delete/time/{id}")
	public String deleteTime(@PathVariable("id") int id) {
		
		adminServices.deleteTimeById(id);
		return "redirect:/theater-list";
		
	}
	



	
  


}
