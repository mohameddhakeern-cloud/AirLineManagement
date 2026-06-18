package com.deltaairline.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

import com.deltaairline.interceptor.LoginInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns(
                        "/dashboard",
                        "/addFlight",
                        "/saveFlight",
                        "/viewFlights",
                        "/addPassenger",
                        "/savePassenger",
                        "/viewPassengers",
                        "/addBooking",
                        "/saveBooking",
                        "/viewBookings",
                        "/searchFlight"
                )
                .excludePathPatterns(
                        "/login",
                        "/css/**",
                        "/images/**"
                );

    }

}