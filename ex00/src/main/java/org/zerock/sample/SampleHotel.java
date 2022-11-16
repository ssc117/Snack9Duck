package org.zerock.sample;

import org.springframework.stereotype.Component;

import com.sun.istack.internal.NotNull;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter

//@AllArgsConstructor //생성자를 만들어 준 것과 같은 역할

@RequiredArgsConstructor //final해야 함
public class SampleHotel {
	@NotNull//final하지 않은데 @RequiredArgsConstructor 사용하는 경우
	private Chef chef; //멤버변수

//	public SampleHotel(Chef chef) {//chef를 받는 생성자
//		this.chef = chef;
//	}
	
}
