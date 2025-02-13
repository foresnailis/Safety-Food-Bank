package cn.tju.sse.spring_backend.repository.accountBalanceSys.balance;

import cn.tju.sse.spring_backend.model.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/*
设置余额接口
 */
public interface CustomerSetBalanceRespository extends JpaRepository<UsersEntity,Integer> {
    /**
     * 查找是否有对应用户
     * @param cus_id 传入用户id
     * @return 返回对应用户
     */
    UsersEntity findUsersEntityByUserId(int cus_id);
}
