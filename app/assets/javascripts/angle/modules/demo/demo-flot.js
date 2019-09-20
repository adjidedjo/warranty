// CHART SPLINE
// ----------------------------------- 
(function(window, document, $, undefined){
  
  
  $(function(){
    
    var data_daily = [{
      "label": gon.brand,
      "color": "#768294",
      "data": [
        [gon.day_6, gon.qty_6],
        [gon.day_5, gon.qty_5],
        [gon.day_4, gon.qty_4],
        [gon.day_3, gon.qty_3],
        [gon.day_2, gon.qty_2],
        [gon.day_1, gon.qty_1],
      ]
    }];
    
    var data_weekly = [{
      "label": gon.brand,
      "color": "#768294",
      "data": [
        [gon.four_week_ago_date, gon.four_week_ago],
        [gon.three_week_ago_date, gon.three_week_ago],
        [gon.two_week_ago_date, gon.two_week_ago],
        [gon.last_week_date, gon.last_week_ago],
      ]
    }];
    
    var weeknas = [{
      "label": gon.brand,
      "color": "#768294",
      "data": gon.summaries
    }];
    
    var weekssr = [{
      "label": gon.brand,
      "color": "#768294",
      "data": gon.sumssr
    }];
    
    var data_productivity = [{
      "label": gon.brand,
      "color": "#768294",
      "data": gon.productivity
    }];

    var options_weeknas = {
      series: {
          lines: {
              show: false
          },
          points: {
              show: true,
              radius: 4
          },
          splines: {
              show: true,
              tension: 0.4,
              lineWidth: 1,
              fill: 0.5
          }
      },
      grid: {
          borderColor: '#eee',
          borderWidth: 1,
          hoverable: true,
          backgroundColor: '#fcfcfc'
      },
      tooltip: true,
      tooltipOpts: {
          content: function (label, x, y) { return x + ' : ' + y; }
      },
      xaxis: {
          tickColor: '#fcfcfc',
          mode: 'categories'
      },
      yaxis: {
          tickColor: '#eee',
          //position: 'right' or 'left',
          tickFormatter: function (v) {
              return v/* + ' visitors'*/;
          }
      },
      shadowSize: 0
    };

    var datav2 = [{
      "label": gon.brand,
      "color": "#768294",
      "data": gon.summaries
    }];

    var options = {
      series: {
          lines: {
              show: false
          },
          points: {
              show: true,
              radius: 4
          },
          splines: {
              show: true,
              tension: 0.4,
              lineWidth: 1,
              fill: 0.5
          }
      },
      grid: {
          borderColor: '#eee',
          borderWidth: 1,
          hoverable: true,
          backgroundColor: '#fcfcfc'
      },
      tooltip: true,
      tooltipOpts: {
          content: function (label, x, y) { return x + ' : ' + y; }
      },
      xaxis: {
          tickColor: '#fcfcfc',
          mode: 'categories'
      },
      yaxis: {
          min: 0,
          max: gon.max, // optional: use it for a clear represetation
          tickColor: '#eee',
          //position: 'right' or 'left',
          tickFormatter: function (v) {
              return v/* + ' visitors'*/;
          }
      },
      shadowSize: 0
    };

    var chart_daily = $('.chart-spline-daily');
    if(chart_daily.length)
      $.plot(chart_daily, data_daily, options);

    var chart_monthly = $('.chart-spline-monthly');
    if(chart_monthly.length)
      $.plot(chart_monthly, data_monthly, options);

    var chart_weekly = $('.chart-spline-weekly');
    if(chart_weekly.length)
      $.plot(chart_weekly, data_weekly, options);
    
    var chartv2 = $('.chart-splinev2');
    if(chartv2.length)
      $.plot(chartv2, datav2, options);
    
    var chartv3 = $('.chart-splinev3');
    if(chartv3.length)
      $.plot(chartv3, datav3, options);
    
    var chartweek_nas = $('.chart-spline-weeknas');
    if(chartweek_nas.length)
      $.plot(chartweek_nas, weeknas, options_weeknas);
    
    var chartweek_ssr = $('.chart-ssr');
    if(chartweek_ssr.length)
      $.plot(chartweek_ssr, weekssr, options_weeknas);
    
    var productivity = $('.chart-productivity');
    if(productivity.length)
      $.plot(productivity, data_productivity, options_weeknas);

  });

})(window, document, window.jQuery);

