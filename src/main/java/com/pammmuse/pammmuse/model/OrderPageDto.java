package com.pammmuse.pammmuse.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderPageDto {

    private List<OrderItemDto> orders;
}
