package com.example.booking.mapper;

import com.example.booking.dto.RoleDTO;
import com.example.booking.entity.Role;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface RoleMapper {
    @Mapping(target = "roleName", source = "role.name")
    RoleDTO toRoleDTO(Role role);

    @Mapping(target = "name", source = "roleDto.roleName")
    Role toRole(RoleDTO roleDto);

    List<RoleDTO> toRoleDTO(List<Role> listRole);

    List<Role> toRole(List<RoleDTO> listRoleDto);
}
