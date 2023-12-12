$(document).ready(function() {
    $(".gnb").hide();
    $(".gnbbox").hide();
    $(".category_text").mouseenter(function() {
        $(".gnb").stop().slideDown();
        $(".gnbbox").stop().slideDown();
    });
    $(".category_div").mouseleave(function() {
        $(".gnb").stop().slideUp();
        $(".gnbbox").stop().slideUp();
    });
    
    var viewers = [];
    var viewers50 = 0;
    var viewers100 = 0;
    var viewers500 = 0;
    var viewers1000 = 0;
    var viewers5000 = 0;
    var viewers10000 = 0;
    var viewers20000 = 0;

    var subscribers =[];
    var subscribers10 = 0;
    var subscribers30 = 0;
    var subscribers50 = 0;
    var subscribers100 = 0;
    var subscribers200 = 0;
    var subscribers500 = 0;
    var subscribers1000 = 0;
    var sex = [];
    var male = 0;
    var female = 0;
    
    var count= document.getElementById('count').value;
    for(var i = 0; i < count; i++){
    	 viewers.push(document.getElementById('viewer'+i).value);
         subscribers.push(document.getElementById('subscribe'+i).value);
         sex.push(document.getElementById('sex'+i).value);
    } 
    for(var i=0; i<viewers.length; i++){
    	if(viewers[i]>0 && viewers[i]<50){
    		viewers50++;
    	} 
    	if(viewers[i]>50 && viewers[i]<250){
    		viewers100++;
    	}
    	if(viewers[i]>250 && viewers[i]<750){
    		viewers500++;
    	}
    	if(viewers[i]>750 && viewers[i]<2500){
    		viewers1000++;
    	}
    	if(viewers[i]>2500 && viewers[i]<7500){
    		viewers5000++;
    	}
    	if(viewers[i]>7500 && viewers[i]<15000){
    		viewers10000++;
    	}
    	if(viewers[i]>15000){
    		viewers20000++;
    	}
    }
    for(var i=0; i<subscribers.length; i++){
    	if(subscribers[i]>0 && subscribers[i]<150000){
    		subscribers10++;
    	} 
    	if(subscribers[i]>150000 && subscribers[i]<250000){
    		subscribers30++;
    	}
    	if(subscribers[i]>250000 && subscribers[i]<750000){
    		subscribers50++;
    	}
    	if(subscribers[i]>750000 && subscribers[i]<1500000){
    		subscribers100++;
    	}
    	if(subscribers[i]>1500000 && subscribers[i]<2500000){
    		subscribers200++;
    	}
    	if(subscribers[i]>2500000 && subscribers[i]<7500000){
    		subscribers500++;
    	}
    	if(subscribers[i]>7500000){
    		subscribers1000++;
    	}
    }
    
    for(var i=0; i<sex.length; i++){
    	if(sex[i] === "0"){
    		male++;
    	}
    	if(sex[i] === "1"){
    		female++;
    	}
    }
    
    var maxViewers = Math.max(viewers50, viewers100, viewers500,viewers1000, viewers5000, 
    		viewers10000,viewers20000);
    var maxSubscribers = Math.max(subscribers10, subscribers30, subscribers50, subscribers100, 
    		subscribers200, subscribers500, subscribers1000);
    var maxValue1 = maxViewers*1.2; 
    var maxValue2 = maxSubscribers*1.2; 
    const ctx = document.querySelector(".bar_graph");
    const bar_graph = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [50, 100, 500, 1000, 5000, 10000, 20000],
            datasets: [{
                label: '신청인원',
                data: [viewers50, viewers100, viewers500, viewers1000, viewers5000, viewers10000, viewers20000],
                borderColor: ['#346aff'],
                borderWidth: 2
            }]
        },
        options: {
            responsive: false,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                    	display:false
                    },
                    max:maxValue1
                    
                }
            },
            plugins: {
                datalabels: false, // 다른 데이터 라벨 플러그인이 활성화되어 있으면 비활성화
                tooltip: {
                    enabled: false // 툴팁 비활성화 시 필요
                }
            }
        },
        plugins: [{
            afterDatasetsDraw: function(chart, easing) {
                var ctx = chart.ctx;
                chart.data.datasets.forEach(function (dataset, i) {
                    var meta = chart.getDatasetMeta(i);
                    if (!meta.hidden) {
                        meta.data.forEach(function(element, index) {
                            ctx.fillStyle = 'rgb(0, 0, 0)'; // 숫자 색상 설정

                            var fontSize = 16; // 폰트 크기
                            var fontStyle = 'bold';
                            var fontFamily = 'Helvetica Neue';
                            ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                            var dataString = dataset.data[index].toString();

                            // 데이터 값 위치 계산
                            ctx.textAlign = 'center';
                            ctx.textBaseline = 'bottom';
                            var padding = 5; // 바 위의 패딩
                            var position = element.tooltipPosition();
                            ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
                        });
                    }
                });
            }
        }]
    });
	const ctx2 = document.querySelector(".doughnut_graph");
	const doughnut_graph = new Chart(ctx2, {
		type : 'doughnut',
		data : {
			labels : [ '남','여' ],
			datasets : [ {
				label : '신청인원',
				data : [male,female],
				backgroundColor: ['#36A2EB', '#FF6384'], // 각 데이터에 대한 색상 설정
	            borderColor: ['#014D81', '#014D81'],
	            borderWidth: 2

			} ]
		},
		options: {
	        responsive: false,
	        cutout: '69%',
	        plugins: {
	            tooltip: {
	                enabled: false // 툴팁 비활성화 시 필요
	            }
	        }
	    },
	    plugins: [{
	        afterDraw: function(chart) {
	            var ctx = chart.ctx;
	            var maleCount = chart.data.datasets[0].data[0];
	            var femaleCount = chart.data.datasets[0].data[1];
	            var total = maleCount + femaleCount;
	            var malePercentage = ((maleCount / total) * 100).toFixed(0);
	            var femalePercentage = ((femaleCount / total) * 100).toFixed(0);

	            var centerX = (chart.chartArea.left + chart.chartArea.right) / 2;
	            var centerY = (chart.chartArea.top + chart.chartArea.bottom) / 2;

	            ctx.save();
	            ctx.textAlign = 'center';
	            ctx.textBaseline = 'middle';
	            ctx.font = '20px Arial';
	            ctx.fillStyle = '#FF6384'; // 여성 비율의 색상
	            ctx.fillText(`${femalePercentage}%`, centerX + 40, centerY); // 여성 비율 표시
	            ctx.font = '20px Arial';
	            ctx.fillStyle = '#FF6384'; // '여성' 색상
	            ctx.fillText(`여성`, centerX + 40, centerY - 30); // 상단에 '여성' 텍스트 표시
	            ctx.fillStyle = '#FF6384'; // 여성 인원 색상
	            ctx.fillText(`${femaleCount} 명`, centerX + 40, centerY + 30); // 하단에 여성 인원수 표시

	            ctx.fillStyle = '#36A2EB'; // 남성 비율의 색상
	            ctx.fillText(`${malePercentage}%`, centerX - 40, centerY); // 남성 비율 표시
	            ctx.font = '20px Arial';
	            ctx.fillStyle = '36A2EB';  // '남성' 색상
	            ctx.fillText(`남성`, centerX - 40, centerY - 30); // 상단에 '남성' 텍스트 표시
	            ctx.fillStyle = '#36A2EB'; // 남성 인원 색상
	            ctx.fillText(`${maleCount} 명`, centerX - 40, centerY + 30); // 하단에 남성 인원수 표시

	            ctx.restore();
	        }
	    }]
	});
	
	const ctx3 = document.querySelector(".bar_graph2");
	const bar_graph2 = new Chart(ctx3, {
		type : 'bar',
		data : {
			labels : ["10만", "30만", "50만", "100만", "200만", "500만", "1000만"],
			datasets : [ {
				label : '신청인원',
				data : [subscribers10, subscribers30, subscribers50, subscribers100, 
					subscribers200, subscribers500, subscribers1000],
				borderColor : [ '#346aff' ],
				borderWidth : 2
			} ]
		},
		options: {
            responsive: false,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                    	display:false
                    },
                    max:maxValue2
                    
                }
            },
            plugins: {
                datalabels: false, // 다른 데이터 라벨 플러그인이 활성화되어 있으면 비활성화
                tooltip: {
                    enabled: false // 툴팁 비활성화 시 필요
                }
            }
        },
        plugins: [{
            afterDatasetsDraw: function(chart, easing) {
                var ctx = chart.ctx;
                chart.data.datasets.forEach(function (dataset, i) {
                    var meta = chart.getDatasetMeta(i);
                    if (!meta.hidden) {
                        meta.data.forEach(function(element, index) {
                            ctx.fillStyle = 'rgb(0, 0, 0)'; // 숫자 색상 설정

                            var fontSize = 16; // 폰트 크기
                            var fontStyle = 'bold';
                            var fontFamily = 'Helvetica Neue';
                            ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                            var dataString = dataset.data[index].toString();

                            // 데이터 값 위치 계산
                            ctx.textAlign = 'center';
                            ctx.textBaseline = 'bottom';
                            var padding = 5; // 바 위의 패딩
                            var position = element.tooltipPosition();
                            ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
                        });
                    }
                });
            }
        }]
    });
});
function resetSearch() {
        document.getElementById('search_input').value = '';
}

