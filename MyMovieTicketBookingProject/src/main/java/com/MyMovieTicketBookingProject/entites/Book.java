package com.MyMovieTicketBookingProject.entites;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bookmovie")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String date;
	private String ticket;
	private String totalAmount;
	
	
	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	@OneToOne(cascade = CascadeType.ALL)
	
	private Movie movie;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Theater theater;
	
	
	@OneToOne(cascade = CascadeType.ALL)
	private Seats seat;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "Time")
	private Time time;
	
	@OneToOne(cascade = CascadeType.ALL)
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Theater getTheater() {
		return theater;
	}

	public void setTheater(Theater theater) {
		this.theater = theater;
	}


	public Seats getSeat() {
		return seat;
	}

	public void setSeat(Seats seat) {
		this.seat = seat;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}
	
	
	
	
}
