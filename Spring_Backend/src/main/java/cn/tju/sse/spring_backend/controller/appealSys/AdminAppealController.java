package cn.tju.sse.spring_backend.controller.appealSys;


import cn.tju.sse.spring_backend.dto.appealSys.AppealListResponseDTO;
import cn.tju.sse.spring_backend.service.appealSys.AppealManager.AppealListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class AdminAppealController {
    @Autowired
    private AppealListService appealListService;

    /**
     * 获取申诉列表
     *
     * @param TIME_ORDER 时间排序方式
     * @param BEGIN_NUM  开始位置
     * @param END_NUM    结束位置
     * @return ResponseEntity<List<AppealListResponseDTO>> 包含申诉列表的响应实体
     */
    @GetMapping("/appeallist")
    public ResponseEntity<List<AppealListResponseDTO>> getAppealList(@RequestParam int TIME_ORDER, @RequestParam int BEGIN_NUM, @RequestParam int END_NUM) {
        List<AppealListResponseDTO> response = appealListService.getAppealList(TIME_ORDER, BEGIN_NUM, END_NUM);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
