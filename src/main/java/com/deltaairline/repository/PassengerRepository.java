package com.deltaairline.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.deltaairline.entity.Passenger;

public interface PassengerRepository extends JpaRepository<Passenger, Integer> {

}