function zoomIn(event) {
    event.target.style.transform = "scale(1.2)";
    event.target.style.zIndex = "1";
    event.target.style.transition = "all 0.5s";
}

function zoomOut(event) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s"
}



/*//검색 버튼 클릭 시 호출되는 함수
function search() {
 // 체크된 체크박스 값을 가져와서 검색 쿼리를 생성
 var selectedFilters = [];
 
 // 홍보 종류 필터
 var promotionTypes = document.querySelectorAll('input[name="promotionType"]:checked');
 for (var i = 0; i < promotionTypes.length; i++) {
     selectedFilters.push(promotionTypes[i].value);
 }
 
 // 홍보 기간 필터
 var promotionDurations = document.querySelectorAll('input[name="promotionDuration"]:checked');
 for (var i = 0; i < promotionDurations.length; i++) {
     selectedFilters.push(promotionDurations[i].value);
 }
 
 // 카테고리 필터
 var categories = document.querySelectorAll('input[name="category"]:checked');
 for (var i = 0; i < categories.length; i++) {
     selectedFilters.push(categories[i].value);
 }
 
 // 검색어 입력란 값 가져오기
 var query = document.getElementById("search_input").value;
 
 // 서버로 검색 쿼리를 보냄
 sendSearchQuery(selectedFilters, query);
}
 
//검색 쿼리를 서버로 보내는 함수
function sendSearchQuery(filters, query) {
 // AJAX를 사용하여 서버로 검색 쿼리를 전송
 // jQuery를 사용한 예시
 $.ajax({
     type: "GET",
     url: "company_board.jsp", // 검색 요청을 처리하는 서블릿 주소로 변경
     data: {
         filters: filters,
         query: query
     },
     success: function (data) {
         // 검색 결과를 받아와서 페이지에 표시
         // 이 부분을 적절히 수정하여 검색 결과를 표시하도록 구현
         console.log("검색 결과:", data);
     },
     error: function (error) {
         console.error("검색 오류:", error);
     }
 });
}*/
