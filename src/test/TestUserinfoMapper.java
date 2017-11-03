package test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.mvcdemo.dao.UserInfoMapper;
import com.neuedu.mvcdemo.model.UserInfo;

public class TestUserinfoMapper {
	private Logger logger = Logger.getRootLogger();
	private ApplicationContext context;
	private SqlSessionFactory sesssionFactory;
	private UserInfoMapper mapper = null;

	@Before
	public void init() {
		String configLocation = "config/applicationContext.xml";
		context = new ClassPathXmlApplicationContext(configLocation);
		sesssionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactory");
	}

	@Test
	public void testaddUserInfo() {
		UserInfo userInfo = new UserInfo("zhangsan", new String[] { "读书", "写字", "玩游戏" }, new Date(), "");

		int  count = sesssionFactory.openSession().getMapper(UserInfoMapper.class).addUserInfo(userInfo);
		if(count>0){
			logger.info("新增成功");
		}else{
			logger.info("新增失败");
		}
		sesssionFactory.openSession().commit();
	}

	@Test
	public void testFindAll() {
		// 得到mapper接口对象
		mapper = sesssionFactory.openSession().getMapper(UserInfoMapper.class);
		List<UserInfo> list = mapper.findAll();
		for (UserInfo userInfo : list) {
			logger.info(userInfo.getUid() + "" + userInfo.getHobbies());
		}
	}// end findAll
}
