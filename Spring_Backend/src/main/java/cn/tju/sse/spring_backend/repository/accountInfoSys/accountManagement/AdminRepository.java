package cn.tju.sse.spring_backend.repository.accountInfoSys.accountManagement;


import cn.tju.sse.spring_backend.model.AdministratorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * 管理员登录用
 */
public interface AdminRepository extends JpaRepository<AdministratorEntity,Integer> {
    public Optional<AdministratorEntity> findByAdminPassword(String password);
}
