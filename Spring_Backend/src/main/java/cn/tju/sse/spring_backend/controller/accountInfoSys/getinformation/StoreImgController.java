package cn.tju.sse.spring_backend.controller.accountInfoSys.getinformation;


import cn.tju.sse.spring_backend.dto.pub.getinformation.StoreImgRequestDTO;
import cn.tju.sse.spring_backend.dto.pub.getinformation.StoreImgResponseDTO;
import cn.tju.sse.spring_backend.service.accountInfoSys.getinformation.StoreImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/pub/getinformation")
public class StoreImgController {

    @Autowired
    StoreImgService storeImgService;
    @GetMapping("/storeimg")
    public ResponseEntity<?> storeimg(@RequestParam String sto_ID){
        List<StoreImgResponseDTO> response = storeImgService.storeImg(new StoreImgRequestDTO(sto_ID));
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