// CHART AREA
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){

    var data = [{
      "label": "Uniques",
      "color": "#aad874",
      "data": [
        ["Mar", 50],
        ["Apr", 84],
        ["May", 52],
        ["Jun", 88],
        ["Jul", 69],
        ["Aug", 92],
        ["Sep", 58]
      ]
    }, {
      "label": "Recurrent",
      "color": "#7dc7df",
      "data": [
        ["Mar", 13],
        ["Apr", 44],
        ["May", 44],
        ["Jun", 27],
        ["Jul", 38],
        ["Aug", 11],
        ["Sep", 39]
      ]
    }];

    var options = {
                    series: {
                        lines: {
                            show: true,
                            fill: 0.8
                        },
                        points: {
                            show: true,
                            radius: 4
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        min: 0,
                        tickColor: '#eee',
                        // position: 'right' or 'left'
                        tickFormatter: function (v) {
                            return v + ' visitors';
                        }
                    },
                    shadowSize: 0
                };

    var chart = $('.chart-area');
    if(chart.length)
      $.plot(chart, data, options);

  });

})(window, document, window.jQuery);

// CHART BAR
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){

    var data = [{
      "label": "Sales",
      "color": "#9cd159",
      "data": [
        ["Jan", 27],
        ["Feb", 82],
        ["Mar", 56],
        ["Apr", 14],
        ["May", 28],
        ["Jun", 77],
        ["Jul", 23],
        ["Aug", 49],
        ["Sep", 81],
        ["Oct", 20]
      ]
    }];
    
    var data_elite = [{
      "label": "Sales",
      "color": "#51bff2",
      "data": gon.summaries
    }];
    
    var data_serenity = [{
      "label": "Sales",
      "color": "#51bff2",
      "data": gon.summaries
    }];
    
    var data_lady = [{
      "label": "Sales",
      "color": "#51bff2",
      "data": gon.summaries
    }];
    
    var data_royal = [{
      "label": "Sales",
      "color": "#51bff2",
      "data": gon.summaries
    }];
    
    var data_monthlynas = [{
        "label": "Sales",
        "color": "#0000CD",
        "data": gon.summaries_branch
    }];
    
     var data_monthlynasdir = [{
        "label": "Sales",
        "color": "#0000CD",
        "data": gon.summaries
    }];
    
    var options_royal = {
                    series: {
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.6,
                            fill: 0.9
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        ticks: [[2000, "2M"], [4000, "4M"], [6000, "6M"], [8000, "8M"], [10000, "10M"], [12000, "12M"]],
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };
    
    var options_lady = {
                    series: {
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.6,
                            fill: 0.9
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        ticks: [[500, "500"], [1000, "1M"], [1500, "1,5M"], [2000, "2M"]],
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };

    var options = {
                    series: {
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.6,
                            fill: 0.9
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        ticks: [[100, "100"], [200, "200"], [300, "300"], [400, "400"], 
                          [500, "500"], [1000, "1M"], [1500, "1,5M"], [2000, "2M"], [2500, "2,5M"], 
                          [3000, "3M"], [3500, "3,5M"]],
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };

    var options_monthly = {
                    series: {
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.3,
                            fill: 0.6
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 0.3,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };
                
    var options_monthlydir = {
                    series: {
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.3,
                            fill: 0.6
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 0.3,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };

    var chart = $('.chart-bar');
    if(chart.length)
      $.plot(chart, data, options);

    var chart = $('.chart-bar-ELITE');
    if(chart.length)
      $.plot(chart, data_elite, options);

    var chart = $('.chart-bar-LADY');
    if(chart.length)
      $.plot(chart, data_lady, options_lady);

    var chart = $('.chart-bar-SERENITY');
    if(chart.length)
      $.plot(chart, data_serenity, options);

    var chart = $('.chart-bar-ROYAL');
    if(chart.length)
      $.plot(chart, data_royal, options_royal);
      
    var chart_monthly_nasional = $('.chart-bar-monthlynas');
    if(chart_monthly_nasional.length)
      $.plot(chart_monthly_nasional, data_monthlynas, options_monthly);
      
    var chart_monthly_nasionaldir = $('.chart-bar-monthlynasdir');
    if(chart_monthly_nasionaldir.length)
      $.plot(chart_monthly_nasionaldir, data_monthlynasdir, options_monthlydir);

  });

})(window, document, window.jQuery);


// CHART BAR STACKED
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){

    var data = [{
      "label": "Tweets",
      "color": "#51bff2",
      "data": [
        ["Jan", 56],
        ["Feb", 81],
        ["Mar", 97],
        ["Apr", 44],
        ["May", 24],
        ["Jun", 85],
        ["Jul", 94],
        ["Aug", 78],
        ["Sep", 52],
        ["Oct", 17],
        ["Nov", 90],
        ["Dec", 62]
      ]
    }, {
      "label": "Likes",
      "color": "#4a8ef1",
      "data": [
        ["Jan", 69],
        ["Feb", 135],
        ["Mar", 14],
        ["Apr", 100],
        ["May", 100],
        ["Jun", 62],
        ["Jul", 115],
        ["Aug", 22],
        ["Sep", 104],
        ["Oct", 132],
        ["Nov", 72],
        ["Dec", 61]
      ]
    }, {
      "label": "+1",
      "color": "#f0693a",
      "data": [
        ["Jan", 29],
        ["Feb", 36],
        ["Mar", 47],
        ["Apr", 21],
        ["May", 5],
        ["Jun", 49],
        ["Jul", 37],
        ["Aug", 44],
        ["Sep", 28],
        ["Oct", 9],
        ["Nov", 12],
        ["Dec", 35]
      ]
    }];

    var datav2 = [{
      "label": "Pending",
      "color": "#9289ca",
      "data": [
        ["Pj1", 86],
        ["Pj2", 136],
        ["Pj3", 97],
        ["Pj4", 110],
        ["Pj5", 62],
        ["Pj6", 85],
        ["Pj7", 115],
        ["Pj8", 78],
        ["Pj9", 104],
        ["Pj10", 82],
        ["Pj11", 97],
        ["Pj12", 110],
        ["Pj13", 62]
      ]
    }, {
      "label": "Assigned",
      "color": "#7266ba",
      "data": [
        ["Pj1", 49],
        ["Pj2", 81],
        ["Pj3", 47],
        ["Pj4", 44],
        ["Pj5", 100],
        ["Pj6", 49],
        ["Pj7", 94],
        ["Pj8", 44],
        ["Pj9", 52],
        ["Pj10", 17],
        ["Pj11", 47],
        ["Pj12", 44],
        ["Pj13", 100]
      ]
    }, {
      "label": "Completed",
      "color": "#564aa3",
      "data": [
        ["Pj1", 29],
        ["Pj2", 56],
        ["Pj3", 14],
        ["Pj4", 21],
        ["Pj5", 5],
        ["Pj6", 24],
        ["Pj7", 37],
        ["Pj8", 22],
        ["Pj9", 28],
        ["Pj10", 9],
        ["Pj11", 14],
        ["Pj12", 21],
        ["Pj13", 5]
      ]
    }];

    var options = {
                    series: {
                        stack: true,
                        bars: {
                            align: 'center',
                            lineWidth: 0,
                            show: true,
                            barWidth: 0.6,
                            fill: 0.9
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#fcfcfc',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };

    var chart = $('.chart-bar-stacked');
    if(chart.length)
      $.plot(chart, data, options);

    var chartv2 = $('.chart-bar-stackedv2');
    if(chartv2.length)
      $.plot(chartv2, datav2, options);

  });

})(window, document, window.jQuery);

// CHART DONUT
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){

    var data = [ { "color" : "#39C558",
        "data" : 60,
        "label" : "Coffee"
      },
      { "color" : "#00b4ff",
        "data" : 90,
        "label" : "CSS"
      },
      { "color" : "#FFBE41",
        "data" : 50,
        "label" : "LESS"
      },
      { "color" : "#ff3e43",
        "data" : 80,
        "label" : "Jade"
      },
      { "color" : "#937fc7",
        "data" : 116,
        "label" : "AngularJS"
      }
    ];

    var options = {
                    series: {
                        pie: {
                            show: true,
                            innerRadius: 0.5 // This makes the donut shape
                        }
                    }
                };

    var chart = $('.chart-donut');
    if(chart.length)
      $.plot(chart, data, options);

  });

})(window, document, window.jQuery);

