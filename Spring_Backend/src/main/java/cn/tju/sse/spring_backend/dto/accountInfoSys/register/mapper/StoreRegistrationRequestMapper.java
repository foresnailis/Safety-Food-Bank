package cn.tju.sse.spring_backend.dto.accountInfoSys.register.mapper;

import cn.tju.sse.spring_backend.dto.accountInfoSys.register.StoreRegistrationRequestDTO;
import cn.tju.sse.spring_backend.model.StoreEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;


@Mapper
public interface StoreRegistrationRequestMapper {
    StoreRegistrationRequestMapper INSTANCE= Mappers.getMapper(StoreRegistrationRequestMapper.class);

    @Mapping(target="stoId",source="sto_ID")
    @Mapping(target = "stoName",source = "sto_name")
    @Mapping(target = "stoIntroduction",source = "sto_introduction")
    @Mapping(target = "stoLicenseimg",ignore = true)
    @Mapping(target = "stoState",ignore = true)
    StoreEntity requestToEntity(StoreRegistrationRequestDTO request);

}
