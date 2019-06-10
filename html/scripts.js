//
//  FiveM Scripts
//The Official HackerGeo Script 
//Credits - HackerGeo
//Website - www.HackerGeo.com
//GitHub - GITHUB.com/HackerGeo-sp1ne
//Steam - SteamCommunity.com/id/HackerGeo1
//Copyright 2019 ©HackerGeo. All rights served
//

////------------------------------------------------------WARNING-----------------------------------------------------
//---------------------Do not reupload/re release any part of this script without my permission---------------------
//------------------------------------------------------------------------------------------------------------------
//


$(document).ready(function(){
  function closeMain() {
    $(".home").css("display", "none");
  }
  function openMain() {
    $(".home").css("display", "block");
  }
  function openMain() {
    $(".home").css("display", "block");
  }
  function closeAll() {
    $(".body").css("display", "none");
  }
  function openContainer() {
    $(".login-container").css("display", "block");
  }
  function closeContainer() {
    $(".login-container").css("display", "none");
  }
  window.addEventListener('message', function(event){
    var item = event.data;
    if(item.openmenu == true) {
      openContainer();
      openMain();
    }
    if(item.openmenu == false) {
      closeContainer();
      closeMain();
    }
  });



 // document.onkeyup = function (data) {
  //  if (data.which == 27 ) {
  //    $.post('http://vrp_login/close', JSON.stringify({}));
 //   }
 // }; 
  


  $("#login-form").submit(function(e) {
      e.preventDefault();
      $.post('http://vrp_login/loginSubmit', JSON.stringify({
          username: $("#login-form #username").val(),
          parola: $("#login-form #parola").val()
      }));
      $("#login-form #username").prop('disabled', true)
      $("#login-form #parola").prop('disabled', true)
      setTimeout(function(){
        $("#login-form #username").prop('disabled', false)
        $("#login-form #submit").css('display', 'block')
        $("#login-form #parola").prop('disabled', false)
      }, 2000)
      $("#login-form #username").val('')
      $("#login-form #parola").val('')
  });
  $("#register-form").submit(function(e) {
    e.preventDefault();
    $.post('http://vrp_login/registerSubmit', JSON.stringify({
      username: $("#register-form #username").val(),
      parola: $("#register-form #parola").val(),
      parola2: $("#register-form #parola2").val()
    }));
    $("#register-form #username").prop('disabled', true)
    $("#register-form #parola").prop('disabled', true)
    $("#register-form #parola2").prop('disabled', true)
    setTimeout(function(){
      $("#register-form #username").prop('disabled', false)
      $("#register-form #parola").prop('disabled', false)
      $("#register-form #submit").css('display', 'block')
      $("#register-form #parola2").prop('disabled', false)
    }, 2000)
    $("#register-form #username").val('')
    $("#register-form #parola").val('')
    $("#register-form #parola2").val('')
});
});
