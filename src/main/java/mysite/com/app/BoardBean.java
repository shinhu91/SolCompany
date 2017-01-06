package mysite.com.app;

import org.springframework.stereotype.Repository;

@Repository
public class BoardBean {

	private int idx;
	private String writer;
	private String rank;
	private String buy;
	private String count;
	private String reason;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getBuy() {
		return buy;
	}
	public void setBuy(String buy) {
		this.buy = buy;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}	
	
	
}
