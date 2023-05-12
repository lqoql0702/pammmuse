package com.pammmuse.pammmuse.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVo {
    private int id;
    private String username;
    private int product_id;
    private int product_count;
    private String image_url;

    //boo
    private String product_name;
    private int product_price;
    private double product_discount;

    // 추가
    private int sale_price;
    private int total_price;

    public void initSaleTotal() {
        this.sale_price = (int) (this.product_price * (1-this.product_discount));
        this.total_price = this.sale_price*this.product_count;
    }
}
