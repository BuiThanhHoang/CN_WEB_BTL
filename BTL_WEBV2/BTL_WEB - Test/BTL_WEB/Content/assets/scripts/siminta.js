
/*====================================
 Free To Use For Personal And Commercial Usage
Author: http://binarytheme.com
 Share Us if You Like our work 
 Enjoy Our Codes For Free always.
======================================*/

$(document).on("click", ".editproduct", function () {
    var idsp = $(this).data('id');
    $(".modal-body #idsanpham").text(idsp);
    
    var host = "http" + location.host;
    $.ajax({

        url: "/api/sanpham/getsanpham/" + idsp.toString(),
        dataType: "json",
        success: function (result) {
            
           
            var listdata = JSON.parse(result);

            $(".modal-body #tenchinh").text(listdata.ten);
            $(".modal-body #tensp").attr("placeholder", listdata.ten).val(listdata.ten).focus().blur();
            $(".modal-body #giasp").attr("placeholder", listdata.gia).val(listdata.gia).focus().blur();
            $(".modal-body #soluongsp").attr("placeholder", listdata.soluong).val(listdata.soluong).focus().blur();
            $(".modal-body #trongluongsp").attr("placeholder", listdata.trongluong).val(listdata.trongluong).focus().blur();
            $(".modal-body #romsp").attr("placeholder", listdata.ROM).val(listdata.ROM).focus().blur();
            $(".modal-body #ramsp").attr("placeholder", listdata.RAM).val(listdata.RAM).focus().blur();
            $(".modal-body #thenhosp").attr("placeholder", listdata.thenho).val(listdata.thenho).focus().blur();
            $(".modal-body #cameratruongsp").attr("placeholder", listdata.camera_truoc).val(listdata.camera_truoc).focus().blur();
            $(".modal-body #camerasausp").attr("placeholder", listdata.camera_sau).val(listdata.camera_sau).focus().blur();
            $(".modal-body #pinsp").attr("placeholder", listdata.pin).val(listdata.pin).focus().blur();
            $(".modal-body #bluetoothsp").attr("placeholder", listdata.bluetooth).val(listdata.bluetooth).focus().blur();
            $(".modal-body #cpusp").attr("placeholder", listdata.CPU).val(listdata.CPU).focus().blur();
            $(".modal-body #manhinhsp").attr("placeholder", listdata.manhinh).val(listdata.manhinh).focus().blur();
            $(".modal-body #thoigianbaohanhsp").attr("placeholder", listdata.baohanh).val(listdata.baohanh).focus().blur();
            $(".modal-body #tinhtrang").attr("placeholder", listdata.tinhtrang).val(listdata.tinhtrang).focus().blur();
            $(".modal-body #nhasanxuatsp").val(listdata.id_nsx)
            
            
        }
    });

});

$(document).on("click", ".showproduct", function () {
    var idsp = $(this).data('id');
    $.ajax({

        url: "/api/sanpham/getsanpham/" + idsp.toString(),
        dataType: "json",
        success: function (result) {
            

            var listdata = JSON.parse(result);
            console.log(listdata);
            $(".modal-body #show_tensp").html(listdata.ten);
            $(".modal-body #show_giasp").html(listdata.gia + " VND");
            $(".modal-body #show_soluongsp").html(listdata.soluong + " chiếc");
            $(".modal-body #show_trongluongsp").html(listdata.trongluong + " g");
            $(".modal-body #show_romsp").html(listdata.ROM);
            $(".modal-body #show_ramsp").html(listdata.RAM);
            $(".modal-body #show_thenhosp").html(listdata.thenho);
            $(".modal-body #show_camerasp").html("Trước: "+listdata.camera_truoc + " mpx, Sau: " +listdata.camera_sau + " mpx");
            $(".modal-body #show_pinsp").html(listdata.pin + " mAh");
            $(".modal-body #show_cpusp").html(listdata.CPU);
            $(".modal-body #show_manhinhsp").html(listdata.manhinh + " Inc");
            $(".modal-body #show_nhasanxuatsp").html(listdata.id_nsx);


        }
    });

});

// action post data edit sanpham
$(document).on("click", ".submitsanphamupdate", function () {

    var datalist = {};
    datalist["id"] = $(".modal-body #idsanpham").text();
    datalist["ten"] = $(".modal-body #tensp").val();
    datalist["gia"] = $(".modal-body #giasp").val();
    datalist["soluong"] = $(".modal-body #soluongsp").val();
    datalist["trongluong"] = $(".modal-body #trongluongsp").val();
    datalist["ROM"] = $(".modal-body #romsp").val();
    datalist["RAM"] = $(".modal-body #ramsp").val();
    datalist["thenho"] = $(".modal-body #thenhosp").val();
    datalist["camera_truoc"] = $(".modal-body #cameratruocsp").val();
    datalist["camera_sau"] = $(".modal-body #camerasausp").val();
    datalist["pin"] = $(".modal-body #pinsp").val();
    datalist["bluetooth"] = $(".modal-body #bluetoothsp").val();
    datalist["CPU"] = $(".modal-body #cpusp").val();
    datalist["manhinh"] = $(".modal-body #manhinhsp").val();
    datalist["baohanh"] = $(".modal-body #thoigianbaohanhsp").val();
    datalist["tinhtrang"] = $(".modal-body #tinhtrang").val();
    datalist["id_nsx"] = $(".modal-body #nhasanxuatsp").val();
    datalist["imgsp"] = $(".modal-body #imgsp").val();

    $.post("/api/sanpham/updatesanpham/", { "": JSON.stringify(datalist)},
        function (data) {
            console.log(data);
            var resual = JSON.parse(data);
            if (resual.status === -1) {
                alert("Sửa dữ liệu không thành công!!");
            } else {
                alert("Sửa dữ liệu thành công!!");
                $("#hienten_" + resual.sanpham).html(datalist["ten"]);
                $("#hiengia_" + resual.sanpham).html(datalist["gia"]);
                $("#hiensoluong_" + resual.sanpham).html(datalist["soluong"]);
                    
            }
        
        }   
    );

});
function delete_product(ele, id) {
    if (!confirm("Bạn có chắc chắn xóa sản phẩm!")) {

        return false;
    }
    var idsp = id;


    $.ajax({
        url: "/api/sanpham/deletesanpham/" + idsp.toString(),
        dataType: "json",
        success: function (data) {
            console.log(data);
            var resual = JSON.parse(data);
            if (resual.status === -1) {
                alert("Xóa dữ liệu không thành công!!");
               
            } else {
                alert("Xóa dữ liệu thành công!!");
                if (resual.color === -1) $(ele).css('background-color', "#FF0000");
                else $(ele).css('background-color', "#80FF00");

            }
        }
    });

}
$(function () {
    //alert xoa
 

    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })

    // popover demo
    $("[data-toggle=popover]")
        .popover()
    ///calling side menu

    $('#side-menu').metisMenu();

    ///pace function for showing progress

    function load(time) {
        var x = new XMLHttpRequest()
        x.open('GET', "" + time, true);
        x.send();
    };

    load(20);
    load(100);
    load(500);
    load(2000);
    load(3000);
    setTimeout(function () {
        Pace.ignore(function () {
            load(3100);
        });
    }, 4000);

    Pace.on('hide', function () {
        console.log('done');
    });
    paceOptions = {
        elements: true
    };
   

});

//Loads the correct sidebar on window load, collapses the sidebar on window resize.
$(function() {
    $(window).bind("load resize", function() {
        console.log($(this).width())
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})
