//kimi
$(function(){
    // 初始化总价和商品数量函数
    totl();
    goodsnum();
    // 全选复选框的逻辑
    $(".all").click(function() {
        var allChecked = $(this).prop("checked");
        // 遍历每个商品的复选框并设置与全选复选框相同的状态
        $(".each").prop("checked", allChecked);
        // 如果全选复选框被取消勾选，则更新总价和商品数量
        if (!allChecked) {
            totl();
            goodsnum();
        }
    });

    // 单个商品复选框的逻辑
    $(".each").click(function() {
        var isChecked = $(this).prop("checked");
        // 如果有商品复选框被取消勾选，则全选复选框也应取消勾选
        if (!isChecked) {
            $(".all").prop("checked", false);
        }
        // 计算勾选商品的总价和数量
        totl();
        goodsnum();
    });

    // 减少商品数量的逻辑 ，减少到0商品依旧存在
    // $(".reduce").click(function(){
    //     var numInput = $(this).siblings(".text_num");
    //     var num = parseInt(numInput.val());
    //     if(num > 0){
    //         num--;
    //         numInput.val(num);
    //     }
    //     updateItemTotal($(this));
    // });

    // 减少商品数量的逻辑
    $(".reduce").click(function() {
        var numInput = $(this).siblings(".text_num");
        var num = parseInt(numInput.val(), 10); // 确保使用基数10解析数字
        if (num > 0) {
            num--; // 减少商品数量
            numInput.val(num); // 更新输入框的值
            updateItemTotal($(this)); // 更新商品项的总价
            // 检查数量是否大于0，若大于0则减少
            if (currentNum > 0) {
                // 发送AJAX请求到服务器端以更新数据库
                $.ajax({
                    url: '/car', // 服务器端更新购物车的API端点
                    type: 'POST',
                    data: {
                        goods_id: goodsId,
                        quantity: currentNum
                    },
                    success: function(response) {
                        if (response.success) {
                            // 更新成功，可能需要更新页面上的总价或其它信息
                            currentNum--; // 数量减少1
                            $textNum.val(currentNum); // 更新输入框的值
                            console.log('数据库更新成功');
                        } else {
                            // 更新失败，可以根据需要进行错误处理
                            console.error('数据库更新失败:', response.message);
                            // 可能需要将数量回滚
                            $textNum.val(currentNum + 1);
                        }
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        // AJAX请求失败
                        console.error('AJAX请求失败:', errorThrown);
                        // 可能需要将数量回滚
                        $textNum.val(currentNum + 1);
                    }
                });
            }
        } else if (num === 0) {
            // 如果数量为0，执行删除商品项的操作
            var goodsId = $(this).data('goods-id'); // 假设每个减少按钮都有商品ID的数据属性
            removeItemAndUpdateDatabase(goodsId); // 删除商品并更新数据库
        }
    });

// 删除商品并更新数据库的函数
    function removeItemAndUpdateDatabase(goodsId) {
        // 发送 AJAX 请求到服务器端以删除数据库中的记录
        $.ajax({
            url: 'http://localhost:8081/shop_war/car.jsp', // 服务器端的处理脚本 URL
            type: 'POST',
            data: {
                goods_id: goodsId, // 发送商品ID
                user_id: userId, // 如果需要，也可以发送用户ID
                action: 'remove' // 可以添加一个参数来指明操作类型
            },
            success: function(response) {
                if (response.success) {
                    // 如果服务器端删除成功，删除页面上的商品项
                    var $itemToRemove = $('.reduce[data-goods-id="' + goodsId + '"]').closest('.cart-item'); // 找到对应的商品项
                    $itemToRemove.remove(); // 删除商品项

                    // 更新总价和商品数量
                    totl();
                    goodsnum();
                } else {
                    // 处理错误情况
                    alert('删除失败：' + response.message);
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                // 处理 AJAX 请求错误
                alert('删除时发生错误：' + goodsId);
            }
        });
    }

    //增加商品数量的逻辑
    $(".add").click(function(){
            var $addLink = $(this); // 获取点击的add链接
            var goodsId = $addLink.data('goods-id'); // 获取商品ID
            var userId = $addLink.data('user-id'); // 获取用户ID
            var numInput = $(this).siblings(".text_num");
            var currentNum = parseInt(numInput.val(), 10); // 获取当前数量，并使用基数10解析
            console.log('Clicked remove button');
            console.log('Goods ID:', goodsId);
            console.log('User ID:', userId);
        var numInput = $(this).siblings(".text_num");
        var num = parseInt(numInput.val()) + 1;
        numInput.val(num);
        updateItemTotal($(this));
    });
    // 增加商品数量的逻辑
    // $(".add").click(function() {
    //     var $addLink = $(this); // 获取点击的add链接
    //     var goodsId = $addLink.data('goods-id'); // 获取商品ID
    //     var userId = $addLink.data('user-id'); // 获取用户ID
    //     var numInput = $(this).siblings(".text_num");
    //     var currentNum = parseInt(numInput.val(), 10); // 获取当前数量，并使用基数10解析
    //     console.log('Clicked remove button');
    //     console.log('Goods ID:', goodsId);
    //     console.log('User ID:', userId);
    //
    //     var newNum = currentNum + 1;
    //     numInput.val(newNum);
    //     updateItemTotal($(this)); // 假设这是更新商品项数量的函数
    //     // 发送 AJAX 请求更新数据库
    //     $.ajax({
    //         url: '/src/addcar.do', // 服务器端处理更新的 URL
    //         type: 'POST',
    //         data: {
    //             goods_id: goodsId,
    //             user_id:userId,
    //             quantity: newNum
    //         },
    //         success: function(response) {
    //             if (response.success) {
    //                 var newNum = currentNum + 1;
    //                 numInput.val(newNum);
    //                 updateItemTotal($(this)); // 假设这是更新商品项总价的函数
    //
    //                 console.log('数据库更新成功');
    //                 alert('数据库更新');
    //             } else {
    //                 // 服务器端更新失败
    //                 alert('数据库更新失败：' + response.message);
    //                 // 回滚前端数量更新
    //                 numInput.val(currentNum);
    //             }
    //         },
    //         error: function(xhr, textStatus, errorThrown) {
    //             // 服务器端更新发生错误
    //             alert('更新时发生错误：' + errorThrown);
    //             // 回滚前端数量更新
    //             numInput.val(currentNum);
    //         }
    //     });
    // });

    // 删除商品的逻辑
    $(".remove").click(function(){
        $(this).closest(".carts-goods").remove();
        totl();
        goodsnum();
    });

    // 绑定点击事件到所有移除按钮
    // $(".remove").click(function(event) {
    //     event.preventDefault(); // 阻止链接默认行为
    //
    //     var $removeLink = $(this); // 获取点击的移除链接
    //     var goodsId = $removeLink.data('goods-id'); // 获取商品ID
    //     var userId = $removeLink.data('user-id'); // 获取用户ID
    //
    //     // 发送 AJAX 请求到服务器端
    //     $.ajax({
    //         url: '/delete-cart-item', // 服务器端的处理脚本 URL
    //         type: 'POST',
    //         data: {
    //             goods_id: goodsId, // 发送商品ID
    //             user_id: userId // 发送用户ID
    //         },
    //         success: function(response) {
    //             if (response.success) {
    //                 // 如果服务器端删除成功，移除商品行
    //                 $removeLink.closest('.carts-goods').remove(); // 假设每个商品都在一个 .carts-goods 类的元素中
    //                 // 更新购物车中的商品数量和总价（如果需要）
    //             } else {
    //                 // 处理错误情况
    //                 alert('删除失败：' + response.message);
    //             }
    //         },
    //         error: function(xhr, textStatus, errorThrown) {
    //             // 处理 AJAX 请求错误
    //             alert('删除时发生错误：' + errorThrown);
    //         }
    //     });
    // });
    // 更新单个商品总价的函数
    function updateItemTotal(item) {
        var price = item.siblings(".c-price").find(".c-price_num").text();
        var num = item.siblings(".text_num").val();
        var sum = parseFloat(price) * num;
        item.siblings(".c-sum").find(".c-sum_num").text(sum.toFixed(2));
        totl();
    }

    // 计算勾选商品的总价，商品数量增加价格没有发生改变
    // function totl(){
    //     let sumprice = 0;
    //     $(".c-sum_num").each(function() {
    //         var $this = $(this);
    //         if ($this.closest('.carts-goods').find('.each').prop("checked")) {
    //             sumprice += parseFloat($this.text());
    //         }
    //     });
    //     $(".show-money span").text(sumprice.toFixed(2));
    // };
    // 计算勾选商品的总价
    function totl(){
        let sumprice = 0;
        $('.carts-goods').each(function() {
            var $thisGoods = $(this);
            // 检查当前商品的复选框是否被勾选
            if ($thisGoods.find('.each').prop("checked")) {
                var price = parseFloat($thisGoods.find('.c-price_num').text());
                var num = parseInt($thisGoods.find('.text_num').val());
                var itemSum = price * num;
                sumprice += itemSum;
            }
        });
        // 设置显示的总价，保留两位小数
        $(".show-money span").text(sumprice.toFixed(2));
    };

    // 统计勾选商品的数量,显示NaN
    // function goodsnum(){
    //     let goods_num = 0;
    //     $(".each").each(function() {
    //         if ($(this).prop("checked")) {
    //             goods_num += parseInt($(this).siblings(".text_num").val());
    //             $(".goods_num span").text(goods_num);
    //         }
    //     });
    //
    // }
    //统计勾选商品的数量
// 统计勾选商品的数量并显示
    function goodsnum() {
        let goods_num = 0; // 确保初始值为0
        $('.carts-goods').each(function() {
            var $thisGoods = $(this);
            // 检查当前商品的复选框是否被勾选
            if ($thisGoods.find('.each').prop("checked")) {
                var num = parseInt($thisGoods.find('.text_num').val());
                goods_num += num;
            }
        });

        // 将统计的数量显示到页面上
        $('.goods_num span').text(goods_num);
    }
});