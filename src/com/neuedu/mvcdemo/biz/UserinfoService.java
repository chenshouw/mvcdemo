package com.neuedu.mvcdemo.biz;

import java.util.List;

import com.neuedu.mvcdemo.model.UserInfo;

public interface UserinfoService {

	public int addUserInfo(UserInfo userInfo);

	public List<UserInfo> findAll();
}
