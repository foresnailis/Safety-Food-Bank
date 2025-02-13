package cn.tju.sse.spring_backend.service.accountBalanceSys.AccountManager;

import cn.tju.sse.spring_backend.dto.accountBalanceSys.balance.CustomerSetBalanceRequest;
import cn.tju.sse.spring_backend.model.UsersEntity;
import cn.tju.sse.spring_backend.repository.accountBalanceSys.balance.CustomerSetBalanceRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerSetBalanceService {
    @Autowired
    private CustomerSetBalanceRespository customerSetBalanceRespository;
    /**
     * 设置余额
     * @param customerSetBalanceRequest 设置余额请求
     * @return 修改用户的余额，返回是否成功
     */
    public boolean setBalance(CustomerSetBalanceRequest customerSetBalanceRequest){
        int cus_id = customerSetBalanceRequest.getCus_id();
        UsersEntity update_user = customerSetBalanceRespository.findUsersEntityByUserId(cus_id);
        if(update_user==null)
            return false;
        update_user.setUserBalance(customerSetBalanceRequest.getBalance());
        UsersEntity new_user = customerSetBalanceRespository.save(update_user);
        if(new_user!=null)
            return true;
        else
            return false;
    }
}
