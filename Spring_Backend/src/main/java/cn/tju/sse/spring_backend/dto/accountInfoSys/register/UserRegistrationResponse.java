package cn.tju.sse.spring_backend.dto.accountInfoSys.register;


import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserRegistrationResponse {
    private String user_ID;
    private String user_type;
    private String message;
}
