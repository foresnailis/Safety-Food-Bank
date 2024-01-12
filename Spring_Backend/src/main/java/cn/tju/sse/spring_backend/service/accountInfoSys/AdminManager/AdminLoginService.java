package cn.tju.sse.spring_backend.service.accountInfoSys.AdminManager;

import cn.tju.sse.spring_backend.repository.accountInfoSys.accountManagement.AdminRepository;
import cn.tju.sse.spring_backend.repository.accountInfoSys.accountManagement.UserListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理员登录使用
 */
@Service
public class AdminLoginService {
    @Autowired
    private AdminRepository adminRepository;
    public void adminLogin(){

    }
}
