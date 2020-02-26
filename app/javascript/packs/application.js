import "bootstrap";

import { initAvatarUploadBtn } from '../signup/sign_up';
import { initPhotosChange } from '../new_pet/new_pet';

if (window.location.pathname === '/users/sign_up') {
  initAvatarUploadBtn();
}

if (window.location.pathname === '/pets/new') {
  initPhotosChange();
}