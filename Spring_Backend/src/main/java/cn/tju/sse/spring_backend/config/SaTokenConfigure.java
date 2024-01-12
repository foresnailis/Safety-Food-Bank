package cn.tju.sse.spring_backend.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {
    // 注册 Sa-Token 拦截器，打开注解式鉴权功能
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器，打开注解式鉴权功能
        registry.addInterceptor(new SaInterceptor(handler -> {
            // 角色校验 -- 拦截以 api/sto 或者 api/cus 开头的路由，必须具备 admin 角色或者 user 角色才可以通过认证
            SaRouter.match("/api/sto/**", r ->{
                System.out.println("商家权限校验ing...");
                StpUtil.checkRoleOr("admin", "user");
            });
            SaRouter.match("/api/cus/**", r ->{
                System.out.println("顾客权限校验ing...");
                StpUtil.checkRoleOr("admin", "user");
            });

            // 管理员角色校验
            SaRouter.match("/api/admin/**", r -> {
                StpUtil.checkRole("admin");
                System.out.println("管理员权限校验ing...");
            });


        }))
                .addPathPatterns("/**")
                .excludePathPatterns("/api/cus/search/getLocationSort")
                .excludePathPatterns("/api/cus/recommendation")
                .excludePathPatterns("/api/cus/search/sendLocation"); ;
    }
}