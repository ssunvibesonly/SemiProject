<<<<<<< HEAD
=======
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.SeatDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.SeatDao"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
>>>>>>> goyoung
<%@page import="Dto.ReservationDto"%>
<%@page import="Dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<<<<<<< HEAD
=======
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
>>>>>>> goyoung
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  /* background-color: #242333; */
  display: flex;
  flex-direction: column;
  color: gray;
  align-items: center;
  justify-content: center;
<<<<<<< HEAD
  height: 100vh;
=======
  /* height: 100vh; */
>>>>>>> goyoung
  /* font-family: 'Lato', 'sans-serif'; */
}

.movie-container{
   margin: 20px 0; 
<<<<<<< HEAD
=======
   display: flex;
   justify-content: center;
   color: white;
>>>>>>> goyoung
}

.movie-container select {
   margin-right: 20px;
  /* background-color: #fff; */
  border: 1;
  border-radius: 5px;
  font-size: 14px;
  margin-left: 10px;
  padding: 5px 15px 5px 15px;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
}

<<<<<<< HEAD
.seat {
  background-color: #444451;
  height: 12px;
  width: 15px;
  margin: 3px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
=======
.refSeat{
   background-color: orange;
   border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    height: 30px;
    width: 30px;
}

.selSeat{
   background-color: red;
   border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    height: 30px;
    width: 30px;
>>>>>>> goyoung
}

.seat.selected {
  background-color: red;
}

.seat.occupied {
<<<<<<< HEAD
  background-color: #fff;
=======
	width:30px;
	height:30px;
   border-top-left-radius: 10px;
  border-top-right-radius: 10px; 
  background-color: white;
  
>>>>>>> goyoung
}

.seat:nth-of-type(2) {
  margin-right: 18px;
}

.seat:nth-last-of-type(2) {
  margin-left: 18px;
}

.seat:not(.occupied):hover {
  cursor: pointer;
  transform: scale(1.2);
}

.showcase {
<<<<<<< HEAD
  background-color: gray;
  padding: 5px 10px;
=======
  
>>>>>>> goyoung
  border-radius: 5px;
  color: white;
  list-style-type: none;
  display: flex;
<<<<<<< HEAD
  justify-content: space-between;
}

.showcase li {
  display: flex;
=======

}

.showcase li {
>>>>>>> goyoung
  align-items: center;
  justify-content: center;
  margin: 0 10px;
}

.showcase li small {
  margin-left: 10px;
}

.screen {
<<<<<<< HEAD
  background-color: black;
=======
  background-color: white;
>>>>>>> goyoung
  height: 70px;
  width: 100%;
  margin: 15px 0;
  transform: rotateX(-45deg);
<<<<<<< HEAD
  box-shadow: 0 3px 10px gray;
=======
  box-shadow: 0 5px 5px gray;
>>>>>>> goyoung
}

.container {
  perspective: 1000px;
  margin-bottom: 30px;
}

.seat {
<<<<<<< HEAD
  background-color: gray;
  height: 12px;
  width: 15px;
  margin: 3px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
=======
  background-color: orange;
  height: 30px;
  margin: 3px;
  color: white;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  display: flex;
  justify-content: center;
>>>>>>> goyoung
}

.row {/* 좌석 가운데 정렬*/
  display: flex;
  justify-content: center;
}

/*영화정보css*/
#select_info{

<<<<<<< HEAD
position:absolute;
=======
background-color:white;
>>>>>>> goyoung
border:2px solid gray;
top:750px;
left:200px;
width:1200px;
height:300px;
}

div.poster{
 
 width:200px;
 height:250px;
 position:absolute;
 top:25px;
 left:25px;
}

div.mvinfo{
position:absolute;
top:25px;
left:250px;
width:250px;
height:100px;

}

div.clickinfo{
position:absolute;
top:25px;
left:570px;
width:200px;
height:100px;

}
<<<<<<< HEAD
</style>
</head>
<body>
<div class="movie-container">
      <label>성인:</label>
      <select id="adult">
=======

ul li{
   list-style-type: none;
}

</style>
<%
   ReservationDao dao = new ReservationDao();
   //가장최신에 예약중인 예약페이지의 좌석을 선택하기 위해
   int num = dao.maxNum();
   //System.out.println(num);
   ReservationDto dto = dao.getData(num);
   
   //System.out.println(dto.getMv_no());
   MovieDao mdao = new MovieDao();
   MovieDto mdto = mdao.getPrice(dto.getMv_no());
   int adultPrice = mdto.getMv_adult();
   int teenPrice = mdto.getMv_teen();
   int childPrice = mdto.getMv_child();
   
   //System.out.println(adultPrice+","+ teenPrice+","+ childPrice);
   
   //사전에 예매된 좌석들을 가져오기
   SeatDao sdao = new SeatDao();
   List<SeatDto> list = sdao.getSeats();
   
   String occupiedSeats="";
   
   for(int i=0; i<list.size(); i++){
      occupiedSeats+=list.get(i).getSeat_name()+",";
   }
   
   String[] seats = occupiedSeats.split(",");
   
