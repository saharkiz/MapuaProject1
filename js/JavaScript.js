

// initiate an array and assigning its values by first tds of all table rows.
var columnContent = [];
$("#example tr").each(function () {
    columnContent.push($(this).find("td:first").text());
});

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
}

// return table to it's initial state.
function defaultButton() {
    var table, tr, td, i;
    table = document.getElementById("example");
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            tr[i].style.display = "";
        }
    }
}



// filter table rows that are not in selected range
function removeTables(result) {
    var table, tr, td, i;
    table = document.getElementById("example");
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



// sum of fitered rows
function sumOfcolumn() {
    var table, tr, td, i;
    var sum = 0;
    table = document.getElementById("example");
    tr = table.getElementsByTagName("tr");
    var newRowAvg = table.insertRow(-1);
    var newRowSum = table.insertRow(-1);
    var newRowMax = table.insertRow(-1);
    var newRowMin = table.insertRow(-1);
    var count = 0;
    var cell = newRowAvg.insertCell(-1);
    cell.innerHTML = "";
    cell = newRowSum.insertCell(-1);
    cell.innerHTML = "";
    cell = newRowMax.insertCell(-1);
    cell.innerHTML = "";
    cell = newRowMin.insertCell(-1);
    cell.innerHTML = "";



    var s = table.rows[0].cells.length;
    for (; s > 1; s++) {
        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[s];
            if (i === 1) {
                var max = parseFloat(td.innerHTML);
                var min = parseFloat(td.innerHTML);
            }

            if (td) {
                if (tr[i].style.display !== "none") {
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
        var avg = sum / count;

        cell = newRowAvg.insertCell(0);
        cell.innerHTML = avg;


        cell = newRowSum.insertCell(0);
        cell.innerHTML = sum;


        cell = newRowMax.insertCell(0);
        cell.innerHTML = max;


        cell = newRowMin.insertCell(0);
        cell.innerHTML = min;


        //alert(sum);
    }
}

function sds() {
    table = document.getElementById("example");
    result = table.rows[0].cells.length;
    alert(result);

}

// to know if the checkbox infront of a column head is selected

function checkboxCheked() {
    var checkBox = document.getElementById("headCheck");
    if (checkBox.checked === true) {
        var columnNumber = parseInt(checkBox.value);
        sumOfcolumn(columnNumber);

    } else {
        alert("No clolumn is selected. Please select a column.")
    }


}



// the array is columnContent
var yearSelectionMin = document.getElementById('yearSelectionMin');
var yearSelectionMax = document.getElementById('yearSelectionMax');
for (var i = 1; i < columnContent.length; i++) {
    if (columnContent[i]) {
        var opt = document.createElement('option');
        opt.innerHTML = columnContent[i];
        opt.value = columnContent[i];
        var opt2 = document.createElement('option');
        opt2.innerHTML = columnContent[i];
        opt2.value = columnContent[i];
        yearSelectionMax.appendChild(opt2);
        yearSelectionMin.appendChild(opt);
    }
}





document.getElementById("demo").innerHTML = columnContent;