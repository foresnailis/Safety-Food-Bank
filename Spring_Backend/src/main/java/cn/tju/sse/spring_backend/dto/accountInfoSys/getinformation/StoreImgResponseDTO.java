package cn.tju.sse.spring_backend.dto.accountInfoSys.getinformation;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreImgResponseDTO {
    private String imgURL;

    public StoreImgResponseDTO(String imgURL){
        this.setImgURL(imgURL);
    }
}
