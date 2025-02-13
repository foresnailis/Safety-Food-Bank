package cn.tju.sse.spring_backend.service.accountInfoSys.StoreManager;

import cn.tju.sse.spring_backend.dto.accountInfoSys.getinformation.StoreImgRequestDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.getinformation.StoreImgResponseDTO;
import cn.tju.sse.spring_backend.repository.accountInfoSys.getInformation.StoreImgRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreImgService {
    @Autowired
    StoreImgRepository storeImgRepository;

    public List<StoreImgResponseDTO> storeImg(StoreImgRequestDTO storeImgRequestDTO){
        try {
            List<StoreImgResponseDTO> responseDTOS = storeImgRepository.storeImg(storeImgRequestDTO.getSto_ID());
            return responseDTOS;
        }catch (Exception err){
            System.out.println(err);
            return null;
        }

    }


}
