<%@page import ="java.text.SimpleDateFormat" %>
    <%@include file="DBConnection.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Get the Data</title>
<style type="text/css">
@import url("Sih.css");
</style>
 <script src="jquery-3.3.1.min.js"></script>
 <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Laila" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="css/button.css" rel="stylesheet" type="text/css">

<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
   <script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
 <script  src="js/main.js"></script>
 
 


</head>

<body onload="location1()">
<%
  String user = (String)session.getAttribute("username");
	ResultSet rs1 = null;
	String tbl=null;
	ResultSet rs= null;
	ResultSet rs2=null;
	String g1=null,g2=null;
	Statement stat = con.createStatement();
    ResultSet rs4=stat.executeQuery("select * from login where username = '"+user+"';");
    if(rs4.next()){
    	g1 = rs4.getString(4);
    	g2 = rs4.getString(5);
    }
  %>
	<header>
    <div class="header">
    <h1 style="display: inline; font-family: Laila;">Hello <%out.print(user); %></h1>
        <img style="display: inline; width: 60px; height: 60px; top: 0px; right:0px; float: right;" src="img/mainLogo.png" alt="logo" class="logo" id ="logo" >
   
    </div>

    <div id="navbar">
        <a id="loc1" class="active" href="javascript:location1()"><%out.print(g1);%></a>
        <a id="loc2" href="javascript:location2()"><%out.print(g2);%></a>
        
          <a href="index.html" style="float:right; font-family:Laila;">Logout</a>

    </div>
    </header>

<div class="content">
    <form action="main.jsp">
	<div class= "main">
	<div class="split left">
  <div class="centered">
    <img src="weather.gif" alt="weather" width="210" height="162">
    <h2 style="font-family: Laila;">Temperature</h2>
    <table style="text-align:center;display:table;padding:7px;border-spacing:2px;align:left;margin-left:25%;" id="temp"><tr>
    <th>DateTime</th>
    <th>Temperature</th>
    </tr></table> <br><br>
    
	 <label for="start" style="font-family: Laila;">Start date and time:</label>

<input id="st1" type="datetime-local" name="start" ><br><br>
<label for="end" style="font-family: Laila;">End date and time:</label>
<input id="ed1" type="datetime-local" name="end" ><br><br>
<div class="ab">
            <button value="submit" class="ab" style="align:center;">Apply</button>
      </div>

<br><br>
	 <div class="button1">
	 <p><a id="gph" onclick="graph()" href="#popup1" style="font-family: Laila;">History and Graph</a></p>
      </div>
<div id="popup1" class="overlay">
	<div class="popup">
		<a class="close" href="#">&times;</a>
		<div class="content1">
			<div id="chartContainer" style="height: 300px; width: 100%;"></div>
			<button class="button2" onclick="download()" id="dwd" style="font-family: Laila;">Download CSV file</button>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
	</div>
</div>

  </div>
</div>

<div class="split right">
  <div class="centered">
    <img src="cloud.gif" alt="humidity" width="310" height="162">
    <h2 style="font-family: Laila;">Humidity</h2>
    <table id="hum" style="text-align:center;display:table;padding:7px;border-spacing:2px;align:left;margin-left:25%;" ><tr>
    <th>DateTime</th>
    <th>Humidity</th>
    </tr></table><br><br>
	
	 <label for="start1" style="font-family: Laila;">Start date and time:</label>

<input id="st2" type="datetime-local" name="start1" ><br><br>
<label for="end1" style="font-family: Laila;">End date and time:</label>
<input id="ed2" type="datetime-local" name="end1" ><br><br>
<div class="ab">
            <button value="submit" class="ab" style="align:center;">Apply</button>
      </div>

<br>
<br>
	<div class="button1">
	 <p><a id="gph1" onclick="graph1()" href="#popup2" style="font-family: Laila;">History and Graph</a></p>
      </div>
<div id="popup2" class="overlay1">
	<div class="popup">
		<a class="close" href="#">&times;</a>
		<div class="content1">
			<div id="chartContainer1" style="height: 300px; width: 100%;"></div>
			<button class="button2" id="dwd1" onclick="download1()"  style="font-family: Laila;">Download CSV file</button>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
	</div>
</div>
  </div>
</div>
</div>	</form>
    </div>

		
</body>
    <script>
