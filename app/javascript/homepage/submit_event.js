export const initEventListenerOnLandingPage = () => {
  const form = document.querySelector("#search-form");

  if (form) {
    form.addEventListener('submit', e => {
      e.preventDefault()
      const sDate = document.querySelector("#search_start_date").value
      const startDate = new Date(sDate)
      localStorage.setItem('start-date', startDate);
      const eDate = document.querySelector("#search_end_date").value
      const endDate = new Date(eDate)
      localStorage.setItem('end-date', endDate);
    });
  }
}
