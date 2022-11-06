package com.MyMovieTicketBookingProject.entites;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "seats")
public class Seats {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String category;
	private float cost;
	private int totalSeats;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Theater th;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public int getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}

	public Theater getTh() {
		return th;
	}

	public void setTh(Theater th) {
		this.th = th;
	}
	
	
	
}
