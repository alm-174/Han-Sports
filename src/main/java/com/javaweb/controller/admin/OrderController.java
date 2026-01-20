package com.javaweb.controller.admin;

import com.javaweb.domain.Order;
import com.javaweb.domain.OrderDetail;
import com.javaweb.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderController {
    private OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page") Optional<String> optionalPage){
        int page = 1;
        try{
            if(optionalPage.isPresent()){
                page = Integer.parseInt(optionalPage.get());
            }
        }catch(Exception ex){

        }

        Pageable pageable = PageRequest.of(page-1, 4);
        Page<Order> ods = this.orderService.fetchAllOrders(pageable);
        List<Order> listOrders =  ods.getContent();
        model.addAttribute("orders", listOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ods.getTotalPages());
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

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrder(Model model, @PathVariable long id){
        Optional<Order> order = this.orderService.fetchOrderById(id);
        if(order.isPresent()){
            model.addAttribute("newOrder", order.get());
        }
        return  "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(Model model, @ModelAttribute("newOrder") Order order){
        this.orderService.hanldeUpdateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrder(Model model, @PathVariable long id){
        Optional<Order> order = this.orderService.fetchOrderById(id);
        if(order.isPresent()){
            model.addAttribute("newOrder", order.get());
            model.addAttribute("id", id);
        }
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(Model model, @ModelAttribute("newOrder") Order order){
        this.orderService.hanldeDeleteOrder(order);
        return "redirect:/admin/order";
    }
}
