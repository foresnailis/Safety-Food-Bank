package cn.tju.sse.spring_backend.dto.shoppingSys.favorite;


import cn.tju.sse.spring_backend.service.shoppingSys.FavorManager.CustomerGetFavorService;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/*
返回收藏夹信息的响应
 */
@Getter
@Setter
public class CustomerGetFavorResponse {
    private List<CustomerGetFavorService.FavorPageContent> favor_list;
}
