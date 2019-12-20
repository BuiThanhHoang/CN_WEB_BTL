
function tinhtientheosoluong(giatien, id, slhang, idsp, iduser)
{
    
    var soluong = $("#soluongsanpham_" + id).val();
    
   
    if (soluong <= 0) {
        $("#soluongsanpham_" + id).val(1);   
    }
    soluong = $("#soluongsanpham_" + id).val();

    // update
    updategiohang(idsp, iduser, soluong);

    //
    console.log(id);
    var tien = soluong * giatien;
    console.log(slhang);
    $("#tongtien_" + id).html(tien.toString() + " đ");
    updatetien(slhang);
}

function updatetien(x)
{
    var tong = 0;
    for (var  id = 1; id <= x; id++)
    {
        var tien = $("#tongtien_" + id).text();
        var quytien = parseInt(tien.split(' ')[0]);
        tong = tong + quytien;
        console.log(quytien);
    }
    $(".tongtiengiohang").text(tong);
    
}

function addgiohang(idsp, iduser)
{

    
    var datalist = {};
    datalist["idsp"] = idsp;
    datalist["iduser"] = iduser;
    datalist["soluong"] = 1;

    $.post("/api/apigiohang/selectsanpham", { "": JSON.stringify(datalist) },
        function (data) {
            console.log(data);
            var resual = JSON.parse(data);
            if (resual.status === -1) {
                alert("Thêm vào giỏ hàng thất bại!!");
            } else {
                alert("Đã thêm vào giỏ hàng!!");
            }

        }
    );
}

function  updategiohang(idsp, iduser, sl) {


    var datalist = {};
    datalist["idsp"] = idsp;
    datalist["iduser"] = iduser;
    datalist["soluong"] = sl;

    $.post("/api/apigiohang/updatesanpham", { "": JSON.stringify(datalist) },
        function (data) {
            console.log(data);
            var resual = JSON.parse(data);
            if (resual.status === -1) {
                console.log("Thêm vào giỏ hàng thất bại!!");
            } else {
                console.log("Đã thêm vào giỏ hàng!!");
            }

        }
    );
}

function deletegiohang(iddonhang) {

    $.ajax({
        url: "/api/apigiohang/deletesanpham/" + iddonhang.toString(),
        dataType: "json",
        success: function (data) {
            console.log(data);
            var resual = JSON.parse(data);
            if (resual.status != -1) {
                alert("Bỏ sản phẩm khỏi giỏ hàng thành công!!");
                location.reload();

            } else {
                alert("Bỏ sản phẩm khỏi giỏ hàng không thành công!!");
                
            }
        }
    });
}