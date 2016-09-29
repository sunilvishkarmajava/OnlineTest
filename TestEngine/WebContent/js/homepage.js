$(window).on("scroll", function(){
    if($(window).scrollTop() >300){
       $(".colornav").addClass("active");
       }
       else{
           $(".colornav").removeClass("active");
       }
});