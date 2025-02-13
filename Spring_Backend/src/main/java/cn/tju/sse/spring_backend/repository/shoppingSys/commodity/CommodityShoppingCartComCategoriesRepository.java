package cn.tju.sse.spring_backend.repository.shoppingSys.commodity;

import cn.tju.sse.spring_backend.model.CommodityCategoriesEntity;
import cn.tju.sse.spring_backend.model.CommodityCategoriesEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author raoji
 * @date 2023/12/17
 * @Description
 */
public interface CommodityShoppingCartComCategoriesRepository extends JpaRepository<CommodityCategoriesEntity, CommodityCategoriesEntityPK> {
    List<CommodityCategoriesEntity> findByComId(int com_id);
}
