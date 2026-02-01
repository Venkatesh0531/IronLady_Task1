<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AI Career Guidance Assistant</title>

<style>
body {
	font-family: "Segoe UI", Arial, sans-serif;
	background-color: #f4f6f8;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 40px auto;
	background: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}

h1 {
	text-align: center;
	color: #222;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 18px;
}

label {
	display: block;
	font-weight: 600;
	margin-bottom: 6px;
	color: #333;
}

select {
	width: 100%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	font-size: 14px;
}

button {
	background-color: #ff5a1f;
	color: #fff;
	border: none;
	padding: 12px 18px;
	border-radius: 6px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 10px;
}

button:hover {
	background-color: #e64a12;
}

hr {
	margin: 30px 0;
	border: none;
	border-top: 1px solid #ddd;
}

.ai-box {
	background: #f9fafb;
	padding: 20px;
	border-radius: 10px;
	border-left: 5px solid #ff5a1f;
}

.ai-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #222;
}

.ai-text {
	font-size: 15px;
	line-height: 1.6;
	color: #444;
}

/* Floating FAQ Button */
.faq-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	background-color: #ff5a1f;
	color: #fff;
	border-radius: 50%;
	font-size: 26px;
	border: none;
	cursor: pointer;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
}

/* FAQ Box */
.faq-box {
	position: fixed;
	bottom: 100px;
	right: 30px;
	width: 340px;
	background: #ffffff;
	border-radius: 12px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
	padding: 15px;
	display: none;
	max-height: 420px;
	overflow-y: auto;
}

.faq-header {
	font-weight: bold;
	margin-bottom: 10px;
}

.faq-question {
	background: #ff5a1f;
	color: #fff;
	padding: 10px;
	border-radius: 6px;
	margin-bottom: 6px;
	cursor: pointer;
	font-size: 14px;
}

.faq-answer {
	background: #f4f6f8;
	padding: 10px;
	border-radius: 6px;
	margin-bottom: 10px;
	font-size: 14px;
	display: none;
}
</style>
</head>

<body>

	<div class="container">
		<h1>AI Career Guidance Assistant</h1>

		<form action="chat" method="post">

			<div class="form-group">
				<label>Profile</label> <select name="profile">
					<option>Student</option>
					<option>Working Professional</option>
					<option>Career Returnee</option>
				</select>
			</div>

			<div class="form-group">
				<label>Career Gap</label> <select name="careerGap">
					<option value="true">Yes</option>
					<option value="false">No</option>
				</select>
			</div>

			<div class="form-group">
				<label>Goal</label> <select name="goal">
					<option>Job</option>
					<option>Upskill</option>
					<option>Leadership</option>
				</select>
			</div>

			<button type="submit">Ask AI</button>
		</form>

		<%
		String aiResponse = (String) request.getAttribute("aiResponse");
		if (aiResponse != null) {
		%>
		<hr>
		<div class="ai-box">
			<div class="ai-title">🤖 AI Recommendation</div>
			<div class="ai-text"><%=aiResponse%></div>
		</div>
		<%
		}
		%>
	</div>

	<!-- Floating FAQ Button -->
	<button class="faq-btn" onclick="toggleFAQ()">🤖</button>

	<!-- FAQ Panel -->
	<div class="faq-box" id="faqBox">

		<div class="faq-header">💬 AI Help & FAQs</div>

		<div class="faq-question" onclick="toggleAnswer(1)">What
			programs does Iron Lady offer?</div>
		<div class="faq-answer" id="ans1">Iron Lady offers career
			launch, career restart, leadership, and skill enhancement programs
			designed specifically for women.</div>

		<div class="faq-question" onclick="toggleAnswer(2)">Who can
			apply for Iron Lady programs?</div>
		<div class="faq-answer" id="ans2">Students, working
			professionals, and women returning after a career break are eligible
			to apply.</div>

		<div class="faq-question" onclick="toggleAnswer(3)">Do the
			programs include mentorship?</div>
		<div class="faq-answer" id="ans3">Yes 😊 All programs include
			expert mentorship, guided learning paths, and real-world career
			support.</div>

		<div class="faq-question" onclick="toggleAnswer(4)">Are the
			programs online or offline?</div>
		<div class="faq-answer" id="ans4">Most programs are offered
			online or in hybrid mode for flexibility.</div>

		<div class="faq-question" onclick="toggleAnswer(5)">Will Iron
			Lady help with job opportunities?</div>
		<div class="faq-answer" id="ans5">Yes, selected programs include
			placement assistance, interview preparation, and career guidance.</div>

	</div>

	<script>
		function toggleFAQ() {
			const box = document.getElementById("faqBox");
			box.style.display = box.style.display === "block" ? "none"
					: "block";
		}

		function toggleAnswer(id) {
			const answer = document.getElementById("ans" + id);
			answer.style.display = answer.style.display === "block" ? "none"
					: "block";
		}
	</script>

</body>
</html>
