package com.hpe.calculate;

import java.math.BigDecimal;

import com.hpe.po.Frequency;

public class AirCalculator implements Calculator {

	@Override
	public double getPrice(double kilometers) {
		double price = 0;
		if(kilometers<=200){
			price = kilometers+50;
		}else if(kilometers>200&&kilometers<=800){
			price = kilometers*0.85+80+50;
		}else{
			price = kilometers*0.85+150+50;
		}
		//四舍五入保留两位小数
		BigDecimal   b   =   new   BigDecimal(price);  
		price   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
		return price;
	}

}
