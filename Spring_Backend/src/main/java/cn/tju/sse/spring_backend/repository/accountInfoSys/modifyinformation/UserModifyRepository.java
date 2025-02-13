package cn.tju.sse.spring_backend.repository.accountInfoSys.modifyinformation;


import cn.tju.sse.spring_backend.model.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserModifyRepository extends JpaRepository<UsersEntity, Integer> {
    boolean existsByUserId(int id);
}
