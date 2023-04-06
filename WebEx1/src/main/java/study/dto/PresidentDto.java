package study.dto;

import java.sql.Timestamp;

public class PresidentDto {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String photo;
	
	private int readcount;
	private Timestamp writeday;
	
	//DTO는 데이터를 전송하는 객체를 의미한다.
	//데이터 캡슐화 : 관련있는 데이터를 하나의 객체로 묶어서 전달한다.
	
	
	
	//1. 디폴트 생성자 영역				//생성자 : 클래스의 객체가 만들어 질 때 자동으로 호출되는 함수, 객체를 초기화 하는 역할을 한다.
	public PresidentDto() {
		super();
	}
	
	//2. 읽어와야하는 데이터만 담긴 생성자
	public PresidentDto(String writer, String subject, String content, String photo) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.photo = photo;
	}

	//3. 출력을 위한 전체 데이터가 담긴 생성자
	public PresidentDto(int num, String writer, String subject, String content, String photo, int readcount,
			Timestamp writeday) {
		super();
		this.num = num;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.photo = photo;
		this.readcount = readcount;
		this.writeday = writeday;
	}
	
	// 4. setter getter 영역       setter: 물건을 넣는 상자 / getter : 상자에 담긴 물건을 꺼내오는 것.
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
}
