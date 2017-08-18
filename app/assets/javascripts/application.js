// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require wangEditor.min
//= require_tree .

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

// $(window).scroll(function () {
//   if ($(this).scrollTop() > 500) {
//     $('#img_wx').fadeIn() // 当页面向下滚动的距离大于500px时，慢慢地显示「回到顶部按钮」
//   } else {
//     $('#img_wx').fadeOut() // 否则慢慢地隐藏「回到顶部按钮」
//   }
// })
//
//  $("#img_wx").imgFloat({
//    speed : 15,
//    xPos : 10,
//    yPos : 10
//  });
//  $(".reset").click(function() {
//    $("#img_wx").css("display", "none");
//  });
