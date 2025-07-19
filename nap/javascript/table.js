// src: https://stackoverflow.com/a/49041392 from: https://github.com/nickgrealy
/**
 *
 * @param {*} tr
 * @param {*} idx
 * @returns
 */
function getCellValue(tr, idx) {
  return tr.children[idx].innerText || tr.children[idx].textContent;
}

/**
 *
 * @param {*} idx
 * @param {*} asc
 * @returns
 */
function comparer(idx, asc) {
  return function (a, b) {
    return function (v1, v2) {
      return (
        v1 !== "" && v2 !== "" && !isNaN(v1) && !isNaN(v2)
          ? v1 - v2
          : v1.toString().localeCompare(v2)
      )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));
    };
  };
}

/**
 * Adding an click event to all table headers
 */
document.querySelectorAll("th").forEach((th) =>
  th.addEventListener("click", () => {
    /**
     * Get all rows for the current Table, except the first, as it is (hopefully)
     * the header.
     */
    const table = th.closest("table");
    const tbody = table.querySelector("tbody");
    /**
     * Sort the rows and insert the table rows back into the right order
     */
    Array.from(table.querySelectorAll("tr:nth-child(n+2)"))
      .sort(
        comparer(
          Array.from(th.parentNode.children).indexOf(th),
          (this.asc = !this.asc)
        )
      )
      .forEach((tr) => tbody.appendChild(tr));
  })
);
