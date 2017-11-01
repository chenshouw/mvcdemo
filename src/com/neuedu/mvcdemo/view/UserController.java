package com.neuedu.mvcdemo.view;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.neuedu.mvcdemo.model.UserInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	 //设计一个方法，用于打开注册页面，加载注册必要信息
	@RequestMapping("/toreg")
	public String toReg(){
		return "reguser";
	}
	//设计一个方法，用于用户提交注册信息时，完成注册信息入口功能
	@RequestMapping("/register")
	public ModelAndView doReg( @Validated  UserInfo user,BindingResult br){
		//注册成功，返回success页面
		ModelAndView view = new ModelAndView("success");
		
		if(br.hasErrors()){
			view.addObject("errors", br.getAllErrors());//取出校验错误结果，使用view model发送到jsp页面进行显示
			view.setViewName("reguser");//发生错误后，需要跳转到哪个页面;本例，返回原来的页面
		}else{
			//view.addObject("userinfo", user);
			view.getModel().put("userinfo", user);
		}
		
		return view;
	}
	//信息修改
	//toedit方法用于加载需要编辑的数据
	//edit方法用于保存编辑后的数据
}
