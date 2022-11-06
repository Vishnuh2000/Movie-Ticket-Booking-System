package com.MyMovieTicketBookingProject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MyMovieTicketBookingProject.entites.Message;
import com.MyMovieTicketBookingProject.entites.Movie;
import com.MyMovieTicketBookingProject.entites.Payment;
import com.MyMovieTicketBookingProject.entites.Seats;
import com.MyMovieTicketBookingProject.entites.Theater;
import com.MyMovieTicketBookingProject.entites.Time;
import com.MyMovieTicketBookingProject.entites.User;
import com.MyMovieTicketBookingProject.repo.UserRepo;
import com.MyMovieTicketBookingProject.services.AdminServices;
import com.MyMovieTicketBookingProject.services.UserServices;
import com.MyMovieTicketBookingProject.entites.Book;

@Controller
public class Controllers {

	@Autowired
	UserServices uservice;

	@Autowired
	AdminServices adminServices;
	
	
	@GetMapping("/")
	public String index(Model m) {

		List<Movie> li = adminServices.getAllMovies();
		m.addAttribute("movie", li);
		return "index";

	}

	@GetMapping("/login")
	public String Login(Model m) {
		m.addAttribute("user", new User());
		return "Login";

	}

	@GetMapping(value = "/logout")
	public String Logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";

	}

	@GetMapping("/register")
	public String Register(Model m) {

		m.addAttribute("user", new User());
		return "register";

	}

	@PostMapping("/save")
	public String RegisterData(@ModelAttribute("user") User u, Model m) {

		try {

			boolean e = uservice.existsByEmail(u.getEmail());

			if (e) {

				m.addAttribute("errorMessage", "User with this email address is already exists !");
				return "/register";

			} else {

				u.setUsertype("user");
				User user = uservice.RegisterUserData(u);

				if (user != null) {

					return "/Login";

				} else {

					return "/register";
				}

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:/register";

	}

	@PostMapping("/logincheck")
	public String loginCheck(@ModelAttribute("user") User u, @RequestParam String email, @RequestParam String password,
			HttpServletRequest request) {

		User user = uservice.getByEmailAndPassword(email, password);

		if (user!=null) {

			 HttpSession session = request.getSession();
			 session.setAttribute("user", user);

			if (user.getUsertype().equals("admin")) {

				return "redirect:/admin";

			} else {

				return "redirect:/";
			}

		} else {
			
			Message msg = new Message("Invalide Email or Password","error", "alert alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg",msg);
			return "/Login";
		}

	}

	@GetMapping("/profile")
	public String userProfilePage() {
		
		return "profile";

	}
	
	
	@GetMapping("/movieseat")
	public String seatBooking() {
		
		return "movieseat";
		
	}
	
	@GetMapping("/moviebooking/{id}/{t_id}")
	public String MovieBooking(@PathVariable("id") int id , @PathVariable("t_id") int t_id, Model model , HttpServletRequest request, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			
			Movie m = adminServices.movieViewByid(id);
			Theater th = adminServices.TheaterListByid(t_id);
			

			List<Seats> seat  = adminServices.listSeatsById(th.getId());
			model.addAttribute("seat",seat);
		
			List<Time> time   = adminServices.getTime(th.getId());
			model.addAttribute("movie",m);
			
			model.addAttribute("timepick",time);
			System.out.println();
			return "book";
		}
		
		Message m = new Message("You Must Login First!","warning","alert alert-danger");
		HttpSession session2 = request.getSession();
		session2.setAttribute("message", m);
		return "redirect:/login";
		
	}
	
	@PostMapping("/saveBookingItem")
	public String BookMovieItem(Model model,@ModelAttribute("book") Book b , @RequestParam("ticket") int ticket, HttpServletRequest request) {
	    int seatId = Integer.parseInt(request.getParameter("seat"));
		Seats s = adminServices.getseats(seatId);
		int reduce = s.getTotalSeats()-ticket;
		uservice.updateSeat(reduce,seatId);
		Book book = uservice.saveBook(b);
		HttpSession session = request.getSession();
		session.setAttribute("book",book);
		return "redirect:/payment";
		
	}
	
	@GetMapping("/payment")
	public String PaymentMethod(Model m) {
		m.addAttribute("movie", new Movie());
		return "payment";
		
	}
	
	@PostMapping("/paymentSave")
	public String PaymentSaveMethod(@ModelAttribute("payment")Payment p , HttpSession session, Model m , HttpServletRequest request) {
		Book b = (Book) session.getAttribute("book");
		m.addAttribute("book",b);
		uservice.savePayment(p);
		return "redirect:/booking-status";
		
	}
	
	@GetMapping("/booking-status")
	public String getBookingStatus(Model m , HttpSession session) {
		
		User user_id = (User) session.getAttribute("user");
		List<Book> li = uservice.getOneBookingList(user_id.getId());
		m.addAttribute("book",li);
//		m.addAttribute("pay",payment);
		return "bookingStatus";
		
	}
	
	@PostMapping("/updateProfileDetails")
	public String updateProfile(HttpServletRequest request) {
		
		String first = request.getParameter("firstname");
		String last = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
	    HttpSession session  = request.getSession();
	    User user = (User) session.getAttribute("user");
	    user.setFirstname(first);
	    user.setLastname(last);
	    user.setEmail(email);
	    user.setPassword(password);
	    uservice.saveUserProfile(user);
	    return "redirect:/profile";
		
		
	}
	
	@GetMapping("/booking-history")
	public String getAllBookDetails(Model m ,HttpSession session){
		User user =(User) session.getAttribute("user");
		List<Book> li = uservice.findAllBookDetails(user.getId());
		for (Book book : li) {
			
			System.out.println(book.getId());
		}
		m.addAttribute("all_book",li);
		return "bookingHistory";
		
		
	}

}
