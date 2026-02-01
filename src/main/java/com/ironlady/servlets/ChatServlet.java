package com.ironlady.servlets;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChatServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

		try {
			String profile = req.getParameter("profile");
			String goal = req.getParameter("goal");
			boolean careerGap = Boolean.parseBoolean(req.getParameter("careerGap"));

			String program;

			if (profile.equals("Student")) {
				program = "Student Career Launch Program";
			} else if (profile.equals("Career Returnee") || careerGap) {
				program = "Women Career Restart Program";
			} else if (profile.equals("Working Professional") && goal.equals("Leadership")) {
				program = "Women Leadership Accelerator";
			} else {
				program = "General Skill Enhancement Program";
			}

			String aiMessage =
				    "Thanks for sharing your details 😊<br><br>" +
				    "Based on your profile as a <b>" + profile + "</b>, " +
				    "I recommend the <b>" + program + "</b>.<br><br>" +
				    "This program is designed to help you achieve your goal of <b>" + goal + "</b> " +
				    "through structured learning, expert mentorship, and real-world guidance. " +
				    "It aligns well with your current background and will support your next career step.";

			req.setAttribute("aiResponse", aiMessage);

			req.getRequestDispatcher("/chat.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
