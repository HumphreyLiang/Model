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
			
			//**********�q�d���|�����s��***************
			Integer memNo =null;		
			memNo = member.getMemNo();
			//*********���X�Q�d������x�s��************
			Integer diaNo = null;
			try{
				diaNo =new Integer(req.getParameter("diano"));
				
			}catch(Exception e){
				e.getMessage();
			}
			//**********���X�d�������e*****************
			String diaMsgText = null;
			try{
				diaMsgText =req.getParameter("diamsgtext");
				
			}catch(Exception e){
				e.getMessage();
			}
			
			//**********�[�J�d�����ɶ�*****************
			Timestamp diaMsgTime = new Timestamp(System.currentTimeMillis());
			
			//*********�[�J�d�������A��0****�N���R��
			Integer diaMsgState = new Integer(0);
			
			//�}�l�ק��Ƶ�DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
 
			dmgSvc.addDiaMsg(diaNo, memNo, diaMsgText, diaMsgTime, diaMsgState);
			
			//�s�W�����ǳ����
			String diaMemNo = req.getParameter("diamemno");		//���F�p�G�b�ӤH�����d��memNo�|����
			String whichPage = req.getParameter("whichPage");
			String url = req.getParameter("backpath")+"?whichPage="+whichPage+"&memNo="+diaMemNo; 
			System.out.println(url);
			RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,�������
			successView.forward(req, res);
	
		}
		
		if("update".equals(action)){
			
			
			//*********���X�d�����d���s��************
			Integer diaMsgNo = null;
			try{
				diaMsgNo =new Integer(req.getParameter("diamsgno"));
				System.out.println(diaMsgNo);
			}catch(Exception e){
				e.getMessage();
			}
			//**********���X�d�������e*****************
			String diaMsgText = null;
			try{
				diaMsgText =req.getParameter("diamsgtext");
				System.out.println(diaMsgText);
			}catch(Exception e){
				e.getMessage();
			}
			
			
			
			//�}�l�ק��Ƶ�DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
			DiaMsg diaMsgOld = dmgSvc.getOneDiaMsg(diaMsgNo);
			dmgSvc.updateDiaMsg(diaMsgNo, diaMsgOld.getDiaNo(), diaMsgOld.getMemNo(), diaMsgText, diaMsgOld.getDiaMsgTime(), diaMsgOld.getDiaMsgState());
	
		}
		
		if("delete".equals(action)){
			
			
			//*********���X�d�����d���s��************
			Integer diaMsgNo = null;
			try{
				diaMsgNo =new Integer(req.getParameter("diamsgno"));
				System.out.println(diaMsgNo);
			}catch(Exception e){
				e.getMessage();
			}
						
			//�}�l�ק��Ƶ�DiaMsgService
			DiaMsgService dmgSvc= new DiaMsgService();
			dmgSvc.deleteDiaMsg(diaMsgNo);
			
	
		}
		
		
		
		
		
	}
}
