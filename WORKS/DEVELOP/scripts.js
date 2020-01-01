$(document).ready(function() {
    $('.focusslider').bxSlider({
        mode: 'fade',
        captions: true,
        auto: false,
        autoHover: false,
        controls: false
    }).show();

    $('.peopleslider').bxSlider({
        mode: 'fade',
        captions: true,
        auto: true,
        autoHover: true,
        controls: false
    }).show();

    // var oneSlider = ($('.bxslider').children().length < 2);
    // slidebanner = jqq('.bxslider').bxSlider({
    //     auto: (!oneSlider),
    //     pager:(!oneSlider),
    //     autoHover: true,
    //     controls: false,
    //     onSliderLoad: function ()
    //     {
    //         $('.banner-box').find('div').find('.bx-pager.bx-default-pager').attr('style', 'bottom: 0px !important;margin-left: 120px;width: 150px;');
            
    //     }
    // });

    // jqq('.wp-banner .bx-pager').click(function () {
    //     setTimeout(slidebanner.startAuto(), 5000);
    // });
});

function runExtractRule() {
    var ruleAfter = $(".ruleAfter").val();  
    var ruleBefore = $(".ruleBefore").val();

    var arrayRuleAfter = ruleAfter.split('/');  
    var arrayRuleBefore = ruleBefore.split('/');


    var index = 0;
    for (i = 0; i < arrayRuleAfter.length; i++) { 
        var elem = arrayRuleAfter[i];
        if(elem.includes('[INC')) {
            index = i;
        }
    }

    console.log(arrayRuleBefore[index]);
}

function copyUrl() {	
    var dummy = document.createElement('input'),
    text = window.location.href;

    document.body.appendChild(dummy);
    dummy.value = text;
    dummy.select();
    document.execCommand('copy');
    document.body.removeChild(dummy);
}