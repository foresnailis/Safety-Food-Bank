package cn.tju.sse.spring_backend.dto.appealSys.createAppeal;


import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateAppealRequestDTO {
    Integer app_matters;
    String app_content;
    Integer app_userID;
    Integer user_ID =-1;
    Integer com_ID=-1;
    Integer cmt_ID=-1;
    List<String> sct_images;
}
