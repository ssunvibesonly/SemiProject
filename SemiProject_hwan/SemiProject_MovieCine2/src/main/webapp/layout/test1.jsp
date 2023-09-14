<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>detail</title>
<style>
/* 스타일은 위에서 내려오는 순으로 적음 추가시 같은 위치쪽 삽입 */

b{
   color: white; <!-- b태그 글씨 색깔 -->
}

/* 디테일 큰 div */
.detailblock{
   width: 100%;
   height: 2035px;
   border: 10px solid white;
}

/* 디테일 내부 라인 div */
.detailall{
   position: absolute;
   right: 13.2%;
   left: 13.2%;
   width: 73.6%;
   height: 1950px;
   border: 10px solid white;
   margin-top: 50px;
}

/* 영화 포스터 div */
.detailposter{
   position: relative;
   left: 270px;
   width: 300px;
   height: 400px;
}

.detailposter img{
   width: 290px;
   height: 400px;
}

/* 영화 이름 div */
.detailtitle{
   position:absolute;
   top: 0px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
   font-size: 1.5em;
}

/* 영화 예매율 div border-bottom: 1px white; 추가 */
.detailreserve{
   color: white;
   position:absolute;
   top: 50px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
}

/* 장르, 개봉 div */
.detailinfo{
   color: white;
   position: absolute;
   top: 100px;
   left: 600px;
   width: 500px;
   height: 50px;
   border: 2px solid white;
}

/* 스토리 */
.detailstory{
   color: white;
   position: absolute;
   top: 500px;
   left: 270px;
   width: 830px;
   height: 500px;
   border: 2px solid white;
}

/* 예매하기 버튼 */
#detailbtn1{
   position: absolute;
   top: 355px;
   left: 600px;
   color: white;
   background-color: #DF3E49;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}
/* 이전으로 버튼 */
#detailbtn2{
   position: absolute;
   top: 355px;
   left: 710px;
   color: black;;
   background-color: white;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}

.detailcomment{
   position: absolute;
   top: 1100px;
   left: 270px;
   
}

.detailresult{
   position: absolute;
   top: 1400px;
   left: 170px;
   width: 1030px;
   height: 500px;
   border: 2px solid white;
   
 
   
}
i.penguin{
font-size: 23pt;
}
#writer{
color: magenta;
font-size: 18pt;
}

</style>
<script>
$(document).ready(function() {
 var currentPage = 1; // currentPage 변수를 정의하고 초기값을 설정합니다.


 // 페이지 로드가 완료된 후에 이 코드 블록이 실행됩니다.
 list(currentPage); // 페이지 로딩 시 초기 페이지인 1페이지의 데이터를 가져옵니다.


 


});
</script>
</head>
<%
	//절대경로잡기
	String root = request.getContextPath();
	
	
	//쿼리 파라미터에서 포스터 ID를 가져옵니다.
	String mv_no = request.getParameter("mv_no");
	String mv_title = request.getParameter("mv_title");
	String mv_poster = request.getParameter("mv_poster");
	String mv_st = request.getParameter("mv_st");
	String mv_genre = request.getParameter("mv_genre");
	String mv_opendate = request.getParameter("mv_opendate");
	
	
	//무비테이블
	MovieDao dao = new MovieDao();
	MovieDto dto = dao.getData(mv_no); //영화번호 가져온다
	
	//임의의 아이디사용, ref)회원탈퇴시 회원이 작성한 댓글이 자동으로 삭제될려면 member의 sequence번호가 필요함 but 선택사항
	/* String myid = (String)session.getAttribute("myid"); */
	String myid ="hwan";
	
%>

<body>
<!-- 큰 div 영역 -->
<div class="detailblock">
   <!-- 출력할 컨텐츠 영역 -->
   <div class="detailall">
      <div class="detailposter"><b><img src="<%=dto.getMv_poster()%>"></b></div>
      <div class="detailtitle"><b>영화제목 : <%=dto.getMv_title() %></b></div>
      <div class="detailreserve">예매율 (border-bottom 1px white 추가)</div>
      <div class="detailinfo">장르 : <%=dto.getMv_genre() %><br>개봉 : <%=dto.getMv_opendate() %></div>
      <div class="detailstory"><%=dto.getMv_st() %></div>
      <button type="button" id="detailbtn1" onclick="location='<%=root%>/index.jsp?main=Movie_reserve/movielist.jsp'">예매하기</button>
      <button type="button" id="detailbtn2" onclick="back()">이전으로</button>
      
   
      <!-- 댓글 입력 -->
      <div class="detailcomment">   
      <form>
      <%-- <input type="hidden" id="idx" value="<%=idx%>"> --%>
      <input type="hidden" id="mv_no" value="<%=mv_no %>"> 
         <table class="table table-bordered" style="width:600px; height: 250px;">
         <caption align="top"><b>댓글 입력</b></caption>
            <tr>
               <th align="center" valign="middle" style="width: 150px;">작성자</th>
               <td>
               <%=myid %>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle" style="width: 100px;">댓글작성</th>
               <td>
               <textarea style="width: 290px; height: 80px;"
                  id="content" class="form-control"></textarea>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle" style="width: 100px;">별점</th>
               <td>
               <select name="star" id="star" style="width:100px;">
                  <option value="1">★</option>
                  <option value="2">★★</option>
                  <option value="3">★★★</option>
                  <option value="4">★★★★</option>
                  <option value="5" selected>★★★★★</option>
               </select>
               </td>
            </tr>
            
            <tr>
               <th align="center" valign="middle">댓글등록</th>
               <td colspan="2">
                  <button type="button" class="btn btn-outline-danger" id="btntest"><i class="bi bi-tencent-qq penguin"></i></button>
               </td>
            </tr>
         </table>
      </form>
      </div>
      <div class="detailresult"><b>댓글출력</b></div>
         <table class="table table-bordered" style="width:1000px;">
         <caption align="top"></caption>
         </table>
   </div>
