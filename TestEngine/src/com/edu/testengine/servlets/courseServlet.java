package com.edu.testengine.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.testengine.dao.courseDAO;
import com.edu.testengine.dto.courseDTO;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class courseServlet
 */
@WebServlet("/courseServlet")
public class courseServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	
	private static final String UPLOAD_DIRECTORY = "courseImage";

	
	private static final int MEMORY_THRESHOLD 	= 1024 * 1024 * 3; 	// 3MB
	private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE	= 1024 * 1024 * 50; // 50MB

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		courseDAO coursedao=new courseDAO();
		courseDTO coursedto = new courseDTO();
		if (!ServletFileUpload.isMultipartContent(request)) {
			
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}
		
		HashMap<String,String> value=new HashMap<>();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		
		
		upload.setFileSizeMax(MAX_FILE_SIZE);
		
		
		upload.setSizeMax(MAX_REQUEST_SIZE);

		
		String uploadPath = getServletContext().getRealPath("")
				+ File.separator + UPLOAD_DIRECTORY;
		
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		

		try {
			
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
			
				for (FileItem item : formItems) {
			
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						
					
						File storeFile = new File(filePath);
							
						System.out.println("file path :"+storeFile);
						
						//my code
						
						String folderPath = uploadPath + File.separator;
						
						int index=fileName.lastIndexOf(".");
						String fileN=fileName.substring(0, index);
						String extension=fileName.substring(index,fileName.length());
						
						System.out.println("file name :"+ fileN);
						System.out.println("file extension :"+ extension);
						
						
						
						File storeFileNew=new File(filePath);
						for(int i=1;i<=100000;i++){
						if(storeFileNew.exists()){
							storeFileNew = new File(folderPath+fileN+i+extension);
							continue;
						}
							
							storeFile.renameTo(storeFileNew);
							//coursedto.setImagePath(UPLOAD_DIRECTORY+"/"+fileName);
							coursedto.setImagePath(UPLOAD_DIRECTORY+"/"+storeFileNew.getName());
							break;
						
						}
						
						
						//
						item.write(storeFile);
						
						request.setAttribute("message",
							"Upload has been done successfully!");
					}
					
					if (item.isFormField()) 
                    {
						
                        String name = item.getFieldName();
                        String value2 = item.getString();
                        value.put(name,value2);
                        System.out.println(name+":"+value2);
                    }
				}
				
			}
			//System.out.println("user Name : "+value.get("userName"));
			//System.out.println("phone : "+value.get("phone"));
			
			String title = value.get("coursetitle");
			String details = value.get("coursedetails");
			
			coursedto.setDetails(details);
			coursedto.setTitle(title);
			
		} catch (Exception ex) {
			request.setAttribute("message",
					"There was an error: " + ex.getMessage());
		}
		
		
		try {
			if(coursedao.insert(coursedto)){
				System.out.println("course added successfully");
			}
			else{
				System.out.println("course adding failed");
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}