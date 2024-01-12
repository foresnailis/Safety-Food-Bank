package cn.tju.sse.spring_backend.repository.shoppingSys.commodity;

import cn.tju.sse.spring_backend.model.CommodityEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author raoji
 * @date 2023/12/17
 * @Description
 */
public interface CommodityShoppingCartCommodityRepository extends JpaRepository<CommodityEntity, Integer> {

}
