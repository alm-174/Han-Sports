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

            let quantity = parseInt(input.val()) || 1;

            if (button.hasClass('btn-plus')) {
                quantity++;
            } else {
                quantity = quantity > 1 ? quantity - 1 : 1;
            }

            // update input visible
            input.val(quantity);

            // update hidden input để submit
            const index = input.data('cart-detail-index');
            const hiddenInput = document.getElementById(`cartDetails${index}.quantity`);
            if (hiddenInput) {
                hiddenInput.value = quantity;
            }
        });

    });
    $(document).ready(function () {

        $('#btnFilter').click(function (event) {
            event.preventDefault();

            let factoryArr = [];
            let targetArr = [];
            let priceArr = [];

            $("#factoryFilter .form-check-input:checked").each(function () {
                factoryArr.push($(this).val());
            });

            $("#targetFilter .form-check-input:checked").each(function () {
                targetArr.push($(this).val());
            });

            $("#priceFilter .form-check-input:checked").each(function () {
                priceArr.push($(this).val());
            });

            let sortValue = $('input[name="radio-sort"]:checked').val();

            const currentUrl = new URL(window.location.href);
            const searchParams = currentUrl.searchParams;

            searchParams.set('page', '1');
            if (sortValue) searchParams.set('sort', sortValue);

            searchParams.delete('brand');
            searchParams.delete('target');
            searchParams.delete('price');

            factoryArr.length
                ? searchParams.set('brand', factoryArr.join(','))
                : searchParams.delete('brand');

            targetArr.length
                ? searchParams.set('target', targetArr.join(','))
                : searchParams.delete('target');

            priceArr.length
                ? searchParams.set('price', priceArr.join(','))
                : searchParams.delete('price');

            window.location.href = currentUrl.toString();
        });
    });


})(jQuery);
