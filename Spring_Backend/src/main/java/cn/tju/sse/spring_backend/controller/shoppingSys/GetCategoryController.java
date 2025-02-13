package cn.tju.sse.spring_backend.controller.shoppingSys;

import cn.tju.sse.spring_backend.dto.shoppingSys.GetCategoryResponseDTO;
import cn.tju.sse.spring_backend.service.shoppingSys.CustomerManager.GetCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/pub/category")
public class GetCategoryController {
    @Autowired
    private GetCategoryService getCategoryService;
    @RequestMapping(value = "/getcategories",method = RequestMethod.GET)
    public ResponseEntity<GetCategoryResponseDTO> getCategory(){
        GetCategoryResponseDTO response= getCategoryService.GetCategory();
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
