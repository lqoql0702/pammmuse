package com.pammmuse.pammmuse.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {

    /* 검색 타입 */
    private String type;

    /* 검색 키워드 */
    private String keyword;

    /* 카테고리 */
    private String cate_code;

    /* 검색 타입 데이터 배열 변환 */
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }

}