window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
function location1(){
	
	document.getElementById("loc1").classList.add("active");
	document.getElementById("loc2").classList.remove("active");
		<%
	String st = request.getParameter("start");
	String ed = request.getParameter("end");
	String st1=request.getParameter("start1");
	String ed1=request.getParameter("end1");
	//System.out.print(st);
	//SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	if(st!=null &&ed!=null){
	%>
		document.getElementById("st1").value="<%=st%>";
		document.getElementById("ed1").value="<%=ed%>";
		document.getElementById("st2").value="<%=st1%>";
		document.getElementById("ed2").value="<%=ed1%>";
		<%
	}else{
		%>
	document.getElementById("st1").value="2018-06-12T19:30";
	document.getElementById("ed1").value="2018-06-12T19:30";
	document.getElementById("st2").value="2018-06-12T19:30";
	document.getElementById("ed2").value="2018-06-12T19:30";
	
	<%
	}
	tbl = user + "_loc1";
	rs1= stat.executeQuery("select * from (select * from loc1 order by datetime DESC LIMIT 10)abc order by datetime asc;");
	%>
	
	
        var rowCount = document.getElementById("temp").rows.length;
        for (var i = rowCount - 1; i > 0; i--) {
        	document.getElementById("temp").deleteRow(i);
        }
        var rowCount = document.getElementById("hum").rows.length;
        for (var i = rowCount - 1; i > 0; i--) {
        	document.getElementById("hum").deleteRow(i);
        }
        var i=1;
	<%
	
	while(rs1.next()){
		float temp = rs1.getFloat(2);
		float hum = rs1.getFloat(3);
		String date = (String)rs1.getString(1);
		SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		%>
		
		var row =document.getElementById("temp").insertRow(i);
		var cell = row.insertCell(0);
		var cell1 = row.insertCell(1);
		cell.innerHTML = "<%=date%>";
		cell1.innerHTML = "<%=temp%>";
		var row1= document.getElementById("hum").insertRow(i);
		cell = row1.insertCell(0);
		cell1 = row1.insertCell(1);
		cell.innerHTML = "<%=date%>";
		cell1.innerHTML = "<%=hum%>";
		i++;
		<%		
	}%>
	document.getElementById("gph").onclick=graph;
	document.getElementById("gph1").onclick=graph1;
	document.getElementById("dwd").onclick=download;
	document.getElementById("dwd1").onclick=download1;
}
	
function location2(){
	
		document.getElementById("loc2").classList.add("active");
		document.getElementById("loc1").classList.remove("active");
		
		<%
		if(st!=null &&ed!=null){
			%>
				document.getElementById("st1").value="<%=st%>";
				document.getElementById("ed1").value="<%=ed%>";
				document.getElementById("st2").value="<%=st1%>";
				document.getElementById("ed2").value="<%=ed1%>";
				<%
			}else{
				%>
			document.getElementById("st1").value="2018-06-12T19:30";
			document.getElementById("ed1").value="2018-06-12T19:30";
			document.getElementById("st2").value="2018-06-12T19:30";
			document.getElementById("ed2").value="2018-06-12T19:30";
			<%
			}
		tbl = user + "_loc2";
		rs1= stat.executeQuery("select * from (select * from loc2 order by datetime DESC LIMIT 10)abc order by datetime asc;");
		%>
		var rowCount = document.getElementById("temp").rows.length;
        for (var i = rowCount - 1; i > 0; i--) {
        	document.getElementById("temp").deleteRow(i);
        }
		var rowCount = document.getElementById("hum").rows.length;
        for (var i = rowCount - 1; i > 0; i--) {
        	document.getElementById("hum").deleteRow(i);
        }
        var i=1;
		<%
		while(rs1.next()){
			float temp = rs1.getFloat(2);
			float hum = rs1.getFloat(3);
			String date = (String)rs1.getString(1);
			%>
			
			var row =document.getElementById("temp").insertRow(i);
			var cell = row.insertCell(0);
			var cell1 = row.insertCell(1);
			cell.innerHTML = "<%=date%>";
			cell1.innerHTML = "<%=temp%>";
			var row1= document.getElementById("hum").insertRow(i);
			cell = row1.insertCell(0);
			cell1 = row1.insertCell(1);
			cell.innerHTML = "<%=date%>";
			cell1.innerHTML = "<%=hum%>";
			i++;
			<%
		}%>
		document.getElementById("gph").onclick=graphl2;
		document.getElementById("gph1").onclick=graph1l2;
		document.getElementById("dwd").onclick=downloadl2;
		document.getElementById("dwd1").onclick=download1l2;
	}



