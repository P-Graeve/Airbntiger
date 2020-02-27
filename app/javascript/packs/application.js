import "bootstrap";

import { initAvatarUploadBtn } from '../signup/display_avatar';
import { addFormSubmitListener } from '../signup/form_submit';
import { initPhotosChange } from '../new_pet/new_pet';
import { refreshImages } from '../edit_pet/edit_pet';

if (window.location.pathname === '/users/sign_up') {
  initAvatarUploadBtn();
  addFormSubmitListener();
}

if (window.location.pathname === '/pets/new') {
  initPhotosChange();
}

if (window.location.pathname.match(/edit/)) {
  refreshImages();
}