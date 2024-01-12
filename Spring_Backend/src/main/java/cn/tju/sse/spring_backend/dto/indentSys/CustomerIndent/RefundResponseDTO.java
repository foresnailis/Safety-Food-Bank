package cn.tju.sse.spring_backend.dto.indentSys.CustomerIndent;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Setter
@Getter
public class RefundResponseDTO {
    BigDecimal price_return;
    BigDecimal balance;
}
