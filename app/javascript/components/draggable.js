const draggables = document.querySelectorAll(".draggable");

let initY;
let initX;
let currentDraggable;

const start = (event) => {
  console.log(event);
  currentDraggable = event.currentTarget;
  initY = event.clientY - currentDraggable.offsetTop;
  initX = event.clientX - currentDraggable.offsetLeft;
  window.addEventListener("mousemove", drag);
}

const stop = (event) => {
  console.log(event);
  window.removeEventListener("mousemove", drag);
}

const drag = (event) => {
  console.log(currentDraggable);
  console.log(event.clientX, event.clientY);
  currentDraggable.style.top = `${event.clientY - initY}px`;
  currentDraggable.style.left = `${event.clientX - initX}px`;
}

const initDraggable = () => {
  draggables.forEach((draggable) => {
    draggable.addEventListener( "mousedown", start);
    draggable.addEventListener( "mouseup", stop);
  });
}
export {initDraggable}
