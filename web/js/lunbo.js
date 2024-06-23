$(document).ready(function() {
    var currentSlide = 0; // 当前显示的幻灯片索引
    var slideWidth = $('#lunbo div').width(); // 假设每个幻灯片宽度相同
    var slideCount = $('#lunbo div').length; // 幻灯片总数
    var slideInterval = 1000; // 幻灯片切换间隔，单位毫秒

    // 隐藏所有幻灯片，除了第一个
    $('#lunbo div:not(:first)').hide();

    // 自动播放函数
    function autoPlay() {
        // 清除之前的定时器（如果有的话）
        clearInterval($('#lunbo').data('interval'));

        // 显示当前幻灯片
        $('#lunbo div').eq(currentSlide).fadeIn(1000);

        // 更新索引并隐藏其他幻灯片
        currentSlide = (currentSlide + 1) % slideCount;
        $('#lunbo div').not(':eq(' + currentSlide + ')').fadeOut(500);

        // 设置新的定时器
        $('#lunbo').data('interval', setInterval(autoPlay, slideInterval));
    }

    // 开始自动播放
    autoPlay();

    // 左右箭头点击事件
    $('#right').click(function() {
        clearInterval($('#lunbo').data('interval')); // 清除定时器
        currentSlide = (currentSlide + 1) % slideCount; // 更新索引
        $('#lunbo div').fadeOut(500); // 隐藏所有幻灯片
        $('#lunbo div').eq(currentSlide).fadeIn(1000); // 显示当前幻灯片

        // 可选：重新开始自动播放
        // setTimeout(function() { autoPlay(); }, slideInterval);
    });

    $('#left').click(function() {
        clearInterval($('#lunbo').data('interval')); // 清除定时器
        currentSlide = (currentSlide - 1 + slideCount) % slideCount; // 更新索引（考虑负数索引）
        $('#lunbo div').fadeOut(500); // 隐藏所有幻灯片
        $('#lunbo div').eq(currentSlide).fadeIn(1000); // 显示当前幻灯片

        // 可选：重新开始自动播放
        // setTimeout(function() { autoPlay(); }, slideInterval);
    });

});