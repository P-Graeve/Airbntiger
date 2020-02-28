export const injectInitialDatesInForm = () => {
  const starting = localStorage.getItem('start-date');
  const ending = localStorage.getItem('end-date');
  const startingDay = new Date(starting).getDate();
  const startingMonth = new Date(starting).getMonth() + 1;
  const startingYear = new Date(starting).getYear() + 1900;
  const endingDay = new Date(ending).getDate();
  const endingMonth = new Date(ending).getMonth() + 1;
  const endingYear = new Date(ending).getYear() + 1900;
  if (document.querySelector("#booking_start_date_3i")) {
    document.querySelector("#booking_start_date_3i").value = startingDay;
    document.querySelector("#booking_start_date_2i").value = startingMonth;
    document.querySelector("#booking_start_date_1i").value = startingYear;
    document.querySelector("#booking_end_date_3i").value = endingDay;
    document.querySelector("#booking_end_date_2i").value = endingMonth;
    document.querySelector("#booking_end_date_1i").value = endingYear;
  }

}
