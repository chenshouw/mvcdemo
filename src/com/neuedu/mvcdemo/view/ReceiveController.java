package com.neuedu.mvcdemo.view;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuedu.mvcdemo.model.UserInfo;

/**
 * <pre>
 * 控制器接收数据的几种方式：
 *   1.使用servlet方式接收数据  - receive1 - request.getParameter();
 *   2.使用spirng的参数列表方式接收数据 - public String receive2(int uid,String userName,Model  model)
 *   3.使用spring的类对象方式接收数据 - public String receive3(UserInfo  userInfo,Model  model)
 * 
 * </pre>
 * 
 * @author chensw
 *
 */

@Controller
public class ReceiveController {

	@RequestMapping("/receive3")
	public String receive3(UserInfo userInfo,Model model) {
		// 使用spring的参数列表方式接收数据
		// 手动进行数据封装
		// 使用spring的model进行传递
		model.addAttribute("user", userInfo);
		return "showdata";
	}

	// 使用参数列表接收数据时，可以使用@ RequestParam对参数进行处理
	// value - 用于指定参数的名称,defaultValue-用于设定默认值,required-用于设置必填参数
	//一般的required = true不会与defaultValue同时使用
	@RequestMapping("/receive2")
	public String receive2(@RequestParam(value = "uid", defaultValue = "0") int id,
			@RequestParam(value = "userName", required = true) String userName, Model model) {
		// 使用spring的参数列表方式接收数据
		// 手动进行数据封装
		UserInfo userInfo = new UserInfo(id, userName);
		// 使用spring的model进行传递
		model.addAttribute("user", userInfo);
		return "showdata";
	}

	@RequestMapping("/receive1")
	public String receive1(HttpServletRequest request) {
		// 使用servlet方式接收数据
		String uid = request.getParameter("uid");
		int intUid = 0;
		if (uid != null) {
			intUid = Integer.valueOf(uid);// 手动进行类型转换
		}
		String userName = request.getParameter("userName");
		// 手动进行数据封装
		UserInfo userInfo = new UserInfo(intUid, userName);
		// 使用servlet方式进行传递
		request.setAttribute("user", userInfo);

		return "showdata";
	}
}
