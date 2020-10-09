$(function () {

  $(".chk_group").hide(0);
  $("#btn_gender").click(function () {
    $("#gender_group").slideToggle(200);
    $('#btn_gender').toggleClass('btn_toggle1');
  });

  $("#btn_strap").click(function () {
    $("#strap_group").slideToggle(200);
    $('#btn_strap').toggleClass('btn_toggle2');
  });
  $("#btn_size").click(function () {
    $("#size_group").slideToggle(200);
    $('#btn_size').toggleClass('btn_toggle1');
  });
  $("#btn_movement").click(function () {
    $("#movement_group").slideToggle(200);
    $('#btn_movement').toggleClass('btn_toggle2');
  });
  $("#btn_use").click(function () {
    $("#use_group").slideToggle(200);
    $('#btn_use').toggleClass('btn_toggle1');
  });
  $("#btn_price_range").click(function () {
    $("#price_range").slideToggle(200);
    $('#btn_price_range').toggleClass('btn_toggle2');
  });

});



var totalData = 300; // 총 데이터 수
var dataPerPage = 10; // 한 페이지에 나타낼 데이터 수
var pageCount = 5; // 한 화면에 나타낼 페이지 수

function paging(totalData, dataPerPage, pageCount, currentPage) {

  var totalPage = Math.ceil(totalData / dataPerPage); // 총 페이지 수
  var pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹

  var last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
  if (last > totalPage)
    last = totalPage;
  var first = last - (pageCount - 1); // 화면에 보여질 첫번째 페이지 번호
  var next = last + 1;
  var prev = first - 1;

  var $pingingView = $("#paging");

  var html = "";

  if (prev > 0)
    html += "<a href=# id='prev'>  <img src='assets/img/arrow/page_prev.png'></a> ";

  for (var i = first; i <= last; i++) {
    html += "<a href='#' id=" + i + ">" + i + "</a> ";
  }

  if (last < totalPage)
    html += "<a href=# id='next'><img src='assets/img/arrow/page_next.png'></a>";

  $("#paging").html(html); // 페이지 목록 생성
  $("#paging a#" + currentPage).css({
    "text-decoration": "none",
    "color": "#db7f41",
    "font-weight": "bold",
    "background-color":"#464646"
  }); // 현재 페이지 표시

  $("#paging a").click(function () {

    var $item = $(this);
    var $id = $item.attr("id");
    var selectedPage = $item.text();

    if ($id == "next") selectedPage = next;
    if ($id == "prev") selectedPage = prev;

    paging(totalData, dataPerPage, pageCount, selectedPage);
  });

}

$("document").ready(function () {
  paging(totalData, dataPerPage, pageCount, 1);
});



