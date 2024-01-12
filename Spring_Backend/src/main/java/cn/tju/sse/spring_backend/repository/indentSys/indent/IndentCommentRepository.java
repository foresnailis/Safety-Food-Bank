package cn.tju.sse.spring_backend.repository.indentSys.indent;

import cn.tju.sse.spring_backend.model.CommodityCategoriesEntityPK;
import cn.tju.sse.spring_backend.model.CommodityCommentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IndentCommentRepository extends JpaRepository<CommodityCommentEntity, CommodityCategoriesEntityPK> {
}
