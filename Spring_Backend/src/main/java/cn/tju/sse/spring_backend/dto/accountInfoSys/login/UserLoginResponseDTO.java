package cn.tju.sse.spring_backend.dto.accountInfoSys.login;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserLoginResponseDTO {
    private String user_type;
    private String message;
    private String user_ID;
    private String satoken;
}
