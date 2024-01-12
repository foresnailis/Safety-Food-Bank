package cn.tju.sse.spring_backend.repository.accountInfoSys.modifyinformation;

import cn.tju.sse.spring_backend.model.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerModifyRepository extends JpaRepository<CustomerEntity, Integer> {
}
