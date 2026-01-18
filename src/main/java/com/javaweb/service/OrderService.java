package com.javaweb.service;

import com.javaweb.domain.Order;
import com.javaweb.repository.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> fetchAllOrders(){
        return this.orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id){
        return this.orderRepository.findById(id);
    }
}
