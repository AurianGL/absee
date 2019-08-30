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
  // console.log(event);
  window.removeEventListener("mousemove", drag);
  savePosition(event.target.dataset.commentid, event.clientX, event.clientY)
  // console.log(event.target.dataset.commentid)
}

// const savePosition = (comment_id, x, y) => {
//   // fetch pour updater les champs x et y sur le modele comment
//   console.log(comment_id, x, y)
//   fetch("/versions/:version_id/comments/:id", {
//     method: "PATCH",
//     body: JSON.stringify({
//       ":id": comment_id,
//       "X": x,
//       "Y": y,
//     })
//   })
// }

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