// CHART LINE
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){

    var data = [{
        "label": "Complete",
        "color": "#5ab1ef",
        "data": [
            ["Jan", 188],
            ["Feb", 183],
            ["Mar", 185],
            ["Apr", 199],
            ["May", 190],
            ["Jun", 194],
            ["Jul", 194],
            ["Aug", 184],
            ["Sep", 74]
        ]
    }, {
        "label": "In Progress",
        "color": "#f5994e",
        "data": [
            ["Jan", 153],
            ["Feb", 116],
            ["Mar", 136],
            ["Apr", 119],
            ["May", 148],
            ["Jun", 133],
            ["Jul", 118],
            ["Aug", 161],
            ["Sep", 59]
        ]
    }, {
        "label": "Cancelled",
        "color": "#d87a80",
        "data": [
            ["Jan", 111],
            ["Feb", 97],
            ["Mar", 93],
            ["Apr", 110],
            ["May", 102],
            ["Jun", 93],
            ["Jul", 92],
            ["Aug", 92],
            ["Sep", 44]
        ]
    }];

    var options = {
                    series: {
                        lines: {
                            show: true,
                            fill: 0.01
                        },
                        points: {
                            show: true,
                            radius: 4
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#eee',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };
                
    var data_monthly = [{
        "label": "Sales",
        "color": "#5ab1ef",
        "data": gon.summaries
    }];
    
    var data_monthlynas = [{
        "label": "Sales",
        "color": "#5ab1ef",
        "data": gon.summaries_branch
    }];

    var options_monthly = {
                    series: {
                        lines: {
                            show: true,
                            fill: 0.01
                        },
                        points: {
                            show: true,
                            radius: 4
                        }
                    },
                    grid: {
                        borderColor: '#eee',
                        borderWidth: 1,
                        hoverable: true,
                        backgroundColor: '#fcfcfc'
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: function (label, x, y) { return x + ' : ' + y; }
                    },
                    xaxis: {
                        tickColor: '#eee',
                        mode: 'categories'
                    },
                    yaxis: {
                        // position: 'right' or 'left'
                        tickColor: '#eee'
                    },
                    shadowSize: 0
                };

    var chart = $('.chart-line');
    if(chart.length)
      $.plot(chart, data, options);
      
    var chart_monthly = $('.chart-line-monthly');
    if(chart_monthly.length)
      $.plot(chart_monthly, data_monthly, options);
      
    var chart_monthly_nasional = $('.chart-line-monthlynas');
    if(chart_monthly_nasional.length)
      $.plot(chart_monthly_nasional, data_monthlynas, options_monthly);

  });

})(window, document, window.jQuery);


