package cn.tju.sse.spring_backend.dto.shoppingSys.search;

import lombok.Getter;
import lombok.Setter;
/**
 * @author lhx
 * @date 2023/12/20
 * @Description 用于获取地理位置远近排序的接口
 */
@Getter
@Setter
public class SendLocationRepositoryDTO {
    Integer sto_id;
    String sto_address;
}
