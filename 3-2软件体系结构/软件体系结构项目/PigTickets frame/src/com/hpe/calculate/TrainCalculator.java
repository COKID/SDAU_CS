package com.hpe.calculate;

import java.math.BigDecimal;

import com.hpe.po.Frequency;

public class TrainCalculator implements Calculator {

	@Override
	public double getPrice(double kilometers) {
		double price = 0;
		if(kilometers<=200){
			price = kilometers*0.05861;
		}else if(kilometers>200&&kilometers<=500){
			price = 200*0.05861+(kilometers-200)*0.05861*0.9;
		}else{
			price = 200*0.05861+300*0.05861*0.9+(kilometers-500)*0.05861*0.8;
		}
		//四舍五入保留两位小数
		BigDecimal   b   =   new   BigDecimal(price);  
		price   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
		return price;
	}

}
