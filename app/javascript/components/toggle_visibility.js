

const togglers = document.querySelectorAll(".toggler");

const visibilityToggle = (event) => {
  console.log("coucou");
  let e = event.currentTarget
  const divsToHide = document.querySelectorAll(`.${e.dataset.type}`);
  console.log(event);
  console.log(divsToHide);
    divsToHide.forEach((divToHide) => {
      divToHide.classList.toggle('hideComment');
      const display = divToHide.classList.contains('hideComment')
      console.log(display)
      saveVisibility(display, divToHide)
    });
}

const saveVisibility = (display, divToHide) => {
  const displayForm = divToHide.querySelector(".display-form");
  console.log(displayForm.querySelector(".display-form-input"));
  displayForm.querySelector(".display-form-input").value = display;
  displayForm.querySelector(".display-form-submit").click();
}


const initToggleVisibility = () => {
  if( togglers ) {
    togglers.forEach((toggler) => {
      toggler.addEventListener("change", visibilityToggle);
    });
  }
}

export {initToggleVisibility}
