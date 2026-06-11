package com.deltaairline.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.deltaairline.entity.Flight;

public interface FlightRepository extends JpaRepository<Flight, Integer> {

}