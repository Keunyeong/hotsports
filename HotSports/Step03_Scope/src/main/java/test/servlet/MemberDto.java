package test.servlet;

public class MemberDto {
	private int num;
	private String name;
	private String addr;
	private int StartRowNum;
	private int EndRowNum;
	
	public MemberDto() {}

	public MemberDto(int num, String name, String addr, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
		StartRowNum = startRowNum;
		EndRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getStartRowNum() {
		return StartRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		StartRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return EndRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}
	
	
}