%>
<script type="text/javascript">
$(function(){
   
   //사전에 예매된 좌석들에 occupied 클래스 적용
   <%
      for(int i=0; i<seats.length; i++){
         %>
         var seat = $("#<%=seats[i]%>");
         if(seat){
            seat.addClass("occupied");
         }
         <%
      }
   %>
   
   
   
   var adult=0;
   var teen=0;
   var child=0;
   var adultPrice=<%=adultPrice%>;
   var teenPrice=<%=teenPrice%>;
   var childPrice=<%=childPrice%>;
   var totalPrice=0;
   var total=0;//총 선택한 좌석개수
   var arr=[];
   //alert(arr.length);
   
   
   //선택한 성인인원 값 가져오기
   document.getElementById("adult").onchange=function(){
      
      if(adult!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(adult);
         }
      }
      
      //total-=adult;
      adult=parseInt($(this).val());
      total+=adult;
      $("#adultCnt").text(adult);
      
      totalPrice+=adult*adultPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }

   //선택한 청소년인원 값 가져오기
   document.getElementById("teen").onchange=function(){
      
      if(teen!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(teen);
         }
      }
      
      //total-=teen;
      teen=parseInt($(this).val());
      total+=teen;
      $("#teenCnt").text(teen);
      
      totalPrice+=teen*teenPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }
   
   //선택한 아동인원 값 가져오기
   document.getElementById("child").onchange=function(){
      
      if(child!=0){
         var a = confirm("정말 변경하시겠습니까?");
         if(a){
            location.reload();
         }else{
            $(this).val(child);
         }
      }
      
      //total-=child;
      child=parseInt($(this).val());
      total+=child;
      $("#childCnt").text(child);
      
      totalPrice+=child*childPrice;
      $("#totalPrice").text(totalPrice);
      //alert(totalPrice);
      //alert(total);
   }
   
   
   $("div.seat").click(function(){
      var bc = $(this).attr("class");
      var seatName = $(this).text();
      
      if(total==0){
         alert("좌석을 선택해 주세요.");
         return;
      }
      
      //총 인원보다 많은 좌석을 선택했을 때
      if(total==arr.length){
         alert("이미 좌석을 모두 선택하셨습니다.");
         var a = confirm("좌석을 다시 선택하시겠습니까?");
         if(a){
            location.reload();
         }
      }else{
         $(this).toggleClass("selected");
         
         //선택한 좌석수 보다 많은 좌석을 선택시 경고창
         if(bc=="seat"){
            arr.push(seatName);
            //alert(arr);
         }else{
            //seatName에 해당하는 index값을 찾음
            const idx = arr.indexOf(seatName);
            //index번째에서 1개를 삭제
            arr.splice(idx, 1);
            /* arr.pop(seatName); */
            //alert(arr);
         }
         
         //선택한 좌석을 정렬
         $("#selectedSeat").text(arr.sort());
      }
            
   });
   
   
   //좌석선택버튼 클릭시
   $("#seatBtn").click(function(){
      var adultCnt = $("#adultCnt").text();
      var teenCnt = $("#teenCnt").text();
      var childCnt = $("#childCnt").text();
      var totalPrice = $("#totalPrice").text();
      var selectedSeat = $("#selectedSeat").text();
      var rev_no = <%=dto.getRev_no()%>;
      
      $.ajax({
         type:"post",
         url:"seatInsert.jsp",
         data:{"adultCnt":adultCnt,"teenCnt":teenCnt,"childCnt":childCnt,"totalPrice":totalPrice,"selectedSeat":selectedSeat,"rev_no":rev_no},
         dataType:"json",
         success:function(res){
            alert("insert success");
            location.href="payment.jsp?seat_no="+res.seat_no;
         }
      });
      
   });
   
   
});

</script> --%>
</head>
<body>
<br><hr style="color: white;"><br>
<div class="movie-container">
      <label>성인:</label>
      <select id="adult">
         <option value="0">0</option>
>>>>>>> goyoung
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
      <label>청소년:</label>
      <select id="teen">
<<<<<<< HEAD
=======
         <option value="0">0</option>
