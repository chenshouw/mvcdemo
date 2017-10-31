package com.neuedu.mvcdemo.view.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class CustomDateConverter implements Converter<String,Date>{

	@Override
	public Date convert(String source) {
		//使用自定义时间转换器，完成多种时间格式转换
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			//e.printStackTrace();
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return sdf.parse(source);
			} catch (ParseException e1) {
				sdf = new SimpleDateFormat("yyyy/MM/dd");
				try {
					return sdf.parse(source);
				} catch (ParseException e3) {
					sdf = new SimpleDateFormat("yyyy/MM/dd  HH:mm:ss");
					try {
						return sdf.parse(source);
					} catch (ParseException e4) {
					}
				}
			}
		}
		return new Date();//如果时间格式都不满足，则返回当前系统时间
	}

}
