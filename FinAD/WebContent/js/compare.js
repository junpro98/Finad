$(document).ready(function() {
    $("#nonMat").on("change", function() {
        var selectedValue = $(this).val();
        var values = selectedValue.split(','); // 쉼표를 기준으로 값을 나눔

        var nickname = values[0];
        var category = values[1];

        console.log("Selected nickname:", nickname);
        console.log("Selected category:", category);

        $.ajax({
            type: "POST",
            url: "nonMat.finad23?nickname=" + nickname + "&category=" + category + "",
            data: {
                nickname: nickname,
                category: category
            },
            success: function(rs) {
                var img = $(rs).find(".ajax_img");
                $(".com_img").html(img); // 기존 내용을 지우고 새로운 내용으로 대체
                var nick = $(rs).find(".ajax_nick");
                $(".com_nick").html(nick);
                var avgsub = $(rs).find(".ajax_avgSub");
                $(".com_sub").html(avgsub);
                var avgview = $(rs).find(".ajax_avgView");
                $(".com_view").html(avgview);
                var thrsub = $(rs).find(".ajax_thrSub");
                $(".com_thr").html(thrsub);
                var shorts = $(rs).find(".ajax_shorts");
                $(".com_shorts").html(shorts);

                // Ajax 요청이 완료된 후에 차트를 다시 그림
                drawChart();
                console.log("성공");
            },
            error: function(error) {
                console.log("실패");
            }
        });
    });
});

google.charts.load('current', { 'packages': ['bar'] });

function drawChart() {
    let leftNick = document.querySelector('.leftNick').textContent;
    let leftSub = document.querySelector('.leftSub').textContent;
    let leftView = document.querySelector('.leftView').textContent;
    let left3Sub = document.querySelector('.left3Sub').textContent;

	let rightNick = document.querySelector('.com_nick').textContent;
	let rightSub = document.querySelector('.com_sub').textContent;
	let rightView = document.querySelector('.com_view').textContent;
	let right3Sub = document.querySelector('.com_thr').textContent;
	
	
    var data = google.visualization.arrayToDataTable([
      ['비교하기', leftNick , rightNick],
      ['구독자', leftSub, rightSub],
      ['평균조회수', leftView, rightView],
      ['30일구독자수', left3Sub, right3Sub]
    ]);

    var options = {
        chart: {
            title: 'Company Performance'
        }
    };

    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}

google.charts.setOnLoadCallback(drawChart);
