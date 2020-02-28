const injectOccupiedInCalendar = (periods, selectedMonth) => {
  // for each cell in our table, check if it is in between the 2 periods
  const tds = document.querySelectorAll('.selected-month td');
  const year = 2020; // TODO: make this dynamic
  const month = selectedMonth - 1;
  console.log(periods);
  tds.forEach(td => {
    // create a new date with the infos
    // console.log(td.innerText);
    const thisDate = new Date(year, month, td.innerText);
    if (thisDate) {
      if (periods[0] <= thisDate && periods[1] >= thisDate) {
        console.log('occupied!');
      }
    }
  });
}

export const refreshOccupied = (selectedMonth) => {
  // we need to get all of the start and end dates of this pet
  const dateStr = document.querySelector("#calendar").dataset.dates;
  const datePeriods = dateStr.split('|').map(str => {
    const arr = str.split('-');
    return new Date(arr[0], arr[1], arr[2]);
  });
  injectOccupiedInCalendar(datePeriods, selectedMonth);
}