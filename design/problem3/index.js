(function ($) {

  var CalendarGenerator = function (el, options) {
    this.$el = $(el);
    this.options = {
                      startTime: '08:00',       
                      endTime: '20:00',       
                      interval: 30, 
                      days: [0, 1, 2, 3, 4],
                      nameDays: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes']
                  };
    
    this.draw();
  }

  CalendarGenerator.prototype.draw = function () {
    this.renderHeader();
    this.renderAppoinments();
  };

  CalendarGenerator.prototype.renderHeader = function () {
    var nameDays = this.options.nameDays
    var days = this.options.days
    var html = '';

     $.each(days, function (i, _) { html += '<th>' + (nameDays[i] || '') + '</th>'; });
     this.$el.find('.header').html('<tr><th></th>' + html + '</tr>');
  };

  CalendarGenerator.prototype.renderAppoinments = function () {
    var start = this.options.startTime
    var end = this.options.endTime
    var interval = this.options.interval
    var days = this.options.nameDays
    var $el = this.$el.find('.appoinments');

    $.each(createDates(start, end, interval), function (i, d) {
      var daysInARow = $.map(new Array(days.length), function (_, i) {
        return '<td class="time-slot" data-time="' + hhmm(d) + '" data-day="' + days[i].toLowerCase() + '"></td>'
      }).join();

      $el.append('<tr><td class="time-label">' + formatDate(d) + '</td>' + daysInARow + '</tr>');
    });
  };

  CalendarGenerator.prototype.select = function ($slot, name) {
    $slot.append(name);
    $slot.attr('data-taken', 'selected'); 
  }

  CalendarGenerator.prototype.loadJSON = function (times) {
    var plugin = this, i;
    $.each(times, function(key, value) {
      var $slots = plugin.$el.find('.time-slot[data-day="' + key + '"]');
      $.each(value, function(index, value) {
        for (i = 0; i < $slots.length; i++) {
          if ($slots.eq(i).data('time') >= value.hora_termino) { break; }
          if ($slots.eq(i).data('time') >= value.hora_inicio) { plugin.select($slots.eq(i), value.nombre); }
        }
      });
    })
  };

  function createDates(start, end, interval) {
    var numOfRows = Math.ceil(timeDiff(start, end) / interval);
    return $.map(new Array(numOfRows), function (_, i) {
      // need a dummy date to utilize the Date object
      return new Date(new Date(2000, 0, 1, start.split(':')[0], start.split(':')[1]).getTime() + i * interval * 60000);
    });
  }

  function timeDiff(start, end) {
    return (new Date(2000, 0, 1, end.split(':')[0], end.split(':')[1]).getTime() -
            new Date(2000, 0, 1, start.split(':')[0], start.split(':')[1]).getTime()) / 60000;
  }

  function formatDate(date) {
    return date.getHours() + ':' + ('0' + date.getMinutes()).slice(-2);
  }

  function hhmm(date) {
    var hours = date.getHours()
      , minutes = date.getMinutes();
    return ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2);
  }

  function Plugin(option) {
    return this.each(function (){
      var $this = $(this)
      var data = $this.data('calendarGenerator')
      var options = typeof option == 'object' && option;

      if (!data) {
        $this.data('calendarGenerator', (data = new CalendarGenerator(this, options)));
      }
    })
  }
  $.fn.calendarGenerator = Plugin;

})(jQuery);
