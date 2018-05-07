/*
 *  Document   : compCharts.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Charts page
 */
var CompCharts = function() {

var thisYear;
var dataMonths = [
            [1997, '1997'],
            [1998, '1998'],
            [1999, '199'],
            [2000, '2000'],
            [2001, '2001'],
            [2002, '2002'],
            [2003, '2003'],
            [2004, '2004'],
            [2005, '2005'],
            [2006, '2006'],
            [2007, '2007'],
            [2008, '2008']
        ];
	
    function onDataReceivedLine(series) {
		thisYear= series.data;
        var chartStacked = $('#chart-stacked');
        $.plot(chartStacked, [{
            label: '',
            data: series.data
        }], {
            colors: ['#5ccdde'],
            series: {
                stack: true,
                lines: {
                    show: true,
                    fill: false
                }
            },
            lines: {
                show: true,
                lineWidth: 0,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0
                    }, {
                        opacity: .6
                    }]
                }
            },
            points: {
                show: true,
                radius: 3
            },
            legend: {
                show: true,
                position: 'nw',
                sorted: true,
                backgroundOpacity: 0
            },
            grid: {
                borderWidth: 0,
                hoverable: true,
                clickable: true
            },
            yaxis: {
                tickColor: '#f5f5f5',
                ticks: 3
            },
            xaxis: {
                //ticks: dataMonths,
                tickColor: '#f5f5f5'
            }
        });
    }

    return {
        init: function() {

	
            $.ajax({
                url: 'chart.aspx?action=BOI',
                type: "GET",
                dataType: "json",
                success: onDataReceivedLine
            });
        }
    };
}();