<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>transaction_detail</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/team_one/resources/css/vendors/feather/feather.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="/team_one/resources/css/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="/team_one/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="/team_one/resources/css/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/team_one/resources/css/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/team_one/resources/css/images/favicon.png" />
<script type="text/javascript">
   $(function(){
      $('#back').click(function(){
    	  
          window.history.back();
       });      
      
      $('#transaction_print').click(function(){
    	  
          window.print();
       });      
   });
</script>
<script>
    
    var initBodyHtml;

    function beforePrint() {
        initBodyHtml = document.body.innerHTML;
        document.body.innerHTML = document.getElementById('print').innerHTML;
    }
    function afterPrint() {
        document.body.innerHTML = initBodyHtml;
    }

    window.onbeforeprint = beforePrint;
    window.onafterprint = afterPrint;
    
</script>
<style type="text/css">
	@media print {
	  #print{
	
	    width: 210mm;
	    height: 297mm;
	    margin: 30mm 45mm 30mm 45mm;
	}
	@page {
	
	 size: A4 landscape;
	  margin:0;
	}
	@media print
	{
	    .btn
	    {
	        display: none !important;
	    }
	}
</style>
</head>
<body>
  <div class="container-scroller"> 
  
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      
<div style="padding-left:10"><br>
	<table border="0" align="center">
      <tbody>
      <tr>
        <td colspan="2" align="center">
          <table border="1" cellpadding="2" cellspacing="0" width="100%" bordercolorlight="black" bordercolordark="#FFFFFF" style="border:2px solid #0000ff;">
            <tbody>
            <tr>
              <td colspan="4" align="center" height="50"><font size="6" color="black"><b>거래명세서</b></font></td>
            </tr>
            <tr>
              <td colspan="4">
                <table width="100%" border="1" cellspacing="0" cellpadding="2" bordercolorlight="black" bordercolordark="#FFFFFF" background="./img/admin/stamp.gif" style="background-repeat:no-repeat;">
                  <tbody><tr>
                    <td rowspan="4" width="20" align="center"><font color="blue">공<br>급<br>자</font></td>
                    <td width="64"><font color="blue">등록번호</font></td>
                    <td width="225" colspan="4">&nbsp;211654321 </td>
                    <td rowspan="4" width="21" align="center"><font color="blue">공<br>급<br>받<br>는<br>자</font></td>
                    <td width="62"><font color="blue">등록번호</font></td>
                    <td width="264" colspan="4">&nbsp;25102142</td>
                  </tr>
                  <tr>
                    <td width="64"><font color="blue">상 호<br>(법인명)</font></td>
                    <td colspan="2" width="106">&nbsp;(주) 푸른하늘</td>
                    <td width="19"><font color="blue">성<br>명</font></td>
                    <td width="88">&nbsp;김대황</td>
                    <td width="62"><font color="blue">상 호<br>(법인명)</font></td>
                    <td colspan="2" width="133">&nbsp;(주)천호테크</td>
                    <td width="19"><font color="blue">성<br>명</font></td>
                    <td width="100">&nbsp;이효신</td>
                  </tr>
                  <tr>
                    <td width="64"><font color="blue">사업장<br>주 소</font></td>
                    <td colspan="4" width="225">&nbsp;서울 도봉구 방학동 322-41 중세빌딩7층 2호</td>
                    <td width="62"><font color="blue">사업장<br>주 소</font></td>
                    <td colspan="4" width="264">&nbsp;울산 남구 삼산동 화성 아데라움 4-102</td>
                  </tr>
                  <tr>
                    <td width="64"><font color="blue">업 태</font></td>
                    <td width="82">&nbsp;서비스</td>
                    <td width="18"><font color="blue">종<br>목</font></td>
                    <td colspan="2" width="113">&nbsp;온라인 쇼핑</td>
                    <td width="62"><font color="blue">업 태</font></td>
                    <td width="109">&nbsp;서비스</td>
                    <td width="18"><font color="blue">종<br>목</font></td>
                    <td colspan="2" width="125">&nbsp;전자부품</td>
                  </tr>
                </tbody></table>
              </td>
            </tr>
            <tr>
              <td align="center" height="25"><font color="blue">작 &nbsp;&nbsp;성</font></td>
              <td align="center"><font color="blue">공 &nbsp;&nbsp;급 &nbsp;&nbsp;가&nbsp;&nbsp;액</font></td>
              <td align="center"><font color="blue">세 &nbsp;&nbsp;액</font></td>
              <td align="center"><font color="blue">비 &nbsp;&nbsp;고</font></td>
            </tr>
            <tr>
              <td height="45" align="center">&nbsp;2007/05/21</td>
              <td height="45" align="right">&nbsp;135,000&nbsp;&nbsp;</td>
              <td height="45" align="right">&nbsp;13,500&nbsp;&nbsp;</td>
              <td height="45" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" height="86">
                <table border="1" cellpadding="1" cellspacing="0" width="100%" bordercolorlight="blue" bordercolordark="#FFFFFF">
                  <tbody><tr align="center">
                    <td><font color="blue">월</font></td>
                    <td><font color="blue">일</font></td>
                    <td><font color="blue">품 목</font></td>
                    <td><font color="blue">규 격</font></td>
                    <td><font color="blue">수 량</font></td>
                    <td><font color="blue">단 가</font></td>
                    <td><font color="blue">공 급 가 액</font></td>
                    <td><font color="blue">세 액</font></td>
                    <td><font color="blue">비 고</font></td>
                  </tr>
                  <tr>
                    <td align="center">&nbsp;05</td>
                    <td align="center">&nbsp;21</td>
                    <td>&nbsp;CTEX 5892</td>
                    <td>&nbsp;</td>
                    <td align="center">&nbsp;1</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;135,000&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;13,500&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="center">&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody></table>
              </td>
            </tr>
            <tr>
              <td colspan="4">
                <table border="1" cellpadding="1" cellspacing="0" width="100%" bordercolorlight="blue" bordercolordark="#FFFFFF">
                  <tbody><tr align="center">
                    <td><font color="blue">합 계 금 액</font></td>
                    <td><font color="blue">현 금</font></td>
                    <td><font color="blue">수 표</font></td>
                    <td><font color="blue">어 음</font></td>
                    <td><font color="blue">외 상 미 수 금</font></td>
                    <td rowspan="2" width="120" align="center"><font color="blue">이 금액을 영수 함.<br></font></td>
                  </tr>
                  <tr align="center">
                    <td>&nbsp;148,500</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </tbody></table>
              </td>
            </tr>
          </tbody></table>
        </td>
      </tr>
      <tr>
        <td align="left"><img src="./img/admin/point4.gif" align="absmiddle"> <font color="blue">22226-28131일'96.3.27승인</font></td>
        <td align="right"><img src="./img/admin/point4.gif" align="absmiddle"> <font color="blue">인쇄용지(특급)34g/m 182mm*128mm</font></td>
      </tr>
  </tbody></table>
</div>
      
    </div>
       <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="/team_one/resources/css/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/team_one/resources/css/vendors/chart.js/Chart.min.js"></script>
  <script src="/team_one/resources/css/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="/team_one/resources/css/vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="/team_one/resources/css/js/off-canvas.js"></script>
  <script src="/team_one/resources/css/js/hoverable-collapse.js"></script>
  <script src="/team_one/resources/css/js/template.js"></script>
  <script src="/team_one/resources/css/js/settings.js"></script>
  <script src="/team_one/resources/css/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="/team_one/resources/css/js/dashboard.js"></script>
  <script src="/team_one/resources/css/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
