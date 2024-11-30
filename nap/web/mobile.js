const isTouchDevice = () =>
  navigator.maxTouchPoints || "ontouchstart" in document.documentElement;
