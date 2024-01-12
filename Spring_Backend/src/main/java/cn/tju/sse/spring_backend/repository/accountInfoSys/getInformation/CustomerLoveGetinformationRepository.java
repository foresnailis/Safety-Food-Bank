package cn.tju.sse.spring_backend.repository.accountInfoSys.getInformation;

import cn.tju.sse.spring_backend.model.CustomerLoveEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerLoveGetinformationRepository extends JpaRepository<CustomerLoveEntity, Integer> {
    List<CustomerLoveEntity> findAllByCusId(int id);
}