function graph() {
	document.getElementById("popup1").classList.remove("centered");
	
	<%
	
	//System.out.print(st);
	//SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	if(st!=null &&ed!=null){
	st=st.replace('T',' ');
	ed=ed.replace('T',' ');
	rs=stat.executeQuery("select * from loc1 where datetime between '"+st+"' and '"+ed+"' order by datetime;");
	rs2=rs;
	%>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	axisX:{
		valueFormatString: "DD MMM YYYY"
	},
	axisY: {
		title: "Temperature",
		includeZero: false,
	},
	data: [{
		type: "line",
		xValueFormatString: "DD MMM YYYY",
		color: "#F08080",
		toolTipContent: "{x} {indexLabel}: {y}",
		indexLabelMaxWidth: 1,
		indexLabelWrap: false,
		dataPoints: [
			<%
			while(rs.next()){
				float temp = rs.getFloat(2);
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy,MM,dd");
				java.sql.Date dt = rs.getDate(1);
				//System.out.println(dt);
			%>
			{ 
				x:new Date(<%=formatter.format(dt)%>),y: <%=temp%>, indexLabel: "."+"<%=rs.getTime(1)%>"},
			<%
			}
			%>
		]
	}]
});

chart.render();
<%}
	
	%>
	
}
function download(){
	var data = [
		<%
		st = request.getParameter("start");
		ed = request.getParameter("end");
		rs2=stat.executeQuery("select * from loc1 where datetime between '"+st+"' and '"+ed+"' order by datetime ;");
			while(rs2.next()){
				java.util.Date date=rs2.getDate(1);
				java.util.Date time=rs2.getTime(1);
				float temp =rs2.getFloat(2);
		%>
		   ['<%=date%>', '<%=time%>', '<%=temp%>'],
		  <%}
		%>
		];
	var csv = 'Date,Time,Temperature\n';
    data.forEach(function(row) {
            csv += row.join(',');
            csv += "\n";
    });
    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';
    hiddenElement.download = 'temp_gateway1.csv';
    hiddenElement.click();
}
function graph1() {
	document.getElementById("popup2").classList.remove("centered");
	
	
	<%
	
	rs= null;
	stat = con.createStatement();
	if(st!=null &&ed!=null){
	st=st.replace('T',' ');
	ed=ed.replace('T',' ');
	rs=stat.executeQuery("select * from loc1 where datetime between '"+st1+"' and '"+ed1+"' order by datetime ;");
	%>
var chart = new CanvasJS.Chart("chartContainer1", {
	animationEnabled: true,
	theme: "light2",
	axisX:{
		valueFormatString: "DD MMM YYYY"
	},
	axisY: {
		title: "Humidity",
		includeZero: false,
	},
	data: [{
		type: "line",
		xValueFormatString: "DD MMM YYYY",
		color: "#F08080",
		toolTipContent: "{x} {indexLabel}: {y}",
		indexLabelMaxWidth: 1,
		indexLabelWrap: false,
		dataPoints: [
			<%
			while(rs.next()){
				float temp = rs.getFloat(3);
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy,MM,dd");
				java.sql.Date dt = rs.getDate(1);
				//System.out.println(dt);
			%>
			{ 
				x:new Date(<%=formatter.format(dt)%>),y: <%=temp%>, indexLabel: "."+"<%=rs.getTime(1)%>"},
			<%
			}
			%>
		]
	}]
});

chart.render();
<%}

%>
}
function download1(){
	var data = [
		<%
		st = request.getParameter("start1");
		ed = request.getParameter("end1");
		rs2=stat.executeQuery("select * from loc1 where datetime between '"+st1+"' and '"+ed1+"' order by datetime ;");
			while(rs2.next()){
				java.util.Date date=rs2.getDate(1);
				java.util.Date time=rs2.getTime(1);
				float temp =rs2.getFloat(3);
		%>
		   ['<%=date%>', '<%=time%>', '<%=temp%>'],
		  <%}
		%>
		];
	var csv = 'Date,Time,Humidity\n';
    data.forEach(function(row) {
            csv += row.join(',');
            csv += "\n";
    });
    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';
    hiddenElement.download = 'hum_gateway1.csv';
    hiddenElement.click();
}

