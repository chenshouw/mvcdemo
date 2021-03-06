package com.neuedu.mvcdemo.view;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.neuedu.mvcdemo.biz.UserinfoService;
import com.neuedu.mvcdemo.model.UserInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger logger = Logger.getRootLogger();
	@Autowired
	private UserinfoService userinfoService;

	// 使用restful编程可以进行多个参数的传递
	@RequestMapping(value = "/find/{op}/{type}", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String findAllUser(@PathVariable("op") String op, @PathVariable("type") Integer type) {
		Gson gson = new Gson();//
		if ("all".equals(op)) {
			
			Type t = new TypeToken<List<UserInfo>>() {  }.getType();  
	        //List<UserInfo> beanOnes = gson.fromJson(jsonString, t); 
	        
			List<UserInfo> list = userinfoService.findAll();
			
			
			String jsonString = gson.toJson(list,t);
			return jsonString;
		} else {
			UserInfo userInfo = new UserInfo(3, "Jack");
			String jsonString = gson.toJson(userInfo);
			return jsonString;
		}
	}// end find

	@RequestMapping("/checkuser")
	@ResponseBody
	public String checkUser(UserInfo userInfo) {
		logger.info("checkUser ================= " + userInfo.getUserName());

		return "{\"success\":\"true\"}";// 返回json格式的字符串
	}

	// 设计一个方法，用于打开注册页面，加载注册必要信息
	@RequestMapping("/toreg")
	public String toReg() {
		return "reguser";
	}

	// 设计一个方法，用于用户提交注册信息时，完成注册信息入口功能
	@RequestMapping("/register")
	public ModelAndView doReg(HttpServletRequest request, @Validated UserInfo user, BindingResult br,
			MultipartFile file1) throws IllegalStateException, IOException {
		// 注册成功，返回success页面
		ModelAndView view = new ModelAndView("success");

		if (br.hasErrors()) {
			view.addObject("errors", br.getAllErrors());// 取出校验错误结果，使用view
														// model发送到jsp页面进行显示
			view.setViewName("reguser");// 发生错误后，需要跳转到哪个页面;本例，返回原来的页面
		} else {
			// view.addObject("userinfo", user);
			view.getModel().put("userinfo", user);
			// 处理文件上传
			// 原始名称
			String originalFilename = file1.getOriginalFilename();
			if (file1 != null && originalFilename != null && originalFilename.length() > 0) {
				// 存储图片的物理路径
				String basePath = request.getServletContext().getRealPath("/uploads");
				// 新的图片名称-- 使用UUID算法解决文件名重复问题
				String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
				// 新图片
				File newFile = new File(basePath + File.separatorChar + newFileName);
				// 将内存的数据写入磁盘
				file1.transferTo(newFile);
				// 将新图片名称写到users中
				user.setHeadURL("uploads/" + newFileName);

				int count = userinfoService.addUserInfo(user);
				if (count > 0) {
					view.setViewName("redirect:/user/find/all/1");// 重定向到查询列表
				}
			}
		}
		return view;
	}
	// 信息修改
	// toedit方法用于加载需要编辑的数据
	// edit方法用于保存编辑后的数据
}
