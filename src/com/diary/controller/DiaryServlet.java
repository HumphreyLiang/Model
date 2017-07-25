package com.diary.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.diary.model.DiaryService;

@MultipartConfig(fileSizeThreshold =500* 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024 * 1024)
public class DiaryServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException{
			doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException{
		
		req.setCharacterEncoding("big5");
		res.setContentType("text/html; charset=UTF-8");
		//String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
//		if("insert".equals(action)){
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			//----------------判斷會員編號-------------------
			Integer memNo =null;
			try{
				 
				 memNo = new Integer(Integer.valueOf(req.getParameter("memno")));
				 
			}catch(NullPointerException e){
				errorMsgs.add("請填會員編號!");
			}
			//----------------判斷名稱是否為空值-------------------
			String diaName = null;
			try{
				diaName = req.getParameter("dianame").trim();
				
			}catch(NullPointerException e){
				errorMsgs.add("請輸入發文名稱!");
			}
			//----------------判斷內文是否為空值-------------------
			String diaText = null;
			try{
				diaText = req.getParameter("diatext").trim();
			}catch(NullPointerException ne){
				errorMsgs.add("請輸入內文!");
			}
			//---------------判斷圖片的格式----------------------
			byte[] diaImg= null;
			String fileName=null;
			Part part = req.getPart("diaimg");

			if(part.getSize()!=0){
//				fileName = getFileNameFromPart(part);
				System.out.println(part.equals(null));
				if(part.getContentType().substring(0,5).equals("image")){
					diaImg = getByteArrayImg(part);
					System.out.println(part.getContentType());
					System.out.println("圖片格式正確!");
				}
			}
				GregorianCalendar speday = new GregorianCalendar(2011,12,3,23,49,22);
//				Timestamp diacretime =new Timestamp(System.currentTimeMillis());
				Timestamp diaCreTime =new Timestamp(speday.getTimeInMillis());
				Timestamp diaModTime =null;
				Integer diaState = 0; //indicate appearance
				
//				EmpVO empVO = new EmpVO();
//				empVO.setEname(ename);
//				empVO.setJob(job);
//				empVO.setHiredate(hiredate);
//				empVO.setSal(sal);
//				empVO.setComm(comm);
//				empVO.setDeptno(deptno);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/addEmp.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				DiaryService dsv =new DiaryService();
				dsv.addDia(memNo, diaName, diaText, diaImg, diaCreTime, diaModTime, diaState);
				
				
		}
		
//	}
	
	public byte[] getByteArrayImg(Part part){
		
		ByteArrayOutputStream diaimg=null;
		try{
			java.io.InputStream in =part.getInputStream(); 
			diaimg = new ByteArrayOutputStream();
			byte[] buffer = new byte[8192];
			int i;
			while ((i = in.read(buffer)) != -1) {
				diaimg.write(buffer, 0, i);
			}
			diaimg.close();
			in.close();
			
			
		}catch(IOException e){
			e.printStackTrace();
		}
		
		return diaimg.toByteArray();
	}
	
//	public String getFileNameFromPart(Part part) {
//		String header = part.getHeader("content-disposition");
//		String filename = header.substring(header.lastIndexOf("=") + 2, header.length() - 1);
//		if (filename.length() == 0) {
//			return null;
//		}
//		return filename;
//	}

}
