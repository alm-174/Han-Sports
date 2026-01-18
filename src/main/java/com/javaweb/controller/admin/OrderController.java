package com.javaweb.controller.admin;

import com.javaweb.domain.Order;
import com.javaweb.domain.OrderDetail;
import com.javaweb.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderController {
    private OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model){
        List<Order> orders = this.orderService.fetchAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getDetailOrder(Model model, @PathVariable long id){
        Optional<Order> order = this.orderService.fetchOrderById(id);
        if(order.isPresent()){
            List<OrderDetail> orderDetails = order.get().getOrderDetails();
            model.addAttribute("orderDetails", orderDetails);
        }
        return "admin/order/detail";
    }
}
