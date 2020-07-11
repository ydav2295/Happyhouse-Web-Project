package com.ssafy.happyhouse.model.dto;

public class ReplyBoard {

    // reply_no 
    private int replyNo;

    // qna_no 
    private int qnaNo;

    // reply_content 
    private String replyContent;

    // reply_datetime 
    private String replyDatetime;

    // reply_userid 
    private String replyUserid;
    private String replyTitle;
    
    public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

    public int getReplyNo() {
        return replyNo;
    }

    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }

    public int getQnaNo() {
        return qnaNo;
    }

    public void setQnaNo(int qnaNo) {
        this.qnaNo = qnaNo;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyDatetime() {
        return replyDatetime;
    }

    public void setReplyDatetime(String replyDatetime) {
        this.replyDatetime = replyDatetime;
    }

    public String getReplyUserid() {
        return replyUserid;
    }

    public void setReplyUserid(String replyUserid) {
        this.replyUserid = replyUserid;
    }

	@Override
	public String toString() {
		return "ReplyBoard [replyNo=" + replyNo + ", qnaNo=" + qnaNo + ", replyContent=" + replyContent
				+ ", replyDatetime=" + replyDatetime + ", replyUserid=" + replyUserid + ", replyTitle=" + replyTitle
				+ "]";
	}
	
    
}