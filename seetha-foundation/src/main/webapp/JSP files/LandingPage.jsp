<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

   
<!DOCTYPE html>
<html lang="en-US">

<head >
	<!-- <meta charset="ISO-8859-1"> -->
    <title>Seetha Foundation</title>
     
    <link rel="stylesheet" type="text/css" href="/CSS files/LandingPageStyle.css">
    <link rel="icon" type="image/x-icon" href="/images/title-logo.ico">
<script type="text/javascript">

</script>
</head>

<body>
<%@include file="/JSP files/Header.jsp"%>
   
  

    <section class="section2">
        <div class="slide">
            <img class="front-img" src="/images/slider 2.jpg" alt="donate" width="100%">

        </div>

        <div class="quotes" id="quotes">
            <h2>It's time for better help.</h2>
        </div>
        <div class="donate-background">
            <button class="donate" id="donate-button" onclick="location.href='/JSP files/DonorRegister.jsp'">Join Us</button>
            <button class="donate" id="donate-button1"  onclick="location.href='/JSP files/DonationPage.jsp'">Donate Now</button>
        </div>

    </section>

    <section class="charity-about">
 
        <div id="about-content">
            <h1 id="about-id">Kindness in Action</h1>
            <p id="about-para">Seetha Foundation Organization (NGO) Chennai based grass root level NGO is
                involved in Charity work for Scheduled castes, Scheduled tribes, other backward classes, and Dalits. A
                Team of youth, who have a passion for social service and compassion towards the sufferings of the
                disadvantaged sections of the society, came together and formed Seetha Foundation.</p>


            <p id="about-para1">
                They have a clear insight into the socio-economic and health issues faced by the downtrodden,
                underprivileged and marginalized segments of the communities. Seetha Foundation NGO India
                is a non-governmental, non-profit, social service voluntary organization working for integrated
                development of women and children of vulnerable segment of the society.</p>

            <p id="about-para2">
                Seetha Foundation has been collaborating with foreign donor agencies, corporate,
                national donor agencies both governmental and non-governmental towards making meaningful interventions
                for the cause of poor and needy sections of the society.
            </p>

            <p id="about-para3">
                Seetha Foundation believes that all human beings are equal and has the right to have good
                health and a proper standard of living. Seetha Foundation has to touch new heights by
                Regular Activities to fulfill the mission of the organization. Our executive committee oversees the
                organization's efforts. The committee meets regularly to ensure that all of our teams perform
                efficiently and to facilitate cross-functional connections. Our team of excellent staff, volunteers &
                members, who are dedicated, are available for any social cause (s) always.</p>



        </div>
        <div id="about-icon">
            <img id="about-img" src="/images/volunteer.png" alt="volunteer.img">
            <h3 id="become-text">Become a Volunteer</h3>

            <div id="about-icon">
                <img id="about-img" src="/images/donation.png" alt="give-donation.img">
                <h3 id="become-text1">Give Donation</h3>
            </div>
        </div>
        <div id="about-icon">

            <img id="about-img" src="/images/search.png" alt="quick-fundrise.img">
            <h3 id="become-text2">Quick Fundrise</h3>

            <div id="about-icon">
                <img id="about-img" src="/images/help.png" alt="help-someone.img">
                <h3 id="become-text3">Help Someone</h3>
            </div>
        </div>
    </section>

    <div id="footer">
		<%@include file="/JSP files/Footer.jsp"%>
	</div>
	<script src="/JS files/LandingScript.js"></script>
</body>

</html>