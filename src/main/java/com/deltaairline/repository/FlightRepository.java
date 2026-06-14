package com.deltaairline.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deltaairline.entity.Flight;

public interface FlightRepository extends JpaRepository<Flight, Integer> {

    List<Flight> findBySourceAndDestination(String source,
                                            String destination);

}