package com.deltaairline.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.deltaairline.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByEmail(String email);

    User findByEmailAndPassword(String email, String password);
    
    User findById(int id);

}