package cn.tju.sse.spring_backend.controller.accountInfoSys.login;

import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import cn.tju.sse.spring_backend.dto.accountInfoSys.accountManagement.AdminLoginRequestDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.login.UserLoginRequestDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.login.UserLoginResponseDTO;
import cn.tju.sse.spring_backend.dto.accountInfoSys.login.UserQuitRequestDTO;
import cn.tju.sse.spring_backend.service.accountInfoSys.UserManager.UserLoginService;
import cn.tju.sse.spring_backend.service.accountInfoSys.UserManager.UserQuitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/pub/login")
public class UserLoginController {
    @Autowired
    private UserLoginService userLoginService;
    @Autowired
    private UserQuitService userQuitService;
    @RequestMapping(value="",method = RequestMethod.POST)
    @ResponseBody
    public SaResult userLogin(@RequestBody UserLoginRequestDTO request){
        UserLoginResponseDTO response =userLoginService.UserLogin(request);
        if(response.getMessage().equals("success")){

            // 将login方法下降到service层调用
//            StpUtil.login(request.getUser_ID_phonenumber());
            System.out.println(request.getUser_ID_phonenumber()+" Success login");
            return SaResult.ok("success").setData(response);

        }
        return SaResult.error(response.getMessage());
    }
    @RequestMapping(value="/quit",method = RequestMethod.POST)
    public SaResult userQuit(@RequestBody UserQuitRequestDTO request){
        String log= userQuitService.userQuit(request);
        if(log.equals("success")){
            return SaResult.ok("success").setMsg("success");
        }
        else {
            return SaResult.error("登录失败");
        }
    }


    // 传送锚点
    // 管理员登录
    @RequestMapping(value="admin",method = RequestMethod.POST)
    @ResponseBody
    public SaResult adminLogin(@RequestBody AdminLoginRequestDTO request){
        Boolean response =userLoginService.adminLogin(request);
        if(response.equals(true)){
            System.out.println("admin success login");
            return SaResult.ok("success");
        }
        return SaResult.error("false");
    }
}
