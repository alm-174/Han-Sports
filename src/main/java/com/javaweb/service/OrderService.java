package com.javaweb.service;

import com.javaweb.domain.Order;
import com.javaweb.domain.OrderDetail;
import com.javaweb.repository.OrderDetailRepository;
import com.javaweb.repository.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> fetchAllOrders(){
        return this.orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id){
        return this.orderRepository.findById(id);
    }

    public void hanldeUpdateOrder(Order order){
        Optional<Order> optCurrentOrder = this.orderRepository.findById(order.getId());
        if(optCurrentOrder.isPresent()){
            Order currentOrder = optCurrentOrder.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public void hanldeDeleteOrder(Order order){
        Optional<Order> optCurrentOrder = this.orderRepository.findById(order.getId());
        if(optCurrentOrder.isPresent()){
            Order currentOrder = optCurrentOrder.get();
            List<OrderDetail>  orderDetails = currentOrder.getOrderDetails();
            for(OrderDetail orderDetail : orderDetails){
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }
        this.orderRepository.deleteById(order.getId());
    }
}
