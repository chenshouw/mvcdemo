package com.neuedu.mvcdemo.dao;

import java.util.List;

import com.neuedu.mvcdemo.model.UserInfo;

public interface UserInfoMapper {

	public int addUserInfo(UserInfo userInfo);
	
	public List<UserInfo> findAll();
	
	//.....
}
