package com.javaweb.repository;


import com.javaweb.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    List<User> findAll();
    void deleteById(long id);
    boolean existsByEmail(String email);
    Page<User> findAll(Pageable pageable);
    User findByEmail(String email);
}
