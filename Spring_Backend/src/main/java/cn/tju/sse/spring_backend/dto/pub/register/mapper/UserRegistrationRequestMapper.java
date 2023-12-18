package cn.tju.sse.spring_backend.dto.pub.register.mapper;

import cn.tju.sse.spring_backend.dto.pub.register.UserRegistrationRequestDTO;
import cn.tju.sse.spring_backend.model.UsersEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import cn.tju.sse.spring_backend.utils.SecurityUtils;

@Mapper
public interface UserRegistrationRequestMapper {
    UserRegistrationRequestMapper INSTANCE = Mappers.getMapper(UserRegistrationRequestMapper.class);

    @Mapping(target = "userPhone",source = "user_phone")
    //@Mapping(target = "userPassword",expression = "java(SecurityUtils.encodePassword(request.getUser_password()))")
    @Mapping(target = "userAddress",source = "user_address")
    @Mapping(target = "userType",expression = "java(Integer.parseInt(request.getUser_type()))")
    @Mapping(target = "userPassword", ignore = true)
    @Mapping(target = "userState", ignore = true)
    @Mapping(target = "userRegtime", ignore = true)
    @Mapping(target = "userId", ignore = true)
    @Mapping(target = "userBalance", ignore = true)
    UsersEntity requestToEntity(UserRegistrationRequestDTO request);

}
