package cn.tju.sse.spring_backend.controller.shoppingSys;

import cn.tju.sse.spring_backend.dto.shoppingSys.GetMessageResponseDTO;
import cn.tju.sse.spring_backend.dto.shoppingSys.UserIDRequestDTO;
import cn.tju.sse.spring_backend.service.shoppingSys.CustomerManager.GetRecommendationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/cus/recommendation")
public class RecommendationController {
    @Autowired
    private GetRecommendationService getRecommendationService;
    @RequestMapping (method = RequestMethod.POST)
    public ResponseEntity<GetMessageResponseDTO> getRecommendation(@RequestBody UserIDRequestDTO request) throws IOException {
        GetMessageResponseDTO response= getRecommendationService.getRecommendation(request);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
