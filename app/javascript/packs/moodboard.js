import "bootstrap";
import {initDraggable} from "../components/draggable";
import {initCanvas} from "../components/canvas";
import {initToggleVisibility} from "../components/toggle_visibility";
import {initResize} from "../components/resize"
import {closeModale} from "../components/closemodale"
import {initSetZ} from "../components/z_index"

// TWEAK TO MAKE JQUERY AVAILABLE IN RAILSJS ERB
window.jquery = $;

initSetZ();
initDraggable();
initCanvas();
initToggleVisibility();
initResize();
closeModale();
