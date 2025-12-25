package com.example.monorepo.auth_service.controller;

import com.example.common.dtos.ApiResponse;
import com.example.common.services.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class AuthController {
    private final MessageService messageService;

    @GetMapping
    public ApiResponse auth(@RequestParam String receiptian) {
        return new ApiResponse(messageService.send(receiptian) + " from Auth Service");
    }
}