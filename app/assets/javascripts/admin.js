//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require ckeditor/init


// 图片自适应大小支持代码块
function ReImgSize(){
    for (j=0;j<document.images.length;j++)
    {
      document.images[j].width=(document.images[j].width>420)?"420":document.images[j].width;
    }
  }
