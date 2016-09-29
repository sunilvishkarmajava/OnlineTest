package com.edu.testengine.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.testengine.dao.courseDAO;
import com.edu.testengine.dao.testDAO;
import com.edu.testengine.dao.testQuestionDAO;
import com.edu.testengine.dao.usertestResultDAO;
import com.edu.testengine.dto.courseDTO;
import com.edu.testengine.dto.finalResultDTO;
import com.edu.testengine.dto.resultDTO;
import com.edu.testengine.dto.testDTO;
import com.edu.testengine.dto.testQuestionDTO;
import com.edu.testengine.dto.usertestResultDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class getTestServlet
 */
@WebServlet("/getTestServlet")
public class getTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
        BufferedReader br = request.getReader();
        String str = null;
        while ((str = br.readLine()) != null) {
            sb.append(str);
        }
        System.out.println(sb.toString());
        
        
        JsonParser parser = new JsonParser();
        JsonObject jObj=(JsonObject) parser.parse(sb.toString());
        
        String action=jObj.get("action").getAsString();
        switch(action){
		case "SELECT":
			response.setContentType("application/json");
			int testID=4;
            response.getWriter().write(select(testID));
            break;
		case "SUBMIT":
			
JsonObject testData=jObj.get("testDetails").getAsJsonObject();
			testDTO test=new testDTO();
	        //(courseId,facultyId,testName,questions,testTime,minMarks,totalMarks)
	        
	        String userid=jObj.get("userid").getAsString();
	        test.setCourseid(testData.get("courseId").getAsInt());
	        test.setFacultyID(testData.get("facultyId").getAsInt());
	        test.setTestid(testData.get("testid").getAsInt());
	        test.setTestName(testData.get("testName").getAsString());
	       
	        test.setMinMarks(testData.get("minMarks").getAsInt());
	        test.setTotalMarks(testData.get("totalMarks").getAsInt());
	        test.setTestDuration(testData.get("testTime").getAsInt());
	        
	        JsonArray questions=jObj.get("questionList").getAsJsonArray();
	        
	        ArrayList<testQuestionDTO> questionList = new ArrayList<>();
	        
	        if (questions.size() > 0) {
	        	testQuestionDTO q;
	    		for (int i = 0;i < questions.size();i++) {
	    			try {
	    				//JsonElement q = questions.get(i);
	    				JsonObject object= (JsonObject)questions.get(i);
	    				
	    				q=new testQuestionDTO();
	    				
	    				 //q.setQuestionNo(object.get("questionNumber").getAsInt());
	 		            q.setQuestion( object.get("question").getAsString());
	 		            q.setQuestionNo(object.get("questionNo").getAsInt());
	 		            q.setQuestionID(object.get("questionID").getAsInt());
	 		            q.setOptionA( object.get("optionA").getAsString());
	 		            q.setOptionB(object.get("optionB").getAsString());
	 		            q.setOptionC(object.get("optionC").getAsString());
	 		            q.setOptionD(object.get("optionD").getAsString());
	 		            q.setAnswer( object.get("answer").getAsString());
	 		            
	 		           questionList.add(q);
	    				
	    			} catch (Exception e) {
	    				
	    				
	    			}
	    		}
	    		}
	        test.setQuestionList(questionList);
	        
	        response.getWriter().write(submit(test,userid));
	        //submit(test,userid);
			break;
            }
	}
	private String submit(testDTO test,String userid){
		String json="";
		
		testQuestionDAO dao=new testQuestionDAO();
		ResultSet rs=null;
		try {
			rs=dao.selectedTest(test.getTestid());
			
			ArrayList<testQuestionDTO> questionList=new ArrayList<>();
			testQuestionDTO obj;
			int qno=1;
			while (rs.next()){
				obj=new testQuestionDTO();
				obj.setQuestionNo(qno);
				obj.setQuestionID(rs.getInt("QuestionId"));
				obj.setQuestion(rs.getString("Question"));
				obj.setOptionA(rs.getString("OptionA"));
				obj.setOptionB(rs.getString("OptionB"));
				obj.setOptionC(rs.getString("OptionC"));
				obj.setOptionD(rs.getString("OptionD"));
				obj.setAnswer(rs.getString("Answer"));
                
				questionList.add(obj);
                qno+=1;
            }
			
			ArrayList<testQuestionDTO> userQ=test.getQuestionList();
			
			ArrayList<resultDTO> result=new ArrayList<>();
			resultDTO res;
			
			 int totalMarks=100;
			 int perQuestionMark=10;
			 int marks=0;
			 int minMarks=50;
			 int correctAnswer=0;
			 int wrongAnswer=0;
			 int skipQuestion=0;
			 String status;
			 
			 
			 
			for (testQuestionDTO q : userQ) {
				for (testQuestionDTO r : questionList) {
					if(q.getQuestionID()==r.getQuestionID()){
						res=new resultDTO();
						res.setQuestionNo(q.getQuestionNo());
						if(q.getAnswer().equalsIgnoreCase(r.getAnswer())){
						res.setResult("correct");
						correctAnswer++;
						}
						else if(q.getAnswer().trim().equals("") ||q.getAnswer()==null){
							res.setResult("not answered");
							skipQuestion++;
						}
						else{
							res.setResult("wrong answer");
							wrongAnswer++;
						}
						result.add(res);
						break;
					}
				}
			}
			
			marks=correctAnswer*perQuestionMark;
			
			if(marks>=minMarks){
				status="pass";
			}
			else{
				status="fail";
			}
			
			
			finalResultDTO finalRes=new finalResultDTO();
			
			finalRes.setCorrectAnswer(correctAnswer);
			finalRes.setMarks(marks);
			finalRes.setSkipQuestion(skipQuestion);
			finalRes.setStatus(status);
			finalRes.setTotalMarks(totalMarks);
			finalRes.setWrongAnswer(wrongAnswer);
			finalRes.setResult(result);
			
			usertestResultDTO testResult=new usertestResultDTO();
			testResult.setMarks(marks);
			testResult.setResultid(0);
			testResult.setTestid(test.getTestid());
			testResult.setUserName("sunil");
			usertestResultDAO resultdao=new usertestResultDAO();
			resultdao.insert(testResult);
			
			 json = new Gson().toJson(finalRes);
			 
             System.out.println(json);
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	private String select(int testID){
		String json="";
		testDTO test=new testDTO();
		testDAO testdao=new testDAO();
		
		testQuestionDAO dao=new testQuestionDAO();
		ResultSet rs=null;
		try {
			rs=testdao.selectedTest(testID);
			
			while (rs.next()){
				test.setTestid(rs.getInt("TestId"));
				test.setFacultyID(rs.getInt("FacultyId"));
				test.setCourseid(rs.getInt("CourseId"));
				test.setTestName(rs.getString("TestName"));
				test.setTestDuration(rs.getInt("testDuration"));
				test.setMinMarks(rs.getInt("MinMarks"));
				test.setTotalMarks(rs.getInt("TotalMarks"));
				
				}
			
			rs=dao.selectedTest(testID);
			
			ArrayList<testQuestionDTO> questionList=new ArrayList<>();
			testQuestionDTO obj;
			int qno=1;
			while (rs.next()){
				obj=new testQuestionDTO();
				obj.setQuestionNo(qno);
				obj.setQuestionID(rs.getInt("QuestionId"));
				obj.setQuestion(rs.getString("Question"));
				obj.setOptionA(rs.getString("OptionA"));
				obj.setOptionB(rs.getString("OptionB"));
				obj.setOptionC(rs.getString("OptionC"));
				obj.setOptionD(rs.getString("OptionD"));
				obj.setAnswer("");
                
				questionList.add(obj);
                qno+=1;
            }
			test.setQuestionList(questionList);
			 json = new Gson().toJson(test);
			 
             System.out.println(json);
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}

}
