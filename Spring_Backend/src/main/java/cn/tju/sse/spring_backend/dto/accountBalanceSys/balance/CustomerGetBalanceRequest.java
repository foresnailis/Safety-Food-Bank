package cn.tju.sse.spring_backend.dto.accountBalanceSys.balance;

import lombok.Getter;
import lombok.Setter;

/*
获取余额请求
 */
@Getter
@Setter
public class CustomerGetBalanceRequest {
    private Integer cus_id;
}
