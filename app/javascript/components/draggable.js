const handIcons = document.querySelectorAll(".hand-icon");

let initY;
let initX;
let currentDraggable;

const start = (event) => {
  // console.log(event);
  currentDraggable = event.currentTarget.parentElement;
  // console.log(currentDraggable)
  initY = event.clientY - currentDraggable.offsetTop;
  initX = event.clientX - currentDraggable.offsetLeft;
  window.addEventListener("mousemove", drag);
}

const stop = (event) => {
  // currentDraggable = event.currentTarget.parentElement;
  console.log(event);
  window.removeEventListener("mousemove", drag);
  savePosition( event.clientX, event.clientY, currentDraggable);
  // console.log(event.target.dataset.commentid)
}

const savePosition = ( x, y , currentDraggable) => {
  console.log(currentDraggable);
  const coordinateForm = currentDraggable.querySelector(".coordinate-form");
  coordinateForm.querySelector(".coordinate-form-x").value = x;
  coordinateForm.querySelector(".coordinate-form-y").value = y;
  coordinateForm.submit();
}

// const savePosition = (comment_id, x, y) => {
//   // fetch pour updater les champs x et y sur le modele comment
//   console.log(comment_id, x, y)
//   fetch(`/comments/${comment_id}`, {
//     method: "PATCH",
//     body: JSON.stringify({
//       "X": x,
//       "Y": y,
//     })
//   })
//     .then(response => {
//       console.log(response)
//       response.json()
//     })
//     .then((data) => {
//       console.log(data);
//   });
// };

const drag = (event) => {
  // console.log(currentDraggable);
  // console.log(event.clientX, event.clientY);
  currentDraggable.style.top = `${event.clientY - initY}px`;
  currentDraggable.style.left = `${event.clientX - initX}px`;
}

const initDraggable = () => {
  handIcons.forEach((handIcon) => {
    handIcon.addEventListener( "mousedown", start);
    handIcon.addEventListener( "mouseup", stop);
  });
}
export {initDraggable}
