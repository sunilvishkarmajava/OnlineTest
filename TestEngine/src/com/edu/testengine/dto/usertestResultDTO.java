package com.edu.testengine.dto;

import java.util.Date;

public class usertestResultDTO {
		private int resultid;
		private String userName;
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		private int testid;
		private int marks;
		private Date test_date;
		public int getResultid() {
			return resultid;
		}
		public void setResultid(int resultid) {
			this.resultid = resultid;
		}
		
		public int getTestid() {
			return testid;
		}
		public void setTestid(int testid) {
			this.testid = testid;
		}
		public int getMarks() {
			return marks;
		}
		public void setMarks(int marks) {
			this.marks = marks;
		}
		public Date getTest_date() {
			return test_date;
		}
		public void setTest_date(Date test_date) {
			this.test_date = test_date;
		}
		
}