// CHART PIE
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){
    var data = [ {
      "label": "ON TIME (1-3 HARI)",
      "color": "#b2d767",
      "data": gon.ontime
    }, {
      "label": "LATE (4-7 HARI)",
      "color": "#ffea88",
      "data": gon.late
    }, {
      "label": "VERY LATE (>= 7 HARI)",
      "color": "red",
      "data": gon.superlate
    }];

    var options = {
                    series: {
                        pie: {
                            show: true,
                            innerRadius: 0,
                            label: {
                                show: true,
                                radius: 0.8,
                                formatter: function (label, series) {
                                    return '<div class="flot-pie-label">' +
                                    //label + ' : ' +
                                    Math.round(series.percent) +
                                    '%</div>';
                                },
                                background: {
                                    opacity: 0.8,
                                    color: '#222'
                                }
                            }
                        }
                    }
                };

    var chart = $('.chart-pie');
    if(chart.length)
      $.plot(chart, data, options);

  });

})(window, document, window.jQuery);

// CHART PIE MARKETSHARE
// ----------------------------------- 
(function(window, document, $, undefined){

  $(function(){
    var val;
    var data = gon.marketshare;
    var options = {
        series: {
            pie: {
                show: true,
                label: {
                    show: true,
                    radius: 180,
                    formatter: function (label, series) {
                        return '<div style="border:1px solid grey;font-size:8pt;text-align:center;padding:5px;color:white;">' +
                        label + ' : ' +
                        Math.round(series.percent) +
                        '%</div>';
                    },
                    background: {
                        opacity: 0.8,
                        color: '#000'
                    }
                }
            }
        },
        legend: {
            show: false
        },
        grid: {
            hoverable: true
        }
    };

    var chart = $('#ms-pie');
    if(chart.length)
      $.plot(chart, data, options);

  });

})(window, document, window.jQuery);