/*
 *  Document   : compCalendar.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Calendar page
 */

var CompCalendar = function() {


    return {
        init: function() {


            /* Initialize FullCalendar */
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({
                header: {
                    left: 'title',
                    center: '',
                    right: 'today  prev,next'
                },
                events: 'api.aspx?action=getEventCalendar', eventLimit: true,
            });
        }
    };
}();



var CompCalendarUser = function() {


    return {
        init: function() {


            /* Initialize FullCalendar */
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({
                header: {
                    left: 'title',
                    center: '',
                    right: 'today  prev,next'
                },
                events: 'api.aspx?action=getEventCalendarUser', eventLimit: true,
            });
        }
    };
}();