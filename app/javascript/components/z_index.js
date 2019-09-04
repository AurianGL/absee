const zs = document.querySelectorAll(".draggable")
const moodboard = document.querySelector(".moodboard")
let lastZ = moodboard.dataset.lastz
let t

const setZ = (event) => {
  lastZ++;
  t = event.currentTarget;
  t.style.zIndex = `${lastZ}`;
  saveZ(lastZ);
}

const saveZ = (z) => {
  const zForm = t.querySelector(".z-form");
  console.log(zForm)
  console.log(zForm.querySelector(".z-form-input"));
  zForm.querySelector(".z-form-input").value = z;
  zForm.querySelector(".z-form-submit").click();
}

const initSetZ = () => {
  zs.forEach((z) => {
    if ( z ) {
      z.addEventListener("mousedown", setZ);
    }
  })
}

export {initSetZ}
