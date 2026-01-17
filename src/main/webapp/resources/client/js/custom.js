(function ($) {
    'use strict';

    var tinyslider = function () {
        var el = document.querySelectorAll('.testimonial-slider');
        if (el.length > 0) {
            tns({
                container: '.testimonial-slider',
                items: 1,
                axis: "horizontal",
                controlsContainer: "#testimonial-nav",
                swipeAngle: false,
                speed: 700,
                nav: true,
                controls: true,
                autoplay: true,
                autoplayHoverPause: true,
                autoplayTimeout: 3500,
                autoplayButtonOutput: false
            });
        }
    };
    tinyslider();

    $(document).ready(function () {

        $('.quantity').on('click', '.btn-plus, .btn-minus', function () {

            const button = $(this);
            const input = button.closest('.quantity').find('input');

            let quantity = parseInt(input.val());
            const price = parseFloat(input.data('cart-detail-price'));
            const id = input.data('cart-detail-id');

            if (button.hasClass('btn-plus')) {
                quantity++;
            } else {
                quantity = quantity > 1 ? quantity - 1 : 1;
            }


            input.val(quantity);


            input.val(quantity);

            const index = input.attr("data-cart-detail-index"); // NEW
            const el = document.getElementById(`cartDetails${index}.quantity`); // NEW
            if (el) {                                            // NEW
                $(el).val(quantity);                              // NEW
            }


            const rowTotal = $(`td[data-cart-detail-id='${id}']`);
            rowTotal.text((price * quantity).toLocaleString() + ' đ');

            let cartTotal = 0;
            $('.quantity input').each(function () {
                cartTotal += parseInt($(this).val()) *
                    parseFloat($(this).data('cart-detail-price'));
            });

            $('[data-cart-total-price]')
                .text(cartTotal.toLocaleString() + ' đ')
                .attr('data-cart-total-price', cartTotal);
        });

    });

})(jQuery);
