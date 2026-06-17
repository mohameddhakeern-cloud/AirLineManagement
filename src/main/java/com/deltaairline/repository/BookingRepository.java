package com.deltaairline.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.deltaairline.entity.Booking;

public interface BookingRepository
extends JpaRepository<Booking,Integer>{

}