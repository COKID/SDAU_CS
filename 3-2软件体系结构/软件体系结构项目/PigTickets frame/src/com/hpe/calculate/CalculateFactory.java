package com.hpe.calculate;

public class CalculateFactory {
	public static Calculator getCalculator(int level){
		Calculator cal = null;
		switch(level){
			case 1:
				cal = new TrainCalculator();
				break;
			case 2:
				cal = new CarCalculator();
				break;
			case 3:
				cal = new GaoCalculator();
				break;
			case 4:
				cal = new AirCalculator();
				break;
			
		}
		return cal;
	}
}
