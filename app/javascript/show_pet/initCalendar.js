import Calendar from 'js-year-calendar';

const displayCurrentMonth = () => {
  const monthContainers = document.querySelectorAll('.month-container');
  monthContainers.forEach(container => {
    // remove any previous classes
    container.classList.remove('none');
    container.classList.remove('selected-month');
    if (container.dataset.monthId !== '0') {
      // add none class
      container.classList.add('none');
    } else {
      // add identifier class
      container.classList.add('selected-month')
    }
  })
}

const previousMonth = e => {
  const monthContainers = document.querySelectorAll('.month-container');
  const currentMonth = parseInt(document.querySelector('.selected-month').dataset.monthId);
  // return if the currentmonth is 0
  if (currentMonth === 0) {
    return;
  }

  monthContainers.forEach(container => {
    // remove any previous classes
    container.classList.remove('none');
    container.classList.remove('selected-month');
    if (parseInt(container.dataset.monthId) !== currentMonth - 1) {
      container.classList.add('none');
    } else {
      container.classList.add('selected-month');
    }
  });
}

const nextMonth = e => {
  const monthContainers = document.querySelectorAll('.month-container');
  const currentMonth = parseInt(document.querySelector('.selected-month').dataset.monthId);
  monthContainers.forEach(container => {
    // remove any previous classes
    container.classList.remove('none');
    container.classList.remove('selected-month');
    if (parseInt(container.dataset.monthId) !== currentMonth + 1) {
      container.classList.add('none');
    } else {
      container.classList.add('selected-month');
    }
  });
}

const initMonthButtons = () => {
  const prev = document.querySelector('#previous-month');
  const next = document.querySelector('#next-month');

  prev.addEventListener('click', previousMonth);
  next.addEventListener('click', nextMonth);
}

export const initCalendar = () => {
  const container = document.querySelector('#calendar');
  if (container) {
    // create a new calendar
    new Calendar(container, {
      style: 'background'
    });

    // hide the headers
    document.querySelector('.calendar-header').classList.add('none')

    displayCurrentMonth();

    initMonthButtons();
  }
}