package com.neuedu.mvcdemo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.mvcdemo.biz.UserinfoService;
import com.neuedu.mvcdemo.dao.UserInfoMapper;
import com.neuedu.mvcdemo.model.UserInfo;

//@Service 声明为一个服务组件，@Transactional声明需要进行事务控制,spring事务是通过事务切面完成的
@Service
@Transactional
public class UserinfoServiceImpl implements UserinfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public int addUserInfo(UserInfo userInfo) {
		return userInfoMapper.addUserInfo(userInfo);
	}

	@Override
	public List<UserInfo> findAll() {

		return userInfoMapper.findAll();
	}

}
