package cn.tju.sse.spring_backend.repository.appealSys.createAppeal;

import cn.tju.sse.spring_backend.model.ScreenshotEntity;
import cn.tju.sse.spring_backend.model.ScreenshotEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScreenshotRepository extends JpaRepository<ScreenshotEntity, ScreenshotEntityPK> {
}