function graphl2() {
	document.getElementById("popup1").classList.remove("centered");
	
	<%
	
	//System.out.print(st);
	//SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	if(st!=null &&ed!=null){
	st=st.replace('T',' ');
	ed=ed.replace('T',' ');
	rs=stat.executeQuery("select * from loc2 where datetime between '"+st+"' and '"+ed+"' order by datetime;");
	rs2=rs;
	%>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	axisX:{
		valueFormatString: "DD MMM YYYY"
	},
	axisY: {
		title: "Temperature",
		includeZero: false,
	},
	data: [{
		type: "line",
		xValueFormatString: "DD MMM YYYY",
		color: "#F08080",
		toolTipContent: "{x} {indexLabel}: {y}",
		indexLabelMaxWidth: 1,
		indexLabelWrap: false,
		dataPoints: [
			<%
			while(rs.next()){
				float temp = rs.getFloat(2);
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy,MM,dd");
				java.sql.Date dt = rs.getDate(1);
				//System.out.println(dt);
			%>
			{ 
				x:new Date(<%=formatter.format(dt)%>),y: <%=temp%>, indexLabel: "."+"<%=rs.getTime(1)%>"},
			<%
			}
			%>
		]
	}]
});

chart.render();
<%}

%>	
}
function downloadl2(){
	var data = [
		<%
		st = request.getParameter("start");
		ed = request.getParameter("end");
		rs2=stat.executeQuery("select * from loc2 where datetime between '"+st+"' and '"+ed+"' order by datetime ;");
			while(rs2.next()){
				java.util.Date date=rs2.getDate(1);
				java.util.Date time=rs2.getTime(1);
				float temp =rs2.getFloat(2);
		%>
		   ['<%=date%>', '<%=time%>', '<%=temp%>'],
		  <%}
		%>
		];
	var csv = 'Date,Time,Temperature\n';
    data.forEach(function(row) {
            csv += row.join(',');
            csv += "\n";
    });
    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';
    hiddenElement.download = 'temp_gateway1.csv';
    hiddenElement.click();
}
function graph1l2() {
	document.getElementById("popup2").classList.remove("centered");
	
	
	<%
	
	rs= null;
	stat = con.createStatement();
	if(st!=null &&ed!=null){
	st=st.replace('T',' ');
	ed=ed.replace('T',' ');
	rs=stat.executeQuery("select * from loc2 where datetime between '"+st1+"' and '"+ed1+"' order by datetime ;");
	%>
var chart = new CanvasJS.Chart("chartContainer1", {
	animationEnabled: true,
	theme: "light2",
	axisX:{
		valueFormatString: "DD MMM YYYY"
	},
	axisY: {
		title: "Humidity",
		includeZero: false,
	},
	data: [{
		type: "line",
		xValueFormatString: "DD MMM YYYY",
		color: "#F08080",
		toolTipContent: "{x} {indexLabel}: {y}",
		indexLabelMaxWidth: 1,
		indexLabelWrap: false,
		dataPoints: [
			<%
			while(rs.next()){
				float temp = rs.getFloat(3);
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy,MM,dd");
				java.sql.Date dt = rs.getDate(1);
				//System.out.println(dt);
			%>
			{ 
				x:new Date(<%=formatter.format(dt)%>),y: <%=temp%>, indexLabel: "."+"<%=rs.getTime(1)%>"},
			<%
			}
			%>
		]
	}]
});

chart.render();
<%}

%>	
}
function download1l2(){
	var data = [
		<%
		st = request.getParameter("start1");
		ed = request.getParameter("end1");
		rs2=stat.executeQuery("select * from loc2 where datetime between '"+st1+"' and '"+ed1+"' order by datetime ;");
			while(rs2.next()){
				java.util.Date date=rs2.getDate(1);
				java.util.Date time=rs2.getTime(1);
				float temp =rs2.getFloat(3);
		%>
		   ['<%=date%>', '<%=time%>', '<%=temp%>'],
		  <%}
		%>
		];
	var csv = 'Date,Time,Humidity\n';
    data.forEach(function(row) {
            csv += row.join(',');
            csv += "\n";
    });
    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';
    hiddenElement.download = 'hum_gateway1.csv';
    hiddenElement.click();
}
</script>

</html>
