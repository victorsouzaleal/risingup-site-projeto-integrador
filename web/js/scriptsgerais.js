var $a = jQuery.noConflict()
$a(function () {
    var $doc = $('html, body'); // ROLAGEM SUAVE
    $('a').click(function () {
        $doc.animate({
            scrollTop: $($.attr(this, 'href')).offset().top
        }, 500);
        return false;
    });
    // #########################


    $(window).scroll(function () { // FAZER A BARRA APARECER COM TRANSPARENCIA NA ROLAGEM
        var x = $(window).scrollTop();

        if (x >= 70) {
            $('#navegacao').addClass('fixed-top vermtransp');
            $('#navegacao').removeClass('fundoverm');
            $('.navbar-brand').addClass('d-block');
        } else {
            $('#navegacao').removeClass('fixed-top');
            $('#navegacao').addClass('fundoverm');
            $('#navegacao').removeClass('vermtransp');
            $('.navbar-brand').removeClass('d-block');

        }

    });
    // ###################################

    $a('.jcarousel') // CONFIGURAÇÕES JCAROUSEL
        .jcarouselAutoscroll({
            interval: 2500,
            target: '+=1',
            autostart: true
        });
    // #################################

    //#####################################
});