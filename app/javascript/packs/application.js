import "bootstrap";

import { initAvatarUploadBtn } from '../signup/sign_up.js';

if (window.location.pathname === '/users/sign_up') {
  initAvatarUploadBtn();
}
