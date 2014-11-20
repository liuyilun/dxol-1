/**
 * Unicorn Admin Template
 * Version 2.2.0
 * Diablo9983 -> diablo9983@gmail.com
**/

var login = $('#loginform');
var inform = $('#inform');
var admin = $('#adminform');
var login_inform = $('#loginform, #inform');
var login_admin = $('#loginform, #adminform');
var inform_admin = $('#inform, #adminform');
var loginbox = $('#loginbox');
var userbox = $('#user');
var animation_speed = 150;

$(document).ready(function(){

    var loc = window.location + '';
    var ee = loc.split('#');
    if(ee[1] == undefined){
    	loginbox.css({'height':'210px'});
        $('#inform, #adminform').css({'z-index':'100','opacity':'0.01'});
        $('#loginform').css({'z-index':'200','opacity':'1','display':'block'});
    }
    if(ee[1] == 'inform' && ee[1] != undefined){
        loginbox.css({'height':'183px'});
        $('#loginform, #adminform').css({'z-index':'100','opacity':'0.01'});
        $('#inform').css({'z-index':'200','opacity':'1','display':'block'});
    } else if(ee[1] == 'adminform' && ee[1] != undefined) {
        loginbox.css({'height':'210px'});
        login_inform.css({'z-index':'100','opacity':'0.01'});
        admin.css({'z-index':'200','opacity':'1','display':'block'});
    }

	$('.flip-link.to-inform').click(function(){
        switch_container(inform,login_admin,183);
	});
	$('.flip-link.to-login').click(function(){
        switch_container(login,inform_admin,210);
	});
    $('.flip-link.to-admin').click(function(){
        switch_container(admin,login_inform,210);
    });
    /*
    $('#loginform').submit(function(e){
        var thisForm = $(this); 
        var userinput = $('#username');
        var passinput = $('#password');
        if(userinput.val() == '' || passinput.val() == '') {
            highlight_error(userinput);
            highlight_error(passinput);
            loginbox.effect('shake');
            return false;
        } else {
            e.preventDefault();
            loginbox.animate({'top':'+=100px','opacity':'0'},250,function(){
                $('.user_name').text(userinput.val());
                userbox.animate({'top':"+=75px",'opacity':'1'},250,function(){
                    setTimeout(function(){
                        thisForm.unbind('submit').submit();
                    },600);
                });
            });
            return true;
        }       
    });
*/
    $('#username, #password').on('keyup',function(){
        highlight_error($(this));
    }).focus(function(){
        highlight_error($(this));
    }).blur(function(){
        highlight_error($(this));
    });
});

function highlight_error(el) {
    if(el.val() == '') {
        el.parent().addClass('has-error');
    } else {
        el.parent().removeClass('has-error');
    }
}
function switch_container(to_show,to_hide,cwidth) {
    to_hide.css('z-index','100').fadeTo(animation_speed,0.01,function(){
        loginbox.animate({'height':cwidth+'px'},animation_speed,function(){
            to_show.fadeTo(animation_speed,1).css('z-index','200');
        });
    });
}