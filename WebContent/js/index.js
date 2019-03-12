const buttons = Array.from(document.querySelectorAll('.buttons > button'));
const activeElements = Array.from(document.querySelectorAll('[data-action="animated"]'));

function toggle() {
  activeElements.forEach(item => {
    item.classList.toggle('signup-button-active');
    item.classList.toggle('login-button-active');
  });
};

buttons.forEach(item => item.addEventListener('click', toggle));

/*
const loginButton = document.querySelector('.log-link');
const signupButton = document.querySelector('.sign-link');

function switcher(e) {
  if(e.target === loginButton) {
    for (var i = 0; i < activeElements.length; i++) {
      activeElements[i].classList.remove('signup-button-active');
      activeElements[i].classList.add('login-button-active');
    }
  } else if(e.target === signupButton) {
    for (var i = 0; i < activeElements.length; i++) {
      activeElements[i].classList.remove('login-button-active');
      activeElements[i].classList.add('signup-button-active');
    }
  }
}

// OR

var loginButton = document.querySelector('.log-link');
var signupButton = document.querySelector('.sign-link');
var activeElements = document.getElementsByName('animated');

loginButton.onclick = function() {
  for (var i = 0; i < activeElements.length; i++) {
    activeElements[i].classList.remove('signup-button-active');
    activeElements[i].classList.add('login-button-active');
  }
}

signupButton.onclick = function() {
  for (var i = 0; i < activeElements.length; i++) {
    activeElements[i].classList.remove('login-button-active');
    activeElements[i].classList.add('signup-button-active');
  }
}
*/