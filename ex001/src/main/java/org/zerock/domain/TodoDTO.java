package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	private String title;
	//InitBinder사용X
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	//요청 : ../sample/ex03?title=test&dueDate=2022/01/02
	//결과 : - todo: TodoDTO(title=test, dueDate=Sun Jan 02 00:00:00 KST 2022)
	private Date dueDate;
}
