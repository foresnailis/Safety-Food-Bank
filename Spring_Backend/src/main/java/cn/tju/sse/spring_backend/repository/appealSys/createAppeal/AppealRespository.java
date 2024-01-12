package cn.tju.sse.spring_backend.repository.appealSys.createAppeal;

import cn.tju.sse.spring_backend.model.AppealEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppealRespository extends JpaRepository<AppealEntity, Integer> {

}
