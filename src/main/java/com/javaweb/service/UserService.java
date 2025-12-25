package com.javaweb.service;

import com.javaweb.domain.Role;
import com.javaweb.domain.User;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;

    public UserService(UserRepository userRepository,  RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User createUser(User user){

        return userRepository.save(user);
    }

    public Role getRoleByName(String name){
        return roleRepository.findByName(name);
    }

    public List<User> findAll(){
        return this.userRepository.findAll();
    }

    public Optional<User> fetchUserById(Long id){
        return this.userRepository.findById(id);
    }

    public void handleSaveUser(User user){
        this.userRepository.save(user);
    }

    public void  handleDeleteUserById(long ìd){
        this.userRepository.deleteById(ìd);
    }
}
