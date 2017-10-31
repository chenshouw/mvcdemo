package com.neuedu.mvcdemo.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * spring Contrallor的方法一般有3种返回值类型：String,void,ModelAndView
 * 
 * @author chensw
 */
@Controller
public class HelloContrallor {
	private Logger logger = Logger.getRootLogger();

	@RequestMapping("/hello")
	public String sayHello() {
		logger.info("sayHello....");
		return "hellosmvc";// 使用jsp页面的名称进行返回
	}

	@RequestMapping("/hello6")
	public void sayHello6(HttpServletResponse response) throws IOException {
		logger.info("sayHello6....");
		// spring mvc默认的跳转方式是请求转发，本例使用servlet方式实现重定向功能
		response.sendRedirect("index.jsp");// 注意：重定向时，返回的地址是完整的url地址
	}

	@RequestMapping("/hello7")
	public String sayHello7() throws IOException {
		logger.info("sayHello7....");
		// spring mvc默认的跳转方式是请求转发，本例使用servlet方式实现重定向功能
		return "redirect:index.jsp";
	}
    
	//@ResponseBody返回指定的字符串
	@RequestMapping("/hello9")
	@ResponseBody
	public String sayHello9() throws IOException {
		logger.info("sayHello9....");
		// spring mvc默认的跳转方式是请求转发，本例使用servlet方式实现重定向功能
		return "{\"result\":success}";
	}

	@RequestMapping("/hello8")
	public void sayHello8(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 使用servlet方式实现请求转发
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	@RequestMapping("/hello5")
	public void sayHello5(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("使用reponse对象返回数据到浏览器或客户端");
		response.getWriter().close();
	}

	// 在方法中使用HttpServletRequest参数，参数由spring进行注入
	@RequestMapping("/hello4")
	public String sayHello4(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("sayHello4....");
		request.setAttribute("msg", "我来自sayHello4");// spring默认使用请求转发方式进行页面跳转，可以使用request对象进行数据传递
		session.setAttribute("msg2", "我来自sayHello4");
		return "hellosmvc";// 使用jsp页面的名称进行返回
	}

	// 在Contrallor中，可以使用Model向页面传递数据
	@RequestMapping("/hello3")
	public String sayHello3(Model model) {// 在方法中使用Model参数，参数由spring进行注入
		logger.info("hello3....");

		model.addAttribute("msg", "我来自sayHello3");
		return "hellosmvc";// 使用jsp页面的名称进行返回
	}

	@RequestMapping("hello2")
	public ModelAndView sayHello2() {
		logger.info("sayHello2....");
		ModelAndView view = new ModelAndView();
		view.setViewName("hellosmvc");// 使用jsp(模版)页面的名称进行返回
		view.addObject("msg", "我来自sayHello2");// 返回ModelAndView时，如何传递数据到页面,默认的作用域是request
		return view;
	}
}
