package com.deltaairline.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.deltaairline.entity.Booking;
import com.deltaairline.entity.User;

public interface BookingRepository extends JpaRepository<Booking, Integer> {

    List<Booking> findByUser(User user);

    long countByUser(User user);

    long countByUserAndStatus(User user, String status);

    // Returns all booked seat numbers for a flight
    @Query("""
            SELECT b.seatNumber
            FROM Booking b
            WHERE b.flight.id = :flightId
            AND b.status='CONFIRMED'
            """)
    List<String> findBookedSeatsByFlightId(int flightId);

}