>>>>>>> goyoung
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
       <label>아동:</label>
      <select id="child">
<<<<<<< HEAD
=======
         <option value="0">0</option>
>>>>>>> goyoung
       <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    </div>
    
<<<<<<< HEAD
    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>N/A</small>
      </li>

      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>

      <li>
        <div class="seat occupied"></div>
        <small>Occupied</small>
      </li>
    </ul>
    
   <div class="container">
    <div class="screen"></div>
    <table class="table table-bordered">
=======
    <div class="container" style="width: 300px;height: 50px;">
    <ul class="showcase" >
      <li>
        <div class="refSeat" style="margin-top: 10px;margin-bottom: 3px;margin-left: 7px;"></div>
        <small >N/A</small>
      </li>

      <li>
        <div class="selSeat" style="margin-top: 10px;margin-left: 30px;margin-bottom: 3px;"></div>
        <small>&nbsp;&nbsp;Selected</small>
      </li>

      <li>
        <div class="seat occupied" style="margin-top: 10px;margin-left: 22px;margin-right: 200px;"></div>
        <small>Occupied</small>
      </li>
    </ul>
    </div>
    
   <div class="container">
    <div class="screen" style="text-align: center;font-size: 35pt;margin-top: 30px;margin-bottom: 30px;">SCREEN</div>
>>>>>>> goyoung
    <%
       for(int i=65; i<75; i++){%>
       <div class="row">
       <%
          for(int j=1; j<9; j++){%>
<<<<<<< HEAD
             <div class="seat"><%=(char)i %><%=j %></div>
=======
             <div class="seat" id="<%=(char)i %><%=j %>" style="width: 30px;"><b><%=(char)i %><%=j %></b></div>
>>>>>>> goyoung
          <%}
       %>
       </div>
       <%}
    %>
<<<<<<< HEAD
    </table>
   </div>
    
     <p class="text">
      선택 좌석: <span id="count">0</span>&nbsp; 가격: &nbsp;<span id="total">0</span>원
    </p>

<%
   ReservationDao dao = new ReservationDao();
   int num = dao.maxNum();
   //System.out.println(num);
   ReservationDto dto = dao.getData(num);
%>

<form action="#" method="post">
<div id="select_info">

<div class="poster" id="poster"><%=dto.getRev_poster() %></div>

<div class="mvinfo">
<span>영화명<b id="mvtitle" class="mvtitle"><%=dto.getRev_title() %></b></span>
<br><br>
<span>관람연령</span>&nbsp;<img src="<%=dto.getRev_age() %>" id="mvage">
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>


<div class="clickinfo">
<span>극장&nbsp;<b>'3'CINE&nbsp;</b><b id="mvcinema"><%=dto.getRev_name() %></b></span>
<br><br>
<span>일시&nbsp;&nbsp;</span><b id="mvdate"><%=dto.getRev_date() %></b>
<br><br>
<span>상영관&nbsp;&nbsp;<b id="mvplace"><%=dto.getRev_place() %></b></span>
<br><br>
<span>인원&nbsp;&nbsp;<b>인원</b></span>
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>

<input type="button" value="좌석선택" class="btn btn-outline-success" id="seatBtn" style="float: right; width: 150px; height: 150px; margin: 20px;">
</div>

</form>
=======
   </div>


<div class="container">
<div id="select_info" class="container" style="clear: both;">

<div class="poster" id="poster" style="float: left;" ><%=dto.getRev_poster() %></div>

<div class="mvinfo" style="float: left;">
영화명<b id="mvtitle" class="mvtitle"><%=dto.getRev_title() %></b>
<br><br>
관람연령&nbsp;<img src="<%=dto.getRev_age() %>" id="mvage" style="width: 40px;">
</div>


<div class="clickinfo" >
극장&nbsp;<b>'3'CINE&nbsp;</b><b id="mvcinema"><%=dto.getRev_name() %></b><br><br>
일시&nbsp;&nbsp;<b id="mvdate"><%=dto.getRev_date() %></b><br><br>
상영관&nbsp;&nbsp;<b id="mvplace"><%=dto.getRev_place() %></b><br><br>
인원&nbsp;&nbsp;<b>성인:</b><b>&nbsp;청소년:</b><b>&nbsp;아동:</b>
좌석&nbsp;&nbsp;<b>좌석출력</b>
가격&nbsp;&nbsp;<b>가격출력</b>
</div>


<input type="button" value="좌석선택" class="btn btn-outline-success" id="seatBtn" style="float: right; width: 150px; height: 150px; margin: 20px;">
</div>
</div>

>>>>>>> goyoung
</body>
</html>