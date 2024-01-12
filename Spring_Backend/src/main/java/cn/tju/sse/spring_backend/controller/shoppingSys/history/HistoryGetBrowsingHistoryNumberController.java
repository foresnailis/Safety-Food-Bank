package cn.tju.sse.spring_backend.controller.shoppingSys.history;

import cn.tju.sse.spring_backend.dto.shoppingSys.history.HistoryGetBrowsingHistoryNumberRequest;
import cn.tju.sse.spring_backend.dto.shoppingSys.history.HistoryGetBrowsingHistoryNumberResponse;
import cn.tju.sse.spring_backend.service.shoppingSys.BrowseManager.HistoryGetBrowsingHistoryNumberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cus/history")
public class HistoryGetBrowsingHistoryNumberController {

    @Autowired
    HistoryGetBrowsingHistoryNumberService historyGetBrowsingHistoryNumberService;

    /**
     * 拉取用户浏览记录数量
     * @param historyGetBrowsingHistoryNumberRequest
     * @return
     */
    @PostMapping("/getBrowsingHistoryNumber")
    public ResponseEntity<?> getBrowsingHistory(@RequestBody HistoryGetBrowsingHistoryNumberRequest historyGetBrowsingHistoryNumberRequest){
        HistoryGetBrowsingHistoryNumberResponse response =historyGetBrowsingHistoryNumberService.getBrowsingHistoryNumberResponse(historyGetBrowsingHistoryNumberRequest.getCus_id());

        return ResponseEntity.ok().body(response);
    }
}