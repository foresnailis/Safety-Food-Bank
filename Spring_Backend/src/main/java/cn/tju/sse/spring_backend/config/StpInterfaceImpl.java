package cn.tju.sse.spring_backend.config;

import cn.dev33.satoken.stp.StpInterface;
import cn.tju.sse.spring_backend.repository.accountInfoSys.register.UserRegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义权限加载接口实现类
 */
@Component    // 保证此类被 SpringBoot 扫描，完成 Sa-Token 的自定义权限验证扩展
public class StpInterfaceImpl implements StpInterface {
    @Autowired
    private UserRegisterRepository userRegisterRepository;

    /**
     * 返回一个账号所拥有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {

        List<String> list = new ArrayList<String>();
        if(!userRegisterRepository.existsUsersEntityByUserId((Integer) loginId)) {
            list.add("user.*");
            System.out.println("user role login!  id: "+loginId);
        }else{
            list.add("admin.*");
            System.out.println("admin role login!");
        }

        return list;
    }

    /**
     * 返回一个账号所拥有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
//        同理，直接声明用户角色
        List<String> list = new ArrayList<String>();
        if(!userRegisterRepository.existsUsersEntityByUserId((Integer) loginId)) {
            list.add("user");
        }else{
            list.add("admin");
        }
        return list;
    }

}