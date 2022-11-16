package org.zerock.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SampleDTOList {
	private List<SampleDTO> list; //SampleDTO를 담는 List

	public SampleDTOList() { //default 생성자
		list = new ArrayList<>();
	}
	
}
