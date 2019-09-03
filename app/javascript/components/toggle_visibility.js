

const togglers = document.querySelectorAll(".toggler");

const visibilityToggle = (event) => {
  console.log("coucou");
  let e = event.currentTarget
  const divsToHide = document.querySelectorAll(`.${e.dataset.type}`);
 console.log(event);
 console.log(divsToHide);
    divsToHide.forEach((divToHide) => {
      divToHide.classList.toggle('hideComment');
    });
}


const initToggleVisibility = () => {
  if( togglers ) {
    togglers.forEach((toggler) => {
      toggler.addEventListener("change", visibilityToggle);
    });
  }
}

export {initToggleVisibility}
