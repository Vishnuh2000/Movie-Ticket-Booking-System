package com.MyMovieTicketBookingProject.entites;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="screen_time")
public class Time {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String showTime;
	private String ShowName;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Theater th;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getShowTime() {
		return showTime;
	}

	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}

	public String getShowName() {
		return ShowName;
	}

	public void setShowName(String showName) {
		ShowName = showName;
	}

	public Theater getTh() {
		return th;
	}

	public void setTh(Theater th) {
		this.th = th;
	}
	
	
}