</div>
<script type="text/javascript">

   list();
   
   //insert
      $("#btntest").click(function(){
         
         var content=$("#content").val();
         var star=$("#star").val(); 
         
         $.ajax({
            url: "answer/addanswer.jsp",
            type: "post",
            dataType:"html",
            data:{"content":content,"star":star,"num":<%=mv_no%>},
         success:function(res){
            
            $("#content").val("");
            $("#star").val("");
         }
         
         });
   });
      
   // list 함수에서 pagination 컨트롤을 그리고 데이터를 가져오도록 수정
      function list(currentPage){
        /* var num = $("#num").val(); */
        //alert("list_open");
       $.ajax({
          type: "get",
          url: "answer/listBoard.jsp",
          data: {"num": <%=mv_no%>, "currentPage": currentPage},
          dataType: "json",
          success: function(data){
       	  	
        	  
        	var startPage="";
        	var endPage="";
        	var totalPage="";
 
            var s = "<table class='table table-bordered' style='width:700px'>";
            s += "<caption align='top'><b>댓글목록</b></caption>";
            s += "<tr class='table-info'>";
            s += "<th width='60'>번호</th>";
            s += "<th width='100'>아이디</th>";
            s += "<th width='60'>내용</th>";
            s += "<th width='100'>별점</th>";
            s += "<th width='160'>작성일</th>";
            s += "</tr>";

            if (data.length == 0) {
              s += "<tr>";
              s += "<td colspan='4' align='center'>";
              s += "<b>댓글이 없습니다</b>";
              s += "</td></tr>";
            } else {
              $.each(data, function(i, item){
            	
            	startPage=item.startPage;
            	endPage=item.endPage;
            	totalPage=item.totalPage;
            	
                s += "<tr>";
                s += "<td align='center'>"+(item.no-i)+"</td>"; //번호
                s += "<td>"+item.myid+"</td> "; //아이디
                s += "<td>"+item.content+"</td>"; //내용
                s += "<td>"+item.star+"</td>"; //평점
                s += "<td>"+item.writeday+"</td>"; //작성일 
                s += "</tr>";
              });
              
              s += "</table>";
            }
             //alert(startPage+","+endPage+","+totalPage);

              // pagination 컨트롤을 그리는 코드
              s += "<div style='width: 600px; text-align: center;'>";
              s += "<ul class='pagination justify-content-center'>";
			  
              //이전
              if (startPage >= 1 && currentPage > 1) {
              s += "<li class='page-item active'>";
              s += "<a class='page-link'><i class='bi bi-arrow-left prev' style='cursor:pointer;'></i></a>";
              s += "</li>";
              
           	  // 이전 버튼 클릭 이벤트 핸들러
              $('.detailresult').on('click', '.prev', function(){
                  if (currentPage > 1) {
                      currentPage -= 1; // 현재 페이지를 감소시킴
                      list(currentPage); // 페이지를 다시 불러옴
                  }
              });
              } 
              
              //숫자페이지
              for (var pp = startPage; pp <= endPage; pp++) {
                if (pp == currentPage) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                s += "</li>";
                } else {
                s += "<li class='page-item'>";
                s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                s += "</li>";
                }
                
                // 페이지번호 리스트 이벤트
                $('.detailresult').on('click', '.paging', function(){
                    currentPage = $(this).text().trim();
                    //alert(currentPage);
                    list(currentPage);
                });

              }
              
              //다음
               if (endPage <= totalPage && currentPage < totalPage) {
              s += "<li class='page-item active'>";
              s += "<a class='page-link'><i class='bi bi-arrow-right next' style='cursor:pointer;'></i></a>";
              s += "</li>";
              
              // 다음 버튼 클릭 이벤트 핸들러
              $('.detailresult').on('click', '.next', function(){
                  if (currentPage < totalPage) {
                      currentPage += 1; // 현재 페이지를 증가시킴
                      list(currentPage); // 페이지를 다시 불러옴
                  }
              });
               } 
              s += "</ul>";
              s += "</div>";
            

            }
          
            $(".detailresult").html(s);
            }
       		
        })
      }
</script>

</body>
</html>