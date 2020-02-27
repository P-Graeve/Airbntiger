const submitForm = () => {
  const form = document.querySelector("#new_user");
  form.submit();
}

const addLocationsToInput = (result) => {
  if (result) {
    const { latitude, longitude } = result.coords;
    // add the user location to the hidden inputs in the form
    const inputLatitude = document.querySelector("#latitude");
    const inputLongtitude = document.querySelector("#longtitude");
    inputLatitude.value = latitude;
    inputLongtitude.value = longitude;

    submitForm();
  }
}

const fetchCurrentPosition = () => {
  if (navigator.geolocation) {
    // get current position from the navigator
    navigator.geolocation.getCurrentPosition(addLocationsToInput);
  }
}

const processForm = (e) => {
  // when form gets submitted, prevent default action for now
  e.preventDefault();

  fetchCurrentPosition();
}

export const addFormSubmitListener = () => {
  const form = document.querySelector("#new_user");
  if (form) {
    form.addEventListener('submit', processForm)
  }
}