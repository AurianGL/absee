const closeModale = () => {

  const modale = document.querySelector("#colorSwatchEdit");
  const btnValidate = document.querySelector(".btn-circle-save");

if (modale && btnValidate) {
  btnValidate.addEventListener("click", (event) => {
    modale.modal('hide');
  })
}

}

export { closeModale };
