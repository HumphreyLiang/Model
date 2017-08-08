package com.diamsg.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diamsg.model.DiaMsg;
import com.diamsg.model.DiaMsgService;
import com.member.model.Member;


public class DiaMsgServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException{
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("member");
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=Big5");
		String action = req.getParameter("action");
		
		System.out.println(action);
		
		if("insert".equals(action)){
			
			//**********從留言會員的編號***************
			Integer memNo =null;		
			memNo = member.getMemNo();
			//*********取出被留言的日誌編號************
			Integer diaNo = null;
			try{
				diaNo =new Integer(req.getParameter("diano"));
				
			}catch(Exception e){
				e.getMessage();
			}
			//**********取出留言的內容*****************
			String diaMsgText = null;
			try{
				diaMsgText =req.getParameter("diamsgtext");
				
			}catch(Exception e){
				e.getMessage();
			}
			
			//**********加入留言的時間*****************
			Timestamp diaMsgTime = new Timestamp(System.currentTimeMillis());
			
			//*********加入留言的狀態為0****代表未刪除
			Integer diaMsgState = new Integer(0);
			
			//開始修改資料給DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
 
			dmgSvc.addDiaMsg(diaNo, memNo, diaMsgText, diaMsgTime, diaMsgState);
			
			//新增完成準備轉交
			String diaMemNo = req.getParameter("diamemno");		//為了如果在個人網頁留言memNo會掉值
			String whichPage = req.getParameter("whichPage");
			String url = req.getParameter("backpath")+"?whichPage="+whichPage+"&memNo="+diaMemNo; 
			System.out.println(url);
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交原網頁
			successView.forward(req, res);
	
		}
		
		if("update".equals(action)){
			
			
			//*********取出留言的留言編號************
			Integer diaMsgNo = null;
			try{
				diaMsgNo =new Integer(req.getParameter("diamsgno"));
				System.out.println(diaMsgNo);
			}catch(Exception e){
				e.getMessage();
			}
			//**********取出留言的內容*****************
			String diaMsgText = null;
			try{
				diaMsgText =req.getParameter("diamsgtext");
				System.out.println(diaMsgText);
			}catch(Exception e){
				e.getMessage();
			}
			
			
			
			//開始修改資料給DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
			DiaMsg diaMsgOld = dmgSvc.getOneDiaMsg(diaMsgNo);
			dmgSvc.updateDiaMsg(diaMsgNo, diaMsgOld.getDiaNo(), diaMsgOld.getMemNo(), diaMsgText, diaMsgOld.getDiaMsgTime(), diaMsgOld.getDiaMsgState());
	
		}
		
		if("delete".equals(action)){
			
			
			//*********取出留言的留言編號************
			Integer diaMsgNo = null;
			try{
				diaMsgNo =new Integer(req.getParameter("diamsgno"));
				System.out.println(diaMsgNo);
			}catch(Exception e){
				e.getMessage();
			}
						
			//開始修改資料給DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
			dmgSvc.deleteDiaMsg(diaMsgNo);
			
	
		}
		
		
		
		
		
	}
}
