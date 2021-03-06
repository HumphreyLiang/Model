package com.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.member.model.Member;
import com.member.model.MemberService;
import com.pet.model.Pet;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected Member allowUser(String memId, String memPwd) {
		MemberService memSvc = new MemberService();
		Member member = memSvc.getOneMemberById(memId);

		if (member == null) {
			return null;
		} else if (!member.getMemPwd().equals(memPwd)) {
			return null;
		} else {
			return member;
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MemberService memSvc = new MemberService();
		// �P�_�O�_���ŭ�
		String memId = req.getParameter("memId");
		String memPwd = req.getParameter("memPwd");

		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);

		if (allowUser(memId, memPwd) == null) {
			Member errMember = new Member();
			errMember.setMemId(memId);
			errMember.setMemPwd(memPwd);

			errorMsgs.add("�b���K�X���~");
			req.setAttribute("member", errMember);
			RequestDispatcher sendBackView = req.getRequestDispatcher("/front_end/member/login.jsp");
			sendBackView.forward(req, res);
		} else {
			HttpSession session = req.getSession();
			Member member=allowUser(memId, memPwd);
			session.setAttribute("member", member);
			String location = (String) session.getAttribute("location");
			if (location != null) {
				session.removeAttribute("location");
				res.sendRedirect(location);
				return;
			}
			res.sendRedirect(req.getContextPath() + "/front_end/index.jsp");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
