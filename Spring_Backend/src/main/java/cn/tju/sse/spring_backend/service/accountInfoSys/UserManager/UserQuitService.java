package cn.tju.sse.spring_backend.service.accountInfoSys.UserManager;

import cn.dev33.satoken.stp.StpUtil;
import cn.tju.sse.spring_backend.dto.accountInfoSys.login.UserQuitRequestDTO;
import cn.tju.sse.spring_backend.model.UsersEntity;
import cn.tju.sse.spring_backend.repository.accountInfoSys.register.UserRegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserQuitService {
    @Autowired
    private UserRegisterRepository userRegisterRepository;

    public String userQuit(UserQuitRequestDTO request){
        if(StpUtil.getRoleList().get(0)=="admin"){
            // 管理员下线
            StpUtil.logout(StpUtil.getLoginId());
            return "success";
        }
        StpUtil.getLoginId();
        Optional<UsersEntity> usersEntity=userRegisterRepository.findById(Integer.parseInt(request.getUser_ID()));
        usersEntity.get().setUserState(0);

        if (userRegisterRepository.save(usersEntity.get())!=null) {
            StpUtil.logout();
            System.out.println(request.getUser_ID()+" success logout");
            return "success";
        }else{
            return "退出登录异常";
        }

    }
}
