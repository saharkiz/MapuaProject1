/*
 *  Document   : uiTables.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Tables page
 */

var UiTables = function() {

    return {
        init: function() {
            /* Initialize Bootstrap Datatables Integration */
            App.datatables();

            /* Initialize Datatables */
    var table = $('#example-datatable').dataTable({

		rowReorder: true,
		bPaginate: true,
		sDom: '< W ><"row" <"col-sm-6 col-xs-5" B l><"col-sm-6 col-xs-7"f>>t<"row"<"col-sm-5 hidden-xs"i><"col-sm-7 col-xs-12 clearfix"p>>d',
		dom : '<"row"<"col-sm-6 col-xs-5" p B><"col-sm-6 col-xs-7"f>>t<"row"<"col-sm-5 hidden-xs"i><"col-sm-7 col-xs-12 clearfix"p>>',
		buttons: ['copy', 'csv', 'pdf', 'print','excel',
		],
                columnDefs: [ { orderable: true, targets: [ 2 ] } ],
                pageLength: 10,
                lengthMenu: [[5, 10, 50, 100, 500], ['5 Rows', '10 Rows', '50 Rows', '100 Rows', '500 Rows']],
		"autoWidth": true,
		oColumnFilterWidgets: {
			sSeparator: ',  ',
			bGroupTerms: true,
			aoColumnDefs: [
			{ bSort: false, sSeparator: ' / ', aiTargets: [ 2 ] },
			{ fnSort: function( a, b ) { return a-b; }, aiTargets: [ 3 ] }
		]}
            });
		jQuery(".dt-button").hide();


            /* Add placeholder attribute to the search input */
            $('.dataTables_filter input').attr('placeholder', 'Search');

            /* Select/Deselect all checkboxes in tables */
            $('thead input:checkbox').click(function() {
                var checkedStatus   = $(this).prop('checked');
                var table           = $(this).closest('table');

                $('tbody input:checkbox', table).each(function() {
                    $(this).prop('checked', checkedStatus);
                });
            });

            /* Table Styles Switcher */
            var genTable        = $('#general-table');
            var styleBorders    = $('#style-borders');

            $('#style-default').on('click', function(){
                styleBorders.find('.btn').removeClass('active');
                $(this).addClass('active');

                genTable.removeClass('table-bordered').removeClass('table-borderless');
            });

            $('#style-bordered').on('click', function(){
                styleBorders.find('.btn').removeClass('active');
                $(this).addClass('active');

                genTable.removeClass('table-borderless').addClass('table-bordered');
            });

            $('#style-borderless').on('click', function(){
                styleBorders.find('.btn').removeClass('active');
                $(this).addClass('active');

                genTable.removeClass('table-bordered').addClass('table-borderless');
            });

            $('#style-striped').on('click', function() {
                $(this).toggleClass('active');

                if ($(this).hasClass('active')) {
                    genTable.addClass('table-striped');
                } else {
                    genTable.removeClass('table-striped');
                }
            });

            $('#style-condensed').on('click', function() {
                $(this).toggleClass('active');

                if ($(this).hasClass('active')) {
                    genTable.addClass('table-condensed');
                } else {
                    genTable.removeClass('table-condensed');
                }
            });

            $('#style-hover').on('click', function() {
                $(this).toggleClass('active');

                if ($(this).hasClass('active')) {
                    genTable.addClass('table-hover');
                } else {
                    genTable.removeClass('table-hover');
                }
            });
        }
    };
}();