package study.dto;

import java.sql.Timestamp;

public class DesignDto {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String photo;
	private int readcount;
	private Timestamp writeday;
	
	//1. 디폴트 생성자 영
	public DesignDto() {
		super();
	}

	//2. 읽어와야하는 데이터만 담긴 생성자
	public DesignDto(String writer, String subject, String content, String photo) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.photo = photo;
	}
	
	//3. 출력을 위한 전체 데이터가 담긴 생성자
	public DesignDto(int num, String writer, String subject, String content, String photo, int readcount,
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

	//4. 전체 데이터에 대한 Setter & Getter
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
