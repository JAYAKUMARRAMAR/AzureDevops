package com.example.currency_exchange.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class currencyExchange
{
    @GetMapping("/")
    public String geName()
    {
      return "Hello Jayakumar MCA";
    }
}