package cn.tju.sse.spring_backend.repository.accountInfoSys.getInformation;

import cn.tju.sse.spring_backend.model.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerGetinformationRepository extends JpaRepository<CustomerEntity, Integer> {
    boolean existsByCusId(int id);
}
