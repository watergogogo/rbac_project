create database if not exists rbac_project;

use rbac_project;

create table if not exists user(
    id BIGINT not null auto_increment comment '用户主键' primary key ,
    username varchar(256) not null comment '用户名称',
    password varchar(256) not null comment '用户密码',
    phoneNumber varchar(128) null comment '用户手机号码',
    createTime DATETIME DEFAULT current_timestamp not null comment '创建时间',
    updateTime DATETIME DEFAULT current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT DEFAULT 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '用户信息表';

create table if not exists role(
    id BIGINT not null auto_increment comment '角色主键' primary key ,
    roleName varchar(256) not null comment '角色名称',
    roleDesc varchar(256) comment '角色描述',
    createTime DATETIME default current_timestamp not null comment '创建时间',
    updateTime DATETIME default current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT default 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '角色信息表';

create table if not exists permission(
    id BIGINT not null auto_increment comment '权限主键' primary key ,
    permissionName varchar(256) not null comment '权限名称',
    permissionDesc varchar(256) comment '权限描述',
    createTime DATETIME default current_timestamp not null comment '创建时间',
    updateTime DATETIME default current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT default 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '权限信息表';

create table if not exists user_role(
    id bigint not null auto_increment comment '用户角色关系表主键' primary key,
    userId bigint not null comment '用户id',
    roleId bigint not null comment '角色id',
    foreign key (userId) references user(id),
    foreign key (roleId) references role(id),
    createTime DATETIME default current_timestamp not null comment '创建时间',
    updateTime DATETIME default current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT default 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '用户角色关系表';

create table if not exists role_permission(
    id bigint not null auto_increment comment '角色权限关系表主键' primary key ,
    roleId bigint not null comment '角色id',
    permissionId bigint not null comment '权限id',
   foreign key (roleId) references role(id),
    foreign key (permissionId) references permission(id),
    createTime DATETIME default current_timestamp not null comment '创建时间',
    updateTime DATETIME default current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT default 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '角色权限关系表';

create table if not exists fire_facility(
    id bigint not null auto_increment comment '消防设备主键' primary key ,
    facilityName varchar(256) not null comment '消防设备名称',
    location varchar(512) not null comment '消防设备所在地',
    type varchar(128) not null comment '消防设备类型',
    manufacturer varchar(256) comment '消防设备制造商',
    model varchar(256) comment '消防设备型号',
    capacity int comment '消防设备容量',
    installationDate datetime comment '消防设备安装日期',
    lastInspectionDate DATETIME comment '上次巡检日期',
    isActive boolean default true comment '消防设施启用状态',
    createTime DATETIME default current_timestamp not null comment '创建时间',
    updateTime DATETIME default current_timestamp on update current_timestamp not null comment '更新时间',
    isDelete TINYINT default 0 not null comment '是否删除（0-未删除， 1-已删除）'
)comment '消防设备信息表';
