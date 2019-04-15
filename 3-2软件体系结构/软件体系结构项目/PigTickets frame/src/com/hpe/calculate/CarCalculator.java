package com.hpe.calculate;

import java.math.BigDecimal;

import com.hpe.po.Frequency;

public class CarCalculator implements Calculator {

	@Override
	public double getPrice(double kilometers) {
		double price = 0;
		if(kilometers<=200){
			price = kilometers*0.05861*1.2;
		}else{
			price = 200*0.05861*1.2+(kilometers-200)*0.05861*0.9*1.2;
		}
		//四舍五入保留两位小数
		BigDecimal   b   =   new   BigDecimal(price);  
		price   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
		return price;
	}

}
