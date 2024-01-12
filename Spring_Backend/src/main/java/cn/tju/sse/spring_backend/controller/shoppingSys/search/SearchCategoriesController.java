package cn.tju.sse.spring_backend.controller.shoppingSys.search;

import cn.tju.sse.spring_backend.dto.cus.search.SearchCategoriesResponseDTO;
import cn.tju.sse.spring_backend.service.cus.search.SearchCategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description 查询平台上所有涉及的商品种类
 * @ClassName SearchCategoriesController
 */
@RestController
@RequestMapping("/api/cus/search")
public class SearchCategoriesController {
    @Autowired
    private SearchCategoriesService searchCategoriesService;

    /**
     * @return 所有商品种类组成的数组
     * @see SearchCategoriesResponseDTO
     */
    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public ResponseEntity<SearchCategoriesResponseDTO> categories(){
        SearchCategoriesResponseDTO responseDTO = searchCategoriesService.categories();
        return new ResponseEntity<>(responseDTO, HttpStatus.OK);
    }
}
