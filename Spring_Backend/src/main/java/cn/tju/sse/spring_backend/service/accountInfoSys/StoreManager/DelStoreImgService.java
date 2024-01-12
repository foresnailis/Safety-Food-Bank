package cn.tju.sse.spring_backend.service.accountInfoSys.StoreManager;

import cn.tju.sse.spring_backend.dto.accountInfoSys.modify.DelStoreImgRequestDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.modify.DelStoreImgResponseDTO;
import cn.tju.sse.spring_backend.repository.accountInfoSys.modifyinformation.DelStoreImgRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DelStoreImgService {
    @Autowired
    private DelStoreImgRepository delStoreImgRepository;
    public DelStoreImgResponseDTO delStoreImg(DelStoreImgRequestDTO delStoreImgRequestDTO){
        DelStoreImgResponseDTO responseDTO=new DelStoreImgResponseDTO();

        Integer successNum=delStoreImgRepository.deleteByStoIdAndAndStoImage(Integer.parseInt(delStoreImgRequestDTO.getSto_ID()), delStoreImgRequestDTO.getUrl());
        if(successNum>0){
            responseDTO.setMessage("success");
            System.out.println("删除成功");
        }else {
            responseDTO.setMessage("删除失败");
            System.out.println("删除失败");
        }
        return responseDTO;
    }
}
