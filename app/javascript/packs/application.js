import "bootstrap";
// import {initDraggable} from "../components/draggable";
// import {initCanvas} from "../components/canvas";
// import {initToggleVisibility} from "../components/toggle_visibility";
// import {initResize} from "../components/resize"
// import {closeModale} from "../components/closemodale"
import { slideBtn } from "../components/slideBtn"
slideBtn();

// import { popBtn } from "../components/slideBtn"
// popBtn();

import { displayBtn } from "../components/slideBtn"
displayBtn();

// TWEAK TO MAKE JQUERY AVAILABLE IN RAILSJS ERB
window.$ = $;

// initDraggable();
// initCanvas();
// initToggleVisibility();
// initResize();
// closeModale();
