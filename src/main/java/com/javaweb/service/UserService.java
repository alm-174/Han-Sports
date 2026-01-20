package com.javaweb.service;

import com.javaweb.domain.Role;
import com.javaweb.domain.User;
import com.javaweb.domain.dto.RegisterDTO;
import com.javaweb.repository.OrderRepository;
import com.javaweb.repository.ProductRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, ProductRepository productRepository, OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
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

    public Page<User> findAll(Pageable pageable){
        return this.userRepository.findAll(pageable);
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

    public User registerDTOtoUser(RegisterDTO registerDTO){
        User user = new User();
        user.setFullName(registerDTO.getFirstName() +  registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

}
