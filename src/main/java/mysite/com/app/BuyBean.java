package mysite.com.app;

import org.springframework.stereotype.Repository;

@Repository
public class BuyBean {

	private int idx;
	private String desk;
	private String chair;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDesk() {
		return desk;
	}
	public void setDesk(String desk) {
		this.desk = desk;
	}
	public String getChair() {
		return chair;
	}
	public void setChair(String chair) {
		this.chair = chair;
	}
	
	
}
