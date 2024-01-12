package cn.tju.sse.spring_backend.controller.accountInfoSys.getinformation;

import cn.tju.sse.spring_backend.dto.accountInfoSys.getinformation.CustomerGetinformationRequestDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.getinformation.CustomerGetinformationResponseDTO;
import cn.tju.sse.spring_backend.service.accountInfoSys.CustomerManager.CustomerGetinformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * @ClassName CustomerGetinformationController
 * @Description 控制类，返回顾客基本信息
 * @Author RaoJi
 */
@RestController
@RequestMapping("/api/pub/getinformation")
public class CustomerGetinformationController {
    @Autowired
    private CustomerGetinformationService customerGetinformationService;

    /**
     *
     * @param cus_ID - 顾客id
     * @return id对应的顾客信息
     * @see CustomerGetinformationResponseDTO
     */
    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public ResponseEntity<CustomerGetinformationResponseDTO> customerGetinformation
            (@RequestParam String cus_ID){
        CustomerGetinformationRequestDTO request = new CustomerGetinformationRequestDTO();
        request.setCus_ID(cus_ID);
        CustomerGetinformationResponseDTO response =
                customerGetinformationService.CustomerGetinformation(request);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
