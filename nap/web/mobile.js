/**
 * @function isTouchDevice
 * @returns {boolean} If the current device is a touch device 
 * isTouchDevice is a function that simply checks
 * through the "ontouchstart" in the document.documentElement
 * if the certain device, that is currently running the
 * code is a touch device
 */
const isTouchDevice = () =>
  navigator.maxTouchPoints || "ontouchstart" in document.documentElement;
