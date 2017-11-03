package test;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neuedu.mvcdemo.biz.UserinfoService;
import com.neuedu.mvcdemo.model.UserInfo;

public class TestUserinfoService {
	private Logger logger = Logger.getRootLogger();
	private ApplicationContext context;
	private UserinfoService service = null;

	@Before
	public void init() {
		String configLocation = "config/applicationContext.xml";
		context = new ClassPathXmlApplicationContext(configLocation);
	}

	@Test
	public void testFindAll() {
		// 得到service接口对象
		service = context.getBean(UserinfoService.class);
		List<UserInfo> list = service.findAll();
		for (UserInfo userInfo : list) {
			logger.info(userInfo.getUid() + "" + userInfo.getHobbies());
		}
	}// end findAll

	@Test
	public void testaddUserInfo() {
		UserInfo userInfo = new UserInfo("zhangsan", new String[] { "读书", "写字", "玩游戏" }, new Date(), "");
		service = context.getBean(UserinfoService.class);
		int count = service.addUserInfo(userInfo);
		if (count > 0) {
			logger.info("新增成功");
		} else {
			logger.info("新增失败");
		}
	}
}
