// this filters columnContent array for selected years.
function filterYearSpan() {
    // get value of selection of years
    var startYear = parseInt($("#yearSelectionMin").val());
    var endYear = parseInt($("#yearSelectionMax").val());
    // filter contents of selected column
    var result = columnContent.filter(myArray => parseInt(myArray) >= startYear && parseInt(myArray) <= endYear);
    for (var i = 1; i < 5; i++) {
        $('#example tr:last').remove();
    }
    removeTables(result);
    sumOfcolumn();
    //$('#example').bootstrapTable({});
}

// return table to it's initial state.
function defaultButton() {

    var table, tr, td, i;
    table = document.getElementById("example-datatable_wrapper");
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            tr[i].style.display = "";
        }
    }
    for (var j = 1; j < 5; j++) {
        $('#example tr:last').remove();
    }
    sumOfcolumn();
}



// filter table rows that are not in selected range
function removeTables(result) {
    var table, tr, td, i;
    table = document.getElementById("example-datatable_wrapper");
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            if (result.includes(td.innerHTML)) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function growth()
{
	if (jQuery("#txtGrow")[0].selectedIndex == 0)
	{
		alert("Please Choose a Column Name from the DropDown.");
	}
	var columnNumber = parseInt(jQuery("#txtGrow")[0].selectedIndex) -1;
	var prev = 0, i=1;
	$('#example-datatable_wrapper tr').each(function() {
		
		var curre = $(this).find("td").eq(columnNumber).html(); 
		if (curre != undefined)
		{
			var tgrow = parseFloat(curre) + parseFloat(prev);
			prev = curre;
			var numColumns = $('#example-datatable_wrapper th').length;		
			jQuery("#example-datatable tr td").eq(((i++) * numColumns)-1).html(tgrow);
		}

	});
	sumOfcolumn();
}


// sum of fitered rows
function sumOfcolumn() {
    var table, tr, td, i;
    var sum = 0,max = 0,min=1000000000000, rowNum=0, ave=0;;

    var numColumns = $('#example-datatable_wrapper th').length;

for (var i = 0; i < numColumns; i++) {
	max = 0;min=1000000000000; sum=0; rowNum=0; ave=0; 
    $('#example-datatable_wrapper tr').each(function() {
		
		
	
    		var Id = $(this).find("td").eq(i).html();  
		if (Id != undefined)
		{  
		    try{
			
			num = parseFloat(Id);
			rowNum+=1;
			if (num > max){ max = num; }
			if (num < min){ min = num; }
			sum += num;
			ave=sum/rowNum;
		    }catch (err) {}
		}
		
    	if (max>0) jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(i).html(max);
    	if (min<1000000000000) jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(i + numColumns ).html(min);
    	jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(i + (numColumns*2) ).html(sum);
    	jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(i + (numColumns*3) ).html(ave);	
    });
}

jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(0).html("MAX");
jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(0+numColumns).html("MIN");
jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(0+numColumns*2).html("SUM");
jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr td").eq(0+numColumns*3).html("AVERAGE");
jQuery("#ContentPlaceHolder1_ctl00_Repeater1 tr th").eq(0).html("");


/*
    var s = table.rows[0].cells.length;
    for (var j = 1; j < s; j++) {
        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[j];


            if (td) {
                if (tr[i].style.display !== "none") {
                    if (i === 1) {
                        var max = parseFloat(td.innerHTML);
                        var min = parseFloat(td.innerHTML);
                    }
                    if (td.innerHTML !== "") {
                        var tdd = parseFloat(td.innerHTML);
                        sum = sum + parseFloat(td.innerHTML);
                        count++;
                        if (tdd > max) {
                            max = tdd;
                        }
                        if (tdd < min) {
                            min = tdd;
                        }

                    }


                }
            }

        }
        var avg = sum / count;
        count = 0;

        cell = newRowAvg.insertCell(-1);
        cell.innerHTML = avg;
        avg = 0;


        cell = newRowSum.insertCell(-1);
        cell.innerHTML = sum;
        sum = 0;


        cell = newRowMax.insertCell(-1);
        cell.innerHTML = max;
        max = 0;


        cell = newRowMin.insertCell(-1);
        cell.innerHTML = min;
        min = 0;


        //alert(sum);
    }
*/
}


// to know if the checkbox infront of a column head is selected

function checkboxCheked() {
    var checkBox = document.getElementById("headCheck");
    if (checkBox.checked === true) {
        var columnNumber = parseInt(checkBox.value);
        //sumOfcolumn(columnNumber);

    } else {
        alert("No clolumn is selected. Please select a column.");
    }


}
$(document).ready(function() {



    $("#btnDownload").click(function() {

	if (jQuery("#downloadtype").val() == null)
	{
		alert("No File Format is selected. Please select a File Format from the DropDown.");
	}
	else
	{
        var num = jQuery("#downloadtype").val();
        jQuery(".buttons-"+num).click();
	}
    });
     $("#btnStat").click();

});


function chartts(tablecol) {
    var table, tr, td, i;
    table = document.getElementById("example-datatable_wrapper");
    tr = table.getElementsByTagName("tr");
    var tableDataz = [];
    for (i = 1; i < tr.length; i++) {
        if (tr[i].style.display !== "none") {
            td = tr[i].getElementsByTagName("td")[tablecol];

            if (td) {
                tableDataz.push(parseFloat(td.innerHTML));
            }
        }

    }
    return tableDataz;
}


function checkss() {
    var count = $('.headColumn:checkbox:checked').length;
    // check if only 2 columns selected
    if (count == 2) {
        var allVals = [];
        $('.headColumn:checkbox:checked').each(function() {
            allVals.push($(this).val());
        });


        var chartLabeles = [];
        $("#example-datatable_wrapper tr").each(function() {
            if (this.style.display !== "none") {
                chartLabeles.push($(this).find("td:first").text());

            }

        });
        chartLabeles.shift();

        var mychart = document.getElementById("mychart").getContext('2d');
        var chartType = jQuery("#charttype").val()
        var customChart = new Chart(mychart, {
            type: chartType,
            data: {
                labels: chartLabeles,
                datasets: [{
                    label: "",
                    data: chartts(allVals[1]),
		    lineTension:0,
		    fill:false,
		    backgroundColor:['#36a2eb']
                }]
            },
	    options: {
		bezierCurve:false
            }
        });

	jQuery("#btndemo").click();
	jQuery("#btndemo2").click();

    } else {
        alert("two columns has to be selected");
    }
}