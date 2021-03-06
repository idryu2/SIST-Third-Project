<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/rank.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<!--   <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 
<script type="text/javascript" src="http://static.melon.co.kr/static/web/resource/script/w1/9s/n/15h0261uk9.js"></script>
<script type="text/javascript">document.domain='melon.com';</script> -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

     
    $('.genie').click(function(){
        
        $('ul.list').html('');
        $('.list').append("<c:forEach var='vo' items='${gchart }'><div class='list-item-item' style='border: outset #eee; background: aliceblue;'><p class='list-item-link' style='font-weight: bold;'>${vo.rank }.&nbsp;&nbsp;${vo.titles }</p><div class='list-item-subtext-div' style='text-align: right; margin: -10px 5px 2px 0px;'><span class='item-list-subtext' style=''>${vo.artists }</span></div></div></c:forEach>");
    });
    
    $('.bill').click(function(){
        $('ul.list').html("");
        $('.list').append("<c:forEach var='vo' items='${bchart }'><div class='list-item-item' style='border: outset #eee; background: aliceblue;'><p class='list-item-link' style='font-weight: bold;'>${vo.rank }.&nbsp;&nbsp;${vo.titles }</p><div class='list-item-subtext-div' style='text-align: right; margin: -10px 5px 2px 0px;'><span class='item-list-subtext' style=''>${vo.artists }</span></div></div></c:forEach>");    
    });
    
    emo_click();
    gen_click();
    
    
    $('.btn-success').click(function(){
            var btn=$('.list-item').attr('id');
            
            if(btn=='emolist')
            {
                $('ul.filter-list').html("");
                   $('.filter-list').append("<c:forEach var='vo' items='${glist }'><li class='list-item' id='genlist'><button type='button' class='btn btn-sm btn-default day gen' value='${vo.genre}'>${vo.genre}</button></li></c:forEach>")
                   gen_click();
            }
            else if(btn=='genlist')
            {
                $('ul.filter-list').html("");
                   $('.filter-list').append("<c:forEach var='vo' items='${elist }'><li class='list-item' id='emolist'><button type='button' class='btn btn-sm btn-default day emo' id='btn-emo' value='${vo.emotion}'>${vo.emotion}</button></li></c:forEach>")
                   emo_click(); 
            }
    });
    

});

function gen_click(){
   $('.gen').click(function(){
      
      var gen=$(this).attr('value');
//       alert(gen);
      
      if(gen=='댄스')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dance }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='발라드')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${balad }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='랩/힙합')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${raphip }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='알앤비/소울')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${rnb }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='락')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${rock }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='일랙트랙')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${elec }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='포크')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${fork }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(gen=='팝')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${popp }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      });
   
}
function emo_click(){
   $('.emo').click(function(){
      var emo=$(this).attr('value');
//       alert(emo);

      if(emo=='신나는')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${playful }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
         
      }
      else if(emo=='경쾌한')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${light }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      
      }
      else if(emo=='사랑으로')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${love }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='편안한')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${peace }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='몽환적')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dreamy }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='감성적')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${emotional }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      else if(emo=='어두운')
      {
         $('ul.emosongti').html("");
         $('ul.emosongti').append("<c:forEach var='vo' items='${dark }'><div style='width: 100%'><p style='width: 10%;float: left;text-align: center; border-right: 1px solid black;'>${vo.no }</p><p style='width: 45%;float: left;text-align: center;border-right: 1px solid black;'>${vo.title }</p><p style='width: 25%;float: left;text-align: center;border-right: 1px solid black;'>${vo.artist }</p><p style='width: 20%;float: left;text-align: center;'>${vo.album }</p></div><br/></c:forEach>");
      }
      
      });
   }


</script>
</head>
<body>
<div style="position: relative;
    margin: auto;
    width: 85%;
    height: 600px;
    top: 15px;
    float: inherit;
    border-radius: 15px;
    background: white;
    opacity: 0.85;
    box-shadow: 5px 5px 5px #AAA;">

    <div style="width: 30%;height: 100%;float: left;">
        <div class="container" style="width: 100%; height: 100%; float: left;">
            <div style=" width: 100%; height: 5%; float: left;">
                <input type="button"  class="genie" value="Genie Top50" style="width: 50%;float: left; border-radius: 5px; background: #EEE;">
                <input type="button"  class="bill" value="Billboard Top50" style="width: 50%;float: left; border-radius: 5px; background: #EEE;">   
            </div>
            <br/>
            <div style="width: 100%;height: 95%; float: left;">    
                <span class="counter"></span>
                <div class="list-wrap" style="height: 100%;">
                       <ul class="list" style="height: 100%; padding-left: 3px;">
                           <c:forEach var="vo" items="${gchart }">
                                 <div class="list-item-item" style="border: outset #eee; background: aliceblue;">
                                  <p class="list-item-link" style="font-weight: bold;">${vo.rank }.&nbsp;&nbsp;${vo.titles }</p>
                                      <div class="list-item-subtext-div" style="text-align: right; margin: -10px 5px 2px 0px;"><span class="item-list-subtext" style="">${vo.artists }</span></div>
                              </div>
                           </c:forEach>
                      </ul>
                 </div>
             </div>
           </div>
    </div>

    <div  style="width: 70%;height: 100%;float: right;">    
        <div class="box" style="float: right; width: 95%; height: 15%">
            <div class="day-filter" style="height: 100%">
                <button type="button" class="btn btn-sm btn-success btn-prev"><i class="fa fa-angle-left"></i></button>
                <button type="button" class="btn btn-sm btn-success btn-next"><i class="fa fa-angle-right"></i></button>
            <div class="viewport" style="height: 100%">
                <ul class="filter-list" style="height: 74px; margin-top: 6px;">
                    <c:forEach var="vo" items="${elist }">
                        <li class="list-item" id='emolist'>
                            <button type="button" class="btn btn-sm btn-default day emo"  value="${vo.emotion }">${vo.emotion }</button>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            </div>
        </div>
        

        <div style="width: 100%; height: 77%; float: right;  ">
        
            <div id="listadd" style="width: 100%; height: 100%; float: right; border: 2px solid #eee;">
                <div style="height: 5%; width: 100%; float: right; color: white; background: #AAA; margin-bottom: 5px; font-weight: bold;">
                    <div style="height: 100%;"> 
                           <p style="width: 10%;float: left;text-align: center; border-right: 1px solid black;">N O</p>
                           <p style="width: 40%;float: left;text-align: center;border-right: 1px solid black;">곡    명</p>
                           <p style="width: 25%;float: left;text-align: center;border-right: 1px solid black;">아티스트</p>
                           <p style="width: 25%;float: left;text-align: center;">앨  범</p>
                      </div>
              </div>
              
              <div style="width: 100%; height: 90%; float: right; font-weight: bold; color: #33;">
                  <div style="overflow-y: scroll; height: 100%">
                       <ul class="emosongti" style="-webkit-padding-start: 0px;">
                           <c:forEach var="vo" items="${playful }">
                               <div style="width: 100%">
                                   <p style="width: 10%;float: left;text-align: center; border-right: 1px solid black;">${vo.no }</p>
                                   <p style="width: 40%;float: left;text-align: center;border-right: 1px solid black;">${vo.title }</p>
                                   <p style="width: 25%;float: left;text-align: center;border-right: 1px solid black;">${vo.artist }</p>
                                   <p style="width: 25%;float: left;text-align: center;">${vo.album }</p>
                               </div><br/>    
                           </c:forEach>
                       </ul>
                </div>
            </div>
        </div>
        
    </div>
    
    </div>
</div>
</body>
</html> 