package com.pammmuse.pammmuse.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderDto {

    private List<OrderItemDto> orders;
